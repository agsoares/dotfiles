SPACESHIP_PROMPT_ORDER=(
    user           # Username section
    dir            # Current directory section
    line_sep       # Line break
    battery        # Battery level and status
    jobs           # Background jobs indicator
    exit_code      # Exit code section
    sudo           # Sudo indicator
    char           # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
    git_commit
    git_status
    
    git_branch
) 

SPACESHIP_GIT_COMMIT_SHOW=true
SPACESHIP_GIT_COMMIT_COLOR=grey