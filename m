From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: add SMP enable-method for Broadcom NSP
Date: Thu, 15 Oct 2015 00:27:52 +0200
Message-ID: <561ED6E8.4000208@hauke-m.de>
References: <1444844820-24290-1-git-send-email-kapilh@broadcom.com>
 <1444844820-24290-2-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444844820-24290-2-git-send-email-kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/14/2015 07:46 PM, Kapil Hali wrote:
> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
> documentation file and create a new binding documentation for
> Northstar Plus CPU pen-release mechanism.
> 
> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
> new file mode 100644
> index 0000000..8506da7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
> @@ -0,0 +1,36 @@
> +Broadcom Northstar Plus SoC CPU Enable Method
> +---------------------------------------------
> +This binding defines the enable method used for starting secondary
> +CPUs in the following Broadcom SoCs:
> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
> +
> +The enable method is specified by defining the following required
> +properties in the "cpus" device tree node:
> +  - enable-method = "brcm,bcm-nsp-smp";
> +  - secondary-boot-reg = <...>;
> +
> +The secondary-boot-reg property is a u32 value that specifies the
> +physical address of the register used to request the ROM holding pen
> +code release a secondary CPU.
> +
> +Example:
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		enable-method = "brcm,bcm-nsp-smp";
> +		secondary-boot-reg = <0xffff042c>;

Isn't this some offset in a SRAM? If this is a SRAM it should be handled
like it is done in some other SoC code.

> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			next-level-cache = <&L2>;
> +			reg = <0>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			next-level-cache = <&L2>;
> +			reg = <1>;
> +		};
> +	};
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 91e6e5c..1172d9b 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -190,6 +190,7 @@ nodes to be present and contain the properties described below.
>  			    "allwinner,sun6i-a31"
>  			    "allwinner,sun8i-a23"
>  			    "arm,psci"
> +			    "brcm,bcm-nsp-smp"
>  			    "brcm,brahma-b15"
>  			    "marvell,armada-375-smp"
>  			    "marvell,armada-380-smp"
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
