From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH 08/12] rtc: bindings: Supply knowledge
 of a third supported device - clocksource
Date: Thu, 7 May 2015 15:12:45 +0100
Message-ID: <20150507141245.GA9793@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
 <1431005924-21777-9-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431005924-21777-9-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@stlinux.com, rtc-linux@googlegroups.com, a.zummo@towertech.it, daniel.lezcano@linaro.org, wim@iguana.be, tglx@linutronix.de, linux@roeck-us.net, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Thu, 07 May 2015, Lee Jones wrote:

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt b/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> index 73407f50..daf8826 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
> @@ -1,20 +1,23 @@
>  STMicroelectronics Low Power Controller (LPC) - RTC
>  ===================================================
>  
> -LPC currently supports Watchdog OR Real Time Clock functionality.
> +LPC currently supports Watchdog OR Real Time Clock OR Clocksource
> +functionality.
>  
>  [See: ../watchdog/st_lpc_wdt.txt for Watchdog options]
> +[See: ../timer/st,stih407-lpc for Clocksource options]
>  
>  Required properties
>  
> -- compatible 	: Must be one of: "st,stih407-lpc" "st,stih416-lpc"
> -				  "st,stih415-lpc" "st,stid127-lpc"
> +- compatible 	: Must be: "st,stih407-lpc"

You are removing the compatibles documentation for the other supported SoC's like
stih416-lpc stih415-lpc here.

regards,

Peter.
