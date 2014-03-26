From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 2/3] ARM: sun7i/sun6i: dts: Add NMI
 irqchip support
Date: Wed, 26 Mar 2014 09:39:31 +0100
Message-ID: <53329243.8090604@redhat.com>
References: <1395256879-8475-1-git-send-email-carlo@caione.org> <1395256879-8475-3-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBUNEZKMQKGQEHG2LP5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1395256879-8475-3-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/19/2014 08:21 PM, Carlo Caione wrote:
> This patch adds DTS entries for NMI controller as child of GIC.
> 
> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>

Note this breaks the kernel on sun6i / A31 since we don't have a
pmic driver there yet, and thus the nmi gets constantly fired without
anything clearing it.

So the sun6i section needs a status = "disabled"; until we actually have pmic
support.

Regards,

Hans

> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 8 ++++++++
>  arch/arm/boot/dts/sun7i-a20.dtsi | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
> index 5256ad9..eea6033 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -190,6 +190,14 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> +		nmi_intc: interrupt-controller@01f00c0c {
> +			compatible = "allwinner,sun6i-a31-sc-nmi";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			reg = <0x01f00c0c 0x38>;
> +			interrupts = <0 0 4>;
> +		};
> +
>  		pio: pinctrl@01c20800 {
>  			compatible = "allwinner,sun6i-a31-pinctrl";
>  			reg = <0x01c20800 0x400>;
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 6f25cf5..7637f12 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -339,6 +339,14 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> +		nmi_intc: interrupt-controller@01c00030 {
> +			compatible = "allwinner,sun7i-a20-sc-nmi";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			reg = <0x01c00030 0x0c>;
> +			interrupts = <0 0 4>;
> +		};
> +
>  		emac: ethernet@01c0b000 {
>  			compatible = "allwinner,sun4i-a10-emac";
>  			reg = <0x01c0b000 0x1000>;
> 
