From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v6 7/9] rtc: bindings: Provide ST bindings for ST's LPC
 RTC device
Date: Wed, 25 Mar 2015 06:28:59 -0700
Message-ID: <5512B81B.9090306@roeck-us.net>
References: <1427189140-1935-1-git-send-email-lee.jones@linaro.org> <1427189140-1935-8-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427189140-1935-8-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david.paris-qxv4g6HH51o@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/24/2015 02:25 AM, Lee Jones wrote:
> On current ST platforms the LPC controls a number of functions including
> Watchdog and Real Time Clock.  This patch provides the bindings used to
> configure LPC in RTC mode.
>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   .../devicetree/bindings/rtc/rtc-st-lpc.txt         | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt b/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> new file mode 100644
> index 0000000..aaf9855
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> @@ -0,0 +1,25 @@
> +STMicroelectronics Low Power Controller (LPC) - RTC
> +===================================================
> +
> +LPC currently supports Watchdog OR Real Time Clock functionality.
> +
> +[See: ../watchdog/st_lpc_wdt.txt for Watchdog options]
> +
> +Required properties
> +
> +- compatible 	: Must be one of: "st,stih407-lpc" "st,stih416-lpc"
> +				  "st,stih415-lpc" "st,stid127-lpc"
> +- reg		: LPC registers base address + size
> +- interrupts    : LPC interrupt line number and associated flags
> +- clocks	: Clock used by LPC device (See: ../clock/clock-bindings.txt)
> +- st,lpc-mode	: The LPC can run either one of two modes ST_LPC_MODE_RTC [0] or
> +		  ST_LPC_MODE_WDT [1].  One (and only one) mode must be
> +		  selected.
> +
> +Example:
> +	lpc@fde05000 {
> +		compatible	= "st,stih416-lpc-watchdog";

Name mismatch here as well.

Guenter

> +		reg		= <0xfde05000 0x1000>;
> +		clocks 		= <&clk_s_d3_flexgen CLK_LPC_0>;
> +		st,lpc-mode	= <ST_LPC_MODE_RTC>;
> +	};
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
