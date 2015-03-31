From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] watchdog: digicolor: driver for Conexant Digicolor
 CX92755 SoC
Date: Tue, 31 Mar 2015 08:09:46 -0700
Message-ID: <551AB8BA.1040703@roeck-us.net>
References: <9995b9d0be8cda30103be7406a781cd79f347aeb.1427782499.git.baruch@tkos.co.il> <c765076e13eb2407541c256d4c527bbacb53ddd8.1427782499.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c765076e13eb2407541c256d4c527bbacb53ddd8.1427782499.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/30/2015 11:14 PM, Baruch Siach wrote:
> This commit add a driver for the watchdog functionality of the Conexant CX92755
> SoC, from the Digicolor series of SoCs. Of 8 system timers provided by the
> CX92755, the first one, timer A, can reset the chip when its counter reaches
> zero. This driver uses this capability to provide userspace with a standard
> watchdog, using the watchdog timer driver core framework. This driver also
> implements a reboot handler for the reboot(2) system call.
>
> The watchdog driver shares the timer registers with the CX92755 timer driver
> (drivers/clocksource/timer-digicolor.c). The timer driver, however, uses only
> timers other than A, so both drivers should coexist.
>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
