# git wip command
function wip() {
    # Colors
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
    NC='\033[0m' # No Color

    # Prompt for commit message
    echo -e "${YELLOW}Enter commit message: ${NC}"
    read commit_message

    # Stage changes
    echo -e "${BLUE}Staging changes...${NC}"
    git add .
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to stage changes.${NC}"
        return 1
    else
        echo -e "${GREEN}Changes staged successfully.${NC}"
    fi

    # Commit changes
    echo -e "${BLUE}Committing changes...${NC}"
    git commit -m "$commit_message"
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to commit changes.${NC}"
        return 1
    else
        echo -e "${GREEN}Changes committed successfully.${NC}"
    fi

    # Push changes
    echo -e "${BLUE}Pushing changes...${NC}"
    git push
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to push changes.${NC}"
        return 1
    else
        echo -e "${GREEN}Changes pushed successfully.${NC}"
    fi
}

# Alias for the wp function
alias wip=wip

#colors
export PS1=$IBlack$Time12h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
if [ "$?" -eq "0" ]; then \
  # @4 - Clean repository - nothing to commit
  echo "'$Green'"$(__git_ps1 " (%s)"); \
else \
  # @5 - Changes to working tree
  echo "'$IRed'"$(__git_ps1 " {%s}"); \
fi) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
echo " '$Yellow$PathShort$Color_Off'\$ "; \
fi)'

# colours of ls command 
export CLICOLOR=1
export LSCOLORS=GxBxhxFxhxhxhxhxhxGxGx
