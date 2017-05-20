;;; Assign a custom icon for .tpl and file type association

;;; Define variables
!define STR `HKEY_CURRENT_USER\Software\Classes`

;;; Execute customs
${SegmentFile}

;; Write reg keys on launch
${SegmentPre}
	${registry::Write} `${STR}\.tpl` `` `TPlan.tpl` `REG_SZ` $0
	${registry::Write} `${STR}\TPlan.tpl\DefaultIcon` `` `$EXEDIR\App\AppInfo\FileTypeIcons\tpl.ico` `REG_SZ` $0
	${registry::Write} `${STR}\TPlan.tpl\shell\open\command` `` `$EXEDIR\TPlanWinPortable.exe "%1"` `REG_SZ` $0
!macroend

;; CleanUp reg keys on exit
${SegmentPost}
	${registry::DeleteKey} `${STR}\.tpl` $0
	${registry::DeleteKey} `${STR}\TPlan.tpl` $0
!macroend
