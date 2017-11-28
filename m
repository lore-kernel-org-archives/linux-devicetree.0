From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: watchdog: Add Spreadtrum watchdog
 documentation
Date: Mon, 27 Nov 2017 20:09:18 -0800
Message-ID: <445d1641-de20-860c-5448-4b1533426441@roeck-us.net>
References: <61f88b7f9c1ac8a2d4bd7dbab672ad913bd2707d.1511835645.git.eric.long@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61f88b7f9c1ac8a2d4bd7dbab672ad913bd2707d.1511835645.git.eric.long-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Long <eric.long-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huitao.yue-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/27/2017 06:18 PM, Eric Long wrote:
> This patch adds the documentation for Spreadtrum watchdog driver.
> 
> Signed-off-by: Eric Long <eric.long-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

The patch series is in my tree, and will ultimately find its way into Wim's tree.
No need to resend it anymore.

In general, if a patch is available in
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
there is no need to resend it.

Thanks,
Guenter

> ---
> Changes since v6:
> - No updates.
> 
> Changes since v5:
> - No updates.
> 
> Changes since v4:
> - No updates.
> 
> Changes since v3:
> - No updates.
> 
> Changes since v2:
> - Add acked tag from Rob.
> 
> Changes since v1:
> - No updates.
> ---
>   .../devicetree/bindings/watchdog/sprd-wdt.txt         | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/sprd-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/sprd-wdt.txt b/Documentation/devicetree/bindings/watchdog/sprd-wdt.txt
> new file mode 100644
> index 0000000..aeaf3e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/sprd-wdt.txt
> @@ -0,0 +1,19 @@
> +Spreadtrum SoCs Watchdog timer
> +
> +Required properties:
> +- compatible : Should be "sprd,sp9860-wdt".
> +- reg : Specifies base physical address and size of the registers.
> +- interrupts : Exactly one interrupt specifier.
> +- timeout-sec : Contain the default watchdog timeout in seconds.
> +- clock-names : Contain the input clock names.
> +- clocks : Phandles to input clocks.
> +
> +Example:
> +	watchdog: watchdog@40310000 {
> +		compatible = "sprd,sp9860-wdt";
> +		reg = <0 0x40310000 0 0x1000>;
> +		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +		timeout-sec = <12>;
> +		clock-names = "enable", "rtc_enable";
> +		clocks = <&clk_aon_apb_gates1 8>, <&clk_aon_apb_rtc_gates 9>;
> +	};
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
