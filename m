From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: Add Spreadtrum SC27xx RTC
 documentation
Date: Wed, 8 Nov 2017 04:15:20 +0100
Message-ID: <20171108031520.zx2ipqugiyypmpms@piout.net>
References: <7037c5053a533505f38fc036290a398989cfdafc.1510051749.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7037c5053a533505f38fc036290a398989cfdafc.1510051749.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07/11/2017 at 19:34:07 +0800, Baolin Wang wrote:
> This patch adds the binding documentation for Spreadtrum SC27xx series
> RTC device.
> 
> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/sprd,sc27xx-rtc.txt    |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt b/Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt
> new file mode 100644
> index 0000000..971d3a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt
> @@ -0,0 +1,16 @@
> +Spreadtrum SC27xx Real Time Clock
> +
> +Required properties:
> +- compatible: should be "sprd,sc27xx-rtc".

Don't use wildcards in a compatible, use a specific chip model. later
chips may or may not be compatible with that one.

> +- reg: address offset of rtc register.
> +- interrupt-parent: phandle for the interrupt controller.
> +- interrupts: rtc alarm interrupt.
> +
> +Example:
> +
> +	rtc: rtc@280 {

The rtc: alias is probably useless

> +		compatible = "sprd,sc27xx-rtc";
> +		reg = <0x280>;
> +		interrupt-parent = <&pmic>;
> +		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
> +	};

I would include the parent MFD node too.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
