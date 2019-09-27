# Defined in - @ line 1
function cdg --description 'alias cdg cd (fzf < ~/bookmark)'
	cd (fzf < ~/bookmark) $argv;
end
