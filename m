From: Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 2/2] scripts/gdb: fixup some pep8 errors in proc.py
Date: Tue, 18 Oct 2016 16:27:48 +0100
Message-ID: <477b66cc-05dc-57fa-38fb-f80510935c2e@bingham.xyz>
References: <1476803249-23328-1-git-send-email-peter.griffin@linaro.org>
 <1476803249-23328-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476803249-23328-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pete,

On 18/10/16 16:07, Peter Griffin wrote:
> proc.py:22:1: E302 expected 2 blank lines, found 1
> proc.py:200:1: E302 expected 2 blank lines, found 1
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  scripts/gdb/linux/proc.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/gdb/linux/proc.py b/scripts/gdb/linux/proc.py
> index f20fcfa..2d6f74e 100644
> --- a/scripts/gdb/linux/proc.py
> +++ b/scripts/gdb/linux/proc.py
> @@ -18,6 +18,7 @@ from linux import tasks
>  from linux import lists
>  from struct import *
>  
> +

This was added by patch 1, and can be squashed there.

>  class LxCmdLine(gdb.Command):
>      """ Report the Linux Commandline used in the current kernel.
>          Equivalent to cat /proc/cmdline on a running target"""
> @@ -196,6 +197,7 @@ values of that process namespace"""
>  
>  LxMounts()
>  
> +

Likewise...

>  class LxFdtDump(gdb.Command):
>      """Output Flattened Device Tree header and dump FDT blob to a file
>         Equivalent to 'cat /proc/fdt > fdtdump.dtb' on a running target"""
> 

-- 
Regards

Kieran Bingham
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
