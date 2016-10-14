;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;;========================================
;;          啓動讀取來源
;;========================================
;;  __        ______        ___       _______  
;; |  |      /  __  \      /   \     |       \ 
;; |  |     |  |  |  |    /  ^  \    |  .--.  |
;; |  |     |  |  |  |   /  /_\  \   |  |  |  |
;; |  `----.|  `--'  |  /  _____  \  |  '--'  |
;; |_______| \______/  /__/     \__\ |_______/ 
                                            
;; 設定 melpa 安裝源
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")
	       ))
(package-initialize)
;;掃描指定目錄讀取自訂的 el ;; 例如 (add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/")



;;記住 emacs 上次的所有紀錄， (kill-ring，命令記錄……)，局部變量，寄存器，打開的文件，修改過的文件和最後修改的位置
;; 會跟 DESKTOP 有衝突？
(require 'session) 
(add-hook 'after-init-hook 'session-initialize)
(setq desktop-globals-to-save '(desktop-missing-file-warning))

;;保存 Emacs 的``桌面環境'' — buffers、以及 buffer 的文件名、major modes 和位置等等，下一次 Emacs 啟動的時候就會自動加載
(desktop-save-mode)

;; .___  ___.   ______    _______
;; |   \/   |  /  __  \  |   ____|
;; |  \  /  | |  |  |  | |  |__
;; |  |\/|  | |  |  |  | |   __|
;; |  |  |  | |  `--'  | |  |____
;; |__|  |__|  \______/  |_______|
;; MOE Theme 美化界面
    ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme/")
    ;; (add-to-list 'load-path "~/.emacs.d/elpa/moe-theme/")
    ;; (require 'moe-theme)
    ;; ;; Resize titles (optional).
    ;; (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
    ;; (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
    ;; (setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))
    ;; (setq moe-theme-highlight-buffer-id nil)
    ;; (load-theme 'moe-dark t)

;; monokai-theme 美化界面
;; (require 'monokai-theme)

;;========================================
;;          常駐設置
;;========================================
;; .______        ___           _______. _______         _______. _______ .___________. __    __  .______   
;; |   _  \      /   \         /       ||   ____|       /       ||   ____||           ||  |  |  | |   _  \  
;; |  |_)  |    /  ^  \       |   (----`|  |__         |   (----`|  |__   `---|  |----`|  |  |  | |  |_)  | 
;; |   _  <    /  /_\  \       \   \    |   __|         \   \    |   __|      |  |     |  |  |  | |   ___/  
;; |  |_)  |  /  _____  \  .----)   |   |  |____    .----)   |   |  |____     |  |     |  `--'  | |  |      
;; |______/  /__/     \__\ |_______/    |_______|   |_______/    |_______|    |__|      \______/  | _|

;; 設定基本資料
(setq user-full-name "SìhSèngiǔ")
(setq user-mail-address "sihsengiu@protonmail.com")

;; 設置焦點光標為豎線
(setq-default cursor-type 'bar)
;; 設置光標為方塊（原始設定）
;; (setq-default cursor-type 'box)

;; (setq mouse-drag-copy-region t)   ;; 自動複製 Copy 滑鼠選中的文本

(setq org-hide-emphasis-markers t)  ;; 讓 org 的輕語言標記直接顯示，不在詞組旁邊顯示 / = * 等字元

(set-locale-environment "utf-8") ;; 設定預設 UTF-8

;;;; ================
;;;; tabbar-mode
;;;; ================
(require 'tabbar)
(tabbar-mode 1)
;; (require 'tabbar-tweak)

(setq truncate-partial-width-windows nil) ;; 斷行設定 https://letoh.wordpress.com/2009/02/12/line-wrap-in-emacs/

(setq inhibit-startup-message t);關閉起動時閃屏

(setq visible-bell t);關閉出錯時的提示聲

(show-paren-mode t);顯示括號匹配

(column-number-mode t);在狀態列顯示列號

;; 設定圖片寬度
;;(setq org-image-actual-width 300);=> always resize inline images to 300 pixels
(setq org-image-actual-width '(800));=> if there is a #+ATTR.*: width="200", resize to 200,otherwise resize to 800
;;(setq org-image-actual-width nil);=> if there is a #+ATTR.*: width="200", resize to 200,otherwise don't resize
;;----------------

;;(global-hl-line-mode 1) ;;當前行高亮顯示
;;(tool-bar-mode -1);;隱藏工具列
;;(menu-bar-mode -1);;隱藏選單

(setq frame-title-format "%n%F/%b");;在窗口的標題欄上顯示文件名稱

;;同名檔案不混淆（同名檔案同時開啟時，會在 buffer 加上目錄名稱）
(require 'uniquify)
(setq
uniquify-buffer-name-style 'post-forward
uniquify-separator ":")

;;(global-linum-mode 1);;顯示行號,佔資源

(setq lazy-highlight-cleanup nil);;讓 Isearch 不會再主動清除搜尋的高亮顯示

;; (display-time-mode t) ;; 啟用時間顯示設置，在 minibuffer 上面的那個槓上

(setq auto-image-file-mode t) ;;讓 Emacs 可以直接打開/顯示圖片。


;;鼠標滾輪，默認的滾動太快，這裡改為 3 行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

;;防止頁面滾動時跳動，scroll-margin 3 可以在靠近屏幕邊沿 3 行時就開始滾動，可以很好的看到上下文。
(setq scroll-step 1
  scroll-margin 3
  scroll-conservatively 10000)

;; 記住光標上次的位置
;; remember cursor position, for emacs 25.1 or later
;; (save-place-mode 1)
;; For before emacs 25.1, the syntax is different. Use this code:
;; remember cursor position
;; (if (version< emacs-version "25.0")
;;     (progn
;;     (require 'saveplace)
;;     (setq-default save-place t)
;; (save-place-mode 1)

;;;;;;;;
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))
;;	  (define-key org-bullets-bullet-map [mouse-1] nil) ;這行是禁止滑鼠點擊摺疊，如果需要滑鼠點擊摺疊則把這行註解掉。
)

;;;;;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; ============= 整合系統剪貼簿複製貼上
;; http://ergoemacs.org/emacs/emacs_x11_sync_clipboard.html
;; after copy Ctrl+c in Linux X11, you can paste by `yank' in emacs
(setq x-select-enable-clipboard t)
;; after mouse selection in X11, you can paste by `yank' in emacs
(setq x-select-enable-primary t)

(delete-selection-mode 1) ;; 將刪除功能配置成與其他編輯器相同，選中一段文字之後輸入字符會替換掉你選中的文字。

;;自動斷行，每行 80 個字符
;;(add-hook 'message-mode-hook (lambda ()
;;(setq fill-column 80)
;;(turn-on-auto-fill)))

;;約會提醒
(setq appt-issue-message t)

;; 設置 tab 大小為 4 個空格，要插入 tab 則使用  C-q tab
;; (setq default-tab-width 4)
;; (setq-default indent-tabs-mode nil)

;;========================================
;;          custom 基本設定 可在 Options > Customize Emacs 設定
;;========================================
;;   ______  __    __       _______.___________.  ______   .___  ___. 
;;  /      ||  |  |  |     /       |           | /  __  \  |   \/   | 
;; |  ,----'|  |  |  |    |   (----`---|  |----`|  |  |  | |  \  /  | 
;; |  |     |  |  |  |     \   \       |  |     |  |  |  | |  |\/|  | 
;; |  `----.|  `--'  | .----)   |      |  |     |  `--'  | |  |  |  | 
;;  \______| \______/  |_______/       |__|      \______/  |__|  |__| 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("2288379e9e9fe0ef64e49527693cbbe8918e1d5fc1040ca66fe04f0a77f7fb84" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "0d70e2ae0e2b0933ec7eb9a93db20ee6329da95d1f87b7bb27b520e90a3ee182" "cfa7053f155661faa33ef648f55d524eb97854f8f0ff9ff91a08b3ba47a9a25f" default)))
 '(neo-create-file-auto-open nil)
 '(neo-window-fixed-size nil)
 '(org-agenda-files (quote ("/home/kevin/inbox/doc/")))
 '(org-capture-templates
   (quote
    (("f" "名言佳句" plain
      (file+headline "/home/kevin/inbox/doc/famous_saying.org" "暫存")
      "*** %?")
     ("s" "schedule" entry
      (file+headline "/home/kevin/inbox/doc/calendar.org" "schedule")
      "** %?
 SCHEDULED: %t 

")
     ("d" "diary" plain
      (file+datetree+prompt "/home/kevin/inbox/doc/diary.org")
      "")
     ("c" "collect everything" entry
      (file "/home/kevin/inbox/doc/capture.org")
      "")
     ("w" "web capture" entry
      (file+headline "/home/kevin/inbox/doc/capture.org" "網路資料")
      ""))))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.mht\\|.html\\|.maff\\|.htm\\'" . "firefox %s")
     ("\\.xls\\|.xlsx\\'" . system)
     ("\\.jpg\\|.png\\|.gif\\|.bmp\\'" . "xnview %s")
     ("\\.pdf\\'" . system)
     ("\\.mp4\\|.m4a\\|.mp3\\|.avi\\|.mkv\\'" . "vlc media player %s"))))
 '(org-startup-folded t)
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (org multiple-cursors smartparens helm helm-core auto-complete crux session orgtbl-aggregate neotree fill-column-indicator ac-helm)))
 '(save-place-mode t)
 '(show-paren-mode t)
 '(tabbar-separator (quote (0.5))))
 ;; 顯示相對應的括號
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono CJK TC" :foundry "GOOG" :slant normal :weight normal :height 128 :width normal)))))


;;========================================
;;          org-mode 設定
;;========================================
;;   ______   .______        _______    .___  ___.   ______    _______   _______ 
;;  /  __  \  |   _  \      /  _____|   |   \/   |  /  __  \  |       \ |   ____|
;; |  |  |  | |  |_)  |    |  |  __     |  \  /  | |  |  |  | |  .--.  ||  |__   
;; |  |  |  | |      /     |  | |_ |    |  |\/|  | |  |  |  | |  |  |  ||   __|  
;; |  `--'  | |  |\  \----.|  |__| |    |  |  |  | |  `--'  | |  '--'  ||  |____ 
;;  \______/  | _| `._____| \______|    |__|  |__|  \______/  |_______/ |_______|

;; 開啓 txt 檔案時自動載入 org-mode
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; 新增連結快速鍵
(global-set-key "\C-cl" 'org-store-link)

;; 新增 aggregate.el
;; https://github.com/tbanel/orgaggregate
;; http://rubikitch.com/2014/12/02/org-aggregate/
;;M-x package-list-packages ;;Then browse the list of available packages and install orgtbl-aggregate ;;Alternatively, you can download the lisp files, and load them:
(load-file "~/.emacs.d/plugins/orgtbl-aggregate.el")
(load-file "~/.emacs.d/plugins/org-insert-dblock.el") ;; optional, extends C-c C-c i

;; Agenda View設定
;; 官網快速鍵 http://orgmode.org/manual/Agenda-commands.html#Agenda-commands
(global-set-key "\C-ca" 'org-agenda) 
(global-set-key [f11] 'org-agenda-list) ;按 F11 就顯示 agenda-list
(setq org-agenda-include-diary t);整合 diary mode 和 org 的 agenda mode
(setq org-agenda-ndays 15);; 設定 Agenda 預設視圖爲 自訂天數。

;; 添加 Org-mode 文本內語法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;啟用 org capture 快速鍵 (也可直接輸入 alt+X  org-capture 啟動)
(define-key global-map "\C-cc" 'org-capture)

;; emacs org-mode 自動換行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 

;;設置 sentence-end 可以識別中文標點。不用在 fill 時在句號後插入兩個空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; org-mode 的 支援語法
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   ;; (R . t) 
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . nil)
   (latex . t)
   (ledger . t)
   (ocaml . nil)
   (octave . t)
   (python . t)
   (ruby . t)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . t)))
;; 新增快速語法模板 TEMPLATE，輸入 <d 後按 TAB
(add-to-list 'org-structure-template-alist
             '("d" "#+NAME: ?\n#+BEGIN_SRC dot :file /home/kevin/inbox/media/dot/圖檔名稱.png :exports results\n\n#+END_SRC") ;; dot 語法，圖檔名稱手工改爲想要的檔名
	     )

;; 設定優先級範圍和默認任務的優先級
(setq org-highest-priority ?A) (setq org-lowest-priority ?D) (setq
org-default-priority ?B)
;; 優先級醒目外觀
(setq org-priority-faces
'(
(?A . (:background "dark" :foreground "red" :weight bold))
(?B . (:background "dark" :foreground "yellow" :weight bold))
(?C . (:background "dark" :foreground "Green" :weight bold))
(?D . (:background "dark" :foreground "DodgerBlue" :weight bold))
))
;;;  M-x list-colors-display 顯示Emacs所有的顏色，方便我們來進行配色

;; 粗體文字格式 高亮
(defface hi-red-b '((t (:foreground "#ff46ff"))) t) (defun org-bold-highlight () (interactive) (hi-lock-mode) (highlight-regexp "[ \\t]\\(\\*\\(\\S-[^*]+\\S-\\|[^*]\\{1,2\\}\\)\\*\\)[ \\t\\n]*" 'hi-red-b)) (add-hook 'org-mode-hook 'org-bold-highlight)
;; 作者：匿名用户;; 链接：https://www.zhihu.com/question/28830039/answer/47043443;; 来源：知乎;; 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

;;;;;;;;;; org-mode 快速截圖片
;; 1. 需先安裝 scrot，會用這個工具來擷取圖片
;; 2. 預設存檔資料夾要在 org-screenshot.el 裡面設定
;; 3. 原始設定是 (concat buffer-file-name "_screenshot/")，我改爲 (concat "~/inbox/media/screenshot/")
;; (add-hook 'org-mode-hook 'iimage-mode)   ;; enable iimage-mode
(require 'org-screenshot) 
(global-set-key (kbd "C-c p") 'org-screenshot) ;; 按下快速鍵調用 Scrot 來截圖

;;========================================
;;           操作設定
;;========================================
;;  __  ___  ___________    ____ .______    __  .__   __.  _______  
;; |  |/  / |   ____\   \  /   / |   _  \  |  | |  \ |  | |       \ 
;; |  '  /  |  |__   \   \/   /  |  |_)  | |  | |   \|  | |  .--.  |
;; |    <   |   __|   \_    _/   |   _  <  |  | |  . `  | |  |  |  |
;; |  .  \  |  |____    |  |     |  |_)  | |  | |  |\   | |  '--'  |
;; |__|\__\ |_______|   |__|     |______/  |__| |__| \__| |_______/ 

;; ============= 定位鍵
(global-set-key (kbd "C-z") 'set-mark-command) ;; 因爲原始快速鍵 Ctrl+space 被系統或是其他程式佔用，所以用 C-z 這個沒有使用的鍵來代替。

;; =============== 刪除前一個字元，取代了(mark-paragraph)可以用 C-M-E 還有 C-M-A 來選擇前一段和後一段。
;; (global-set-key (kbd "C-?") 'help-command)
;; (global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char) ;; 刪除前一個字元
(global-set-key (kbd "M-h") 'backward-kill-word) ;; 刪除前一個字串
(define-key org-mode-map (kbd "M-h") 'backward-kill-word)  ;; 要多設定這行 org-mode 才可以使用 刪除前一個字串。

;; =============
;;  快速鍵複製整行還有刪除整行
;;  C-w 剪下整行，M-w 複製整行，C-k 剪下光標所在處到行尾，M-k 複製光標所在處到行尾
;;  Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-line (before check-position activate)
(if (member major-mode
'(emacs-lisp-mode scheme-mode lisp-mode
c-mode c++-mode objc-mode js-mode
latex-mode plain-tex-mode))
(if (and (eolp) (not (bolp)))
(progn (forward-char 1)
(just-one-space 0)
(backward-char 1)))))

(defadvice kill-ring-save (before slick-copy activate compile)
"When called interactively with no active region, copy a single line
instead."
(interactive (if mark-active (list (region-beginning) (region-end))
(message "Copied line")
(list (line-beginning-position)
(line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
"When called interactively with no active region, kill a single line
instead."
(interactive
(if mark-active (list (region-beginning) (region-end))
(list (line-beginning-position)
(line-beginning-position 2)))))

;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
"Copy lines (as many as prefix argument) in the kill ring"
(interactive "p")
(kill-ring-save (point)
(line-end-position))
;; (line-beginning-position (+ 1 arg)))
(message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(global-set-key (kbd "M-k") 'qiang-copy-line)

;; ==============
;;recents 最近開啟的檔案，C-x C-r
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 35)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; ===============
;;啟用 ibuffer(比預設的那個 buffer selector 好用一點)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;(global-set-key [(f4)] 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; ================
;; smex 輸入 M-x 後 會顯示可用模式，方便輸入指令，且會記憶之前操作過的指令
;; (load "~/.emacs.d/plugins/smex.el")
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ================
;; mwim (Move Where I Mean) C-a / C-e 移動遊標到行首/行尾的非空白處，再按一次到真正的行首/行尾
;; https://github.com/alezost/mwim.el
;; (require 'mwim)
;; (add-to-list 'load-path "/path/to/mwim-dir")
(autoload 'mwim-beginning-of-code-or-line "mwim" nil t)
(autoload 'mwim-beginning-of-line-or-code "mwim" nil t)
(autoload 'mwim-end-of-code-or-line "mwim" nil t)
(autoload 'mwim-end-of-line-or-code "mwim" nil t)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)
(global-set-key (kbd "<home>") 'mwim-beginning-of-line-or-code)
(global-set-key (kbd "<end>") 'mwim-end-of-line-or-code)
(define-key org-mode-map (kbd "C-a") 'mwim-beginning-of-code-or-line)  ;; 要多設定這行 org-mode 才可以使用
(define-key org-mode-map (kbd "C-e") 'mwim-end-of-code-or-line)  ;; 要多設定這行 org-mode 才可以使用
;; ================
;; 按下 C-= 可以快速增加選取範圍，C--可以減少範圍。
;; https://github.com/magnars/expand-region.el
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; =================
;;;;;; Helm 系列功能
;; __    __   _______  __      .___        ___. 
;; |  |  |  | |   ____||  |     |   \     /   | 
;; |  |__|  | |  |__   |  |     |   \    /    | 
;; |   __   | |   __|  |  |     |  | \ /|     | 
;; |  |  |  | |  |____ |  `----.|  |    |     | 
;; |__|  |__| |_______||_______||__|    |_ ___|  
;; =================
(require 'helm-config)
(global-set-key (kbd "C-s") 'helm-occur) ; 文件全文搜索，按 TAB 顯示擴展命令，同時可以按 C-j 臨時跳轉到某個搜索結果。
(global-set-key (kbd "M-y") 'helm-show-kill-ring) ; 代替默認的 M-y ，可以在 emacs 剪切和複製的內容列表中選擇/搜索。
(global-set-key (kbd "C-x b") 'helm-mini)	  ; 代替默認的 C-x b ，顯示緩衝區列表，可搜索。
(global-set-key (kbd "C-x C-f") 'helm-find-files) ; 取代 buffer 管理 還有 開啓檔案列表。
(global-set-key (kbd "M-x") 'helm-M-x)		  ; 讓 M-x 可以更好搜尋使用。
(global-set-key (kbd "C-c h") 'helm-command-prefix) ; 設定後 C-c h 後面才能再接其他快速鍵。
(global-set-key (kbd "C-c h SPC") 'helm-all-mark-rings) ; 在窗口處列出當前文件和全局 mark-rings。
(global-set-key (kbd "C-c h x") 'helm-register) ; 查看並列出所有 Emacs 寄存器 (emacs register)。

(setq helm-split-window-in-side-p           t ; 使用 helm 功能，不開啓新視窗或關閉其他視窗
      helm-move-to-line-cycle-in-source     nil ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t
      helm-M-x-fuzzy-match                  t ; 模糊搜索
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match               t ; 全域搜尋 C-c h l 啟動， C-! 暫停/繼續進行實時搜索，大硬盤搜索遲緩時可用。 
      helm-recentf-fuzzy-match              t
      helm-lisp-fuzzy-completion            t ; 提供 lisp 命令補全/候選，使用該命令之前必須先鍵入幾個 lisp 關鍵詞，哪怕是一個括號。 
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)
;; helm-semantic-or-imenu 鍵入 C-c h i 進入，列出當前文件章節/節點列表，選擇後跳轉到指定章節/節點。 
;; helm-surfraw  鍵入C-c h s  一個快速搜索命令，包含多個搜索引擎，會跳轉到瀏覽器。
;; helm-find  C-c h / 默認情況下只搜索當前目錄， C-u C-c h / 可指定要搜索的目錄。在 helm-find-files （即 C-x C-f ）窗口中鍵入 C-c / 同樣可以調用該命令。 
;; helm-google-suggest  (global-set-key (kbd "C-c h g") 'helm-google-suggest) 交互式輸入檢索詞，並得到 helm 來自 google 的結果，當然可以用於其他服務，諸如：Google Maps、Google News、Youtube、Wikipedia 等等。 
;; helm-color  用於查看/複製顏色的十六進制值。
;; helm-regexp  實時顯示某個正則表達式效果，F1 保存正則表達式作為一個KILL RING，F2 替換當前正則表達式，F3 保存正則表達式作為當前提示
;; helm-info-*  helm emacs info 幫助系統，提供搜索/補全功能，鍵入 M-x helm-info 可以看到所有可選擇的列表。

;; 基本操作
;; C-h f           相當於 describle-function，列出所有函數
;; C-h v           相當於 describle-variable，列出所有變量
;; C-h w           相當於 where-is，列出所有鍵綁定
;; .....

;; 在 minibuffer 下
;; C-s             相當於 grep，可模糊/正則搜索，helm-ff-run-grep
;; C-n/C-p         移動光標
;; C-v/M-v         快速移動
;; C-k             回到根目錄，清空原先的內容
;; C-l             返回上一級
;; C-c C-i         將選中的文件絕對插入緩衝區
;; C-t             Helm.org
;; C-x @           用 root 打開文件
;; C-c h           切換到文件打開歷史列表
;; M-p             切換到其他目錄
;; M-a             選擇所有，可與 C-c C-i 配合使用
;; C-z             標記 MARK，此鍵是我自己修改的
;; M-D             刪除選中的文件
;; M-R             重命名選定文件
;; M-C             複製選定文件
;; M-S             選定文件建立軟連接
;; M-H             選定文件建立硬鏈接

;; =================
;; ACE JUMP - jump mode major function  快速跳轉遊標到輸入的文字
;; =================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"  t)
;; ace-pinyin 讓 ace jump 支援中文
(require 'ace-pinyin)
(setq ace-pinyin-use-avy nil) ;; uncomment if you want to use `ace-jump-mode' 使用 ace jump，註解掉則改使用 avy
(ace-pinyin-mode +1)
(ace-pinyin-global-mode +1)
(setq ace-pinyin-simplified-chinese-only-p nil) ;; 支援漢字，簡體+繁體字
;; (define-key global-map (kbd "C-c j e") 'ace-jump-char-mode) ;; 跳轉到英文
(global-set-key (kbd "C-c j") 'ace-pinyin-jump-char) ;; 跳轉到漢字+英文，若要增加其他快速鍵，則改爲"C-c j c"，避免重複。
;; (global-set-key (kbd "C-c j l") 'ace-jump-line-mode) ;; 跳轉到行

;;;; ==================
;; 按[f2] 快速打開配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key [f2] 'open-init-file) ;; 將函數 open-init-file 綁定到 [f2] 鍵上

;;;; ==================
;; emacs-neotree 文件導航樹
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; 快捷鍵 （NeoTree 窗口有效）

;;     n 下一行 ， p 上一行。
;;     SPC or RET or TAB 若是文件，在其他buffer打開；若是目錄，可切換摺疊、收起。
;;     g 刷新樹。
;;     A 最大/最小化 NeoTree 窗口
;;     H 切換顯示隱藏文件。
;;     C-c C-n 創建文件，若以 / 結尾則表示創建文件夾。
;;     C-c C-d 刪除文件或目錄。
;;     C-c C-r 重命名文件或目錄。
;;     C-c C-c 改變根目錄。

;;;; ==================
;;; 代碼參考線: fill-column-indicator   安裝  M-x package-install fill-column-indicator
;;; 默認不顯示，快捷鍵綁定到 M-|，隨時切換。
;; (require 'fill-column-indicator)
;; (setq fci-rule-color "#D15FEE")
;; (setq fci-rule-column 80)
;; (define-globalized-minor-mode
;;   global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; ;;(global-fci-mode 1)
;; (global-set-key (kbd "M-|") 'global-fci-mode)

;;;; =================
;; 快速移動列表 A 只能在同個 Buffer 操作，優點是可少輸入檔案名稱
;; 可以用 C-c C-w (org-refile)：會把當前光標下的 entry 移動到另一個 heading 下（會自動調整 heading 的級別）。
;; 默認目的地是當前 buffer 中的一級 heading，可透過 org-refile-targets 調整目的地。
;; 設置目的地為當前 buffer 中一級和二級 heading
;; (setq org-refile-targets (list (cons nil (cons :maxlevel 2))))

;;;; ================
;; 快速移動列表 B  可以在其他 Buffer 操作，需多輸入 buffer 名稱
;; 可以用 C-c C-w (org-refile)  跨 buffer 移動到其他檔案，輸入位置像這樣 Work.org/Appointments 可按 TAB 補全。
;; 用 C-c M-w (org-copy)   跨 buffer 複製到其他檔案
;; any headline with level <= 2 is a target
(setq org-refile-targets '((nil :maxlevel . 2)
                                ; all top-level headlines in the
                                ; current buffer are used (first) as a
                                ; refile target
                           (org-agenda-files :maxlevel . 2)))
;; provide refile targets as paths, including the file name
;; (without directory) as level 1 of the path
(setq org-refile-use-outline-path 'file)
;; allow to create new nodes (must be confirmed by the user) as
;; refile targets
(setq org-refile-allow-creating-parent-nodes 'confirm)
;; refile only within the current buffer
(defun my/org-refile-within-current-buffer ()
  "Move the entry at point to another heading in the current buffer."
  (interactive)
  (let ((org-refile-targets '((nil :maxlevel . 5))))
    (org-refile)))

;;========================================
;;   ================ 視窗操作
;;========================================
;; ____    __    ____  __  .__   __.  _______   ______   ____    __    ____ 
;; \   \  /  \  /   / |  | |  \ |  | |       \ /  __  \  \   \  /  \  /   / 
;;  \   \/    \/   /  |  | |   \|  | |  .--.  |  |  |  |  \   \/    \/   /  
;;   \            /   |  | |  . `  | |  |  |  |  |  |  |   \            /   
;;    \    /\    /    |  | |  |\   | |  '--'  |  `--'  |    \    /\    /    
;;     \__/  \__/     |__| |__| \__| |_______/ \______/      \__/  \__/     
      
;; 快速把焦點移動到其他 buffer，emacs 內建是按下 C-x o  來切換 buffer。
;; 這樣就可以用 Alt+Shift+s/z/x/c 來向上/下/左/右切換 window，而且在標準 qwerty 鍵盤上可以單手操作。如果你有其他更偏好的 key-binding 請自行修改。
(global-set-key (kbd "M-S") 'windmove-up)
(global-set-key (kbd "M-X") 'windmove-down)
(global-set-key (kbd "M-C") 'windmove-right)
(global-set-key (kbd "M-Z") 'windmove-left)
(global-set-key "\C-xk" 'kill-this-buffer) ;; 按下 C-x k 立即關閉掉當前的 buffer
;;;; ================
;; switch-window 視窗超過兩個 buffer 時可以選擇數字快速移動到其他 Buffer ，取代原本的快速鍵
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
;;;; ================
;; window分割快捷鍵
(global-set-key (kbd "M-1") 'delete-other-windows) ;; 關閉其他
(global-set-key (kbd "M-2") 'split-window-below) ;; 分割上下
(global-set-key (kbd "M-3") 'split-window-right) ;; 分割左右
(global-set-key (kbd "M-4") 'delete-window) ;; 關閉此頁	
;;;; ================
;; 對調兩個 Buffer 
(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
(global-set-key (kbd "M-9") 'transpose-buffers)


;;========================================
;;           常用模式 MODE
;;========================================
;;   ______   .___________. __    __   _______ .______         .___  ___.   ______    _______   _______ 
;;  /  __  \  |           ||  |  |  | |   ____||   _  \        |   \/   |  /  __  \  |       \ |   ____|
;; |  |  |  | `---|  |----`|  |__|  | |  |__   |  |_)  |       |  \  /  | |  |  |  | |  .--.  ||  |__   
;; |  |  |  |     |  |     |   __   | |   __|  |      /        |  |\/|  | |  |  |  | |  |  |  ||   __|  
;; |  `--'  |     |  |     |  |  |  | |  |____ |  |\  \----.   |  |  |  | |  `--'  | |  '--'  ||  |____ 
;;  \______/      |__|     |__|  |__| |_______|| _| `._____|   |__|  |__|  \______/  |_______/ |_______|
;; ================
;;undo-tree-mode 還原樹模式
;;(提醒：redo 會變成 C-?)
;;C-x u 進入 undo-tree-visualizer-mode，t 顯示時間戳。
(require 'undo-tree)
(global-undo-tree-mode)

;; =============================
(global-set-key [f9] 'view-mode)        ; 只讀方式查看文件

;; =============================
;; 讓 emacs 增加 todo.txt 模式
(load "todotxt")
(require 'todotxt)
(add-to-list 'auto-mode-alist '("\\todo.txt\\'" . todotxt-mode))
(global-set-key (kbd "C-x t") 'todotxt)

;; =============================
;; markdown-mode
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; =============================
;; 自動補全模式 auto-complete-config，自動填滿的好用功能
;; 輸入 M-x auto-complete-mode 啟用，M-n/p 上下選擇
;; 請自訂字典還有 el 位址
;; (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20160310.2248")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160710.1544/dict")

;; =============================
;; smartparens 自動補上對應的括號
(require 'smartparens-config)
(smartparens-global-mode 1)

;; =============================
;; multiple-cursors 多游標編輯（區塊編輯、隔行編輯、多行編輯）
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ;; 啓動多游標編輯
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click) ;;用滑鼠點選增加要編輯行數
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ;; 增加選擇下一行
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this) ;; 增加選擇上一行
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this) ;;所有選擇的行數執行同樣指令

;; =============================
;; autorevert stuff 跟其他編輯器共用文件時，即時更新文件變化
(autoload 'auto-revert-mode "autorevert" nil t)
(autoload 'turn-on-auto-revert-mode "autorevert" nil nil)
(autoload 'global-auto-revert-mode "autorevert" nil t)
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; =============================
;; Occur Mode 把所有的搜索結果都列到一個名為 *Occur* buffer 中。使用 M-s o 調用 occur 函數，搜索當前文檔。
;;   M-g n : 下一個匹配項
;;  M-g p : 上一個匹配項
;;  e : 進入 occur-edit-mode，可以編輯搜索結果
;;  C-c C-c : 退出編輯模式
;;  g : 刷新搜索結果
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;; =============================
;; 縮寫補全 M-x abbrev-mode 
;; 使用下面的代碼我們可以開啟 abbrev 模式並定義一個縮寫表，每當我們輸入下面的縮寫並以空格結束時，Emacs 就會將其自動展開成為我們所需要的字符串。
;; 在要縮寫的字串後面輸入 C-x a i g  後輸入想要轉換輸出的字串
;; 記錄過的縮寫字串會自動儲存 The abbrevs are automatically saved between sessions in a file ~/.abbrev_defs.
;; 範本  https://www.emacswiki.org/emacs/AbbrevMode#toc6  
(abbrev-mode 1)
(setq abbrev-file-name             ;; tell emacs where to read abbrev
        "~/.emacs.d/abbrev_defs")    ;; definitions from...
(setq-default abbrev-mode t)

;; ================================
;; org-present-mode 讓文件變成像是 PPT 幻燈片一樣 且鎖定唯讀
(autoload 'org-present "org-present" nil t)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                ; (org-present-big) ;進入模式後，讓字體變大
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                ; (org-present-small) ;退出模式後，讓字體變小
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))
;; Then start the minor mode with:  M-x org-present
;; Keys are:
;;     left/right for movement
;;     C-c C-= for large txt
;;     C-c C-- for small text
;;     C-c C-q for quit (which will return you back to vanilla org-mode)
;;     C-c < and C-c > to jump to first/last slide

;; =============================
;; which-key 快速鍵提示  M-x package-install which-key   按下快速鍵後，會提示後面該按什麼
(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)
;;;; 顯示在底部 Side Window Bottom Option
;; (which-key-setup-side-window-bottom)
;;;; 顯示在右邊
;;;;(which-key-setup-side-window-right)
;;;; 顯示在右邊若是沒空間顯示在下方
(which-key-setup-side-window-right-bottom)

;; =============================
;; 自動啓動 Ledger-mode
(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
(add-to-list 'load-path
             (expand-file-name "/home/kevin/.emacs.d/plugins/ledger-mode"))
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
;; http://melpa.org/#/ledger-mode

;; =============================
;; 使用 C-x d 就可以進入 Dired Mode
(put 'dired-find-alternate-file 'disabled nil) ;; 讓 Dired Mode 只使用一個視窗
;; 基本操作
;;     Enter 開啟檔案
;;     + 創建目錄
;;     g 刷新目錄
;;     C 拷貝
;;     D 刪除
;;     R 重命名/移動檔案
;;     d 標記刪除
;;     u 取消標記
;;     x 執行所有的標記
;;     Z 以 gzip 壓縮/解壓縮
;;     m 	標記單一檔案
;;     u 	反標記單一檔案
;;     U 	反標記所有已標記的檔案
;;     % m	標記符合特定表達式的檔案
;;     ^ 	回上一層 (../)
;;     a 	在當前 buffer 開新目錄

;; =============================
;; yasnippet-mode 模板替換系統  https://github.com/joaotavora/yasnippet
;; install
;; $ cd ~/.emacs.d/plugins
;; $ git clone --recursive https://github.com/capitaomorte/yasnippet
;; Add the following in your .emacs file:
;; (add-to-list 'load-path  "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; Add your own snippets to ~/.emacs.d/snippets by placing files there or invoking yas-new-snippet.

;; =============================
(require 'hungry-delete) ;; 使用 Backspace 還有 Delete 時儘可能的刪除多餘空格
(global-hungry-delete-mode)

;; =============================
;; org-eww-mode  在 org 文件存檔時直接顯示文件在網頁上呈現的預覽狀態
;; https://github.com/lujun9972/org-eww
(require 'org-eww)
(add-hook 'org-mode-hook 'org-eww-mode)

;; On opening Org-Mode file, press ‘C-c M-p’ to turn on preview at save, then everytime current org-file saved, an eww buffer will show the exported html file. ‘C-c M-P’ to turn off.

;; Alternatively, execute the command `org-eww-turn-on-preview-at-save’ to turn on this feature, and use the command `org-eww-turn-off-preview-at-save’ to turn off.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  備份與加密
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .______        ___       ______  __  ___  __    __  .______   
;; |   _  \      /   \     /      ||  |/  / |  |  |  | |   _  \  
;; |  |_)  |    /  ^  \   |  ,----'|  '  /  |  |  |  | |  |_)  | 
;; |   _  <    /  /_\  \  |  |     |    <   |  |  |  | |   ___/  
;; |  |_)  |  /  _____  \ |  `----.|  .  \  |  `--'  | |  |      
;; |______/  /__/     \__\ \______||__|\__\  \______/  | _|

;; 設定制作備份時的版本控制。
;; 保留最原始的兩個版本和最新的五個版本。並且備份的時候，備份文件是複本，而不是原件。 
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/.autosave"))) ;;設定自動備份檔案儲存的目錄
(setq backup-by-copying t)

;;   ______ .______     ____    ____ .______   .___________.
;;  /      ||   _  \    \   \  /   / |   _  \  |           |
;; |  ,----'|  |_)  |    \   \/   /  |  |_)  | `---|  |----`
;; |  |     |      /      \_    _/   |   ___/      |  |     
;; |  `----.|  |\  \----.   |  |     |  |          |  |     
;;  \______|| _| `._____|   |__|     | _|          |__|     
;;org-mode 加密設定
;; (require 'org-crypt) ;; 當被加密的部份要存入硬碟時，自動加密回去
;; (org-crypt-use-before-save-magic) ;; 設定要加密的 tag 標籤為 secret
;; (setq org-crypt-tag-matcher "secret");; 避免 secret 這個 tag 被子項目繼承 造成重複加密(但是子項目還是會被加密喔)
;; (setq org-tags-exclude-from-inheritance (quote ("secret")));; 用於加密的 GPG 金鑰,可以設定任何 ID 或是設成 nil 來使用對稱式加密 (symmetric encryption)
;; (setq org-crypt-key nil);; M-x org-decrypt-entry  顯示加密內容


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;        行事曆設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  _______       ___   .___________. _______ 
;; |       \     /   \  |           ||   ____|
;; |  .--.  |   /  ^  \ `---|  |----`|  |__   
;; |  |  |  |  /  /_\  \    |  |     |   __|  
;; |  '--'  | /  _____  \   |  |     |  |____ 
;; |_______/ /__/     \__\  |__|     |_______|

;; 圖形化行事曆
(require 'calfw-org)
;; Then, M-x cfw:open-org-calendar.
;; You can choose agenda items with cfw:org-agenda-schedule-args, like following code: 
(global-set-key [f5] 'cfw:open-org-calendar)
;; (setq cfw:org-agenda-schedule-args '(:timestamp))
(setq cfw:org-overwrite-default-keybinding t)
;; key 	function
;; g 	Refresh data and re-draw contents (cfw:refresh-calendar-buffer)
;; j 	Goto the specified date (cfw:org-goto-date)
;; k 	org-capture
;; x 	Close calfw and other buffers opened by calfw-org (cfw:org-clean-exit)
;; d 	Day view (cfw:change-view-day)
;; v d 	Day view (cfw:change-view-day)
;; v w 	1 Week view (cfw:change-view-week)
;; v m 	Month View (cfw:change-view-month)

(setq calendar-week-start-day 1);;設定星期的第 1 天是星期一

;;插入日期，格式為習慣的 YYYY/mm/dd（星期），使用方法為 C-c d
(defun my-insert-date ()
    (interactive)
    (insert (format-time-string "%Y-%m-%d 週%a " (current-time))))
  (global-set-key (kbd "C-c d") 'my-insert-date)

;;;;;;;;;;新增台灣日曆
;;(add-to-list 'load-path "~/.emacs.d/")
(require 'taiwan-holidays)
(setq mark-holidays-in-calendar t)
(setq taiwan-holidays-important-holidays taiwan-holidays-taiwan-holidays)
(setq calendar-holidays taiwan-holidays-important-holidays)

;;   ______   .___________. __    __   _______ .______      
;;  /  __  \  |           ||  |  |  | |   ____||   _  \     
;; |  |  |  | `---|  |----`|  |__|  | |  |__   |  |_)  |    
;; |  |  |  |     |  |     |   __   | |   __|  |      /     
;; |  `--'  |     |  |     |  |  |  | |  |____ |  |\  \----.
;;  \______/      |__|     |__|  |__| |_______|| _| `._____|

;;;;;;;;;;; 取消 EMACS 一直詢問是否有修改檔案
;; Ignore modification-time-only changes in files, i.e. ones that
;; don't really change the contents.  This happens often with
;; switching between different VC buffers.
(defun update-buffer-modtime-if-byte-identical ()
  (let* ((size      (buffer-size))
         (byte-size (position-bytes size))
         (filename  buffer-file-name))
    (when (and byte-size (<= size 1000000))
      (let* ((attributes (file-attributes filename))
             (file-size  (nth 7 attributes)))
        (when (and file-size
                   (= file-size byte-size)
                   (string= (buffer-substring-no-properties 1 (1+ size))
                            (with-temp-buffer
                              (insert-file-contents filename)
                              (buffer-string))))
          (set-visited-file-modtime (nth 5 attributes))
          t)))))

(defun verify-visited-file-modtime--ignore-byte-identical (original &optional buffer)
  (or (funcall original buffer)
      (with-current-buffer buffer
        (update-buffer-modtime-if-byte-identical))))
(advice-add 'verify-visited-file-modtime :around #'verify-visited-file-modtime--ignore-byte-identical)

(defun ask-user-about-supersession-threat--ignore-byte-identical (original &rest arguments)
  (unless (update-buffer-modtime-if-byte-identical)
    (apply original arguments)))
(advice-add 'ask-user-about-supersession-threat :around #'ask-user-about-supersession-threat--ignore-byte-identical)



