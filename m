From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH  RESEND v6 0/2] watchdog: Add support for ImgTec PowerDown
 Controller Watchdog Timer
Date: Fri, 5 Dec 2014 08:54:11 -0300
Message-ID: <54819CE3.9050807@imgtec.com>
References: <1417064045-13274-1-git-send-email-Naidu.Tellapati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417064045-13274-1-git-send-email-Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naidu Tellapati <naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Wim,

On 11/27/2014 01:54 AM, Naidu Tellapati wrote:
> This patchset provides support for the PowerDown Controller (PDC) Watchdog Timer
> found on Pistachio SOC from Imagination Technologies (ImgTec).
> 
> The series is based on 3.18-rc5.
> 
> I am re-sending the series with correct Signed-off-by headers.
> 
> Changes from v5:
> 
>  * Removed unused struct pdc_wdt_dev variables.
> 
>  * Removed out_wdt label in probe function.
> 
> Changes from v4:
> 
>  * Added warning message if initial timeout value exceeds maximum timeout.
> 
> Changes from v3:
> 
>  * Removed PDC_WD_MAX_DELAY.
> 
>  * Removed spinlock.
> 
>  * Removed timeout check inside pdc_wdt_set_timeout function.
> 
>  * Changed identity to IMG PDC Watchdog.
> 
>  * Removed pdc_wdt_set_timeout call from the probe function.
> 
>  * Removed pdc_wdt_shutdown function call from pdc_wdt_remove function
>    and added pdc_wdt_stop function call instead.
> 
> Changes from v2:
> 
>  * Removed interrupt.h header file.
> 
>  * Removed clock rate-change notifier callback.
> 
> Changes from v1:
> 
>  * Arranged all include files in alphabetical order.
> 
>  * Arranged register field masks/shifts defines next to their
>    corresponding register
> 
>  * Registered clock rate-change notifier callback.
> 
>  * Removed all references to 32 kHz fixed clock rate.
>    Now the clock rate is read dynamically using clk_get_rate().
> 
>  * Defined a macro PDC_WD_CONFIG_ENABLE.
> 
>  * Added code for getting system clock.
> 
>  * Moved module_param stuffs next to the corresponding variable defines.
> 
>  * Added code in the function pdc_wdt_remove for stopping watchdog.
> 
>  * Removed MODULE_ALIAS.
> 
>  * Removed few unwanted spaces and unwanted blank lines.
> 
> Naidu Tellapati (2):
>   watchdog: ImgTec PDC Watchdog Timer Driver
>   DT: watchdog: Add ImgTec PDC Watchdog Timer binding documentation
> 

Do you think it's possible to merge this series in time for v3.19?

Thanks!
-- 
Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
