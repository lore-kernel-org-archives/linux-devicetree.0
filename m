From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 9/9] ARM: dts: add usb udc support to bcm281xx
Date: Fri, 01 Nov 2013 23:56:33 +0300
Message-ID: <52741581.9020106@cogentembedded.com>
References: <1383335158-19730-1-git-send-email-matt.porter@linaro.org> <1383335158-19730-10-git-send-email-matt.porter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383335158-19730-10-git-send-email-matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 11/01/2013 10:45 PM, Matt Porter wrote:

> Adds USB OTG/PHY and clock support to BCM281xx and enables
> UDC support on the bcm11351-brt and bcm28155-ap boards.

> Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   arch/arm/boot/dts/bcm11351-brt.dts |  6 ++++++
>   arch/arm/boot/dts/bcm11351.dtsi    | 18 ++++++++++++++++++
>   arch/arm/boot/dts/bcm28155-ap.dts  |  8 ++++++++
>   3 files changed, 32 insertions(+)

[...]
> diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
> index 0755f43..247f9fd 100644
> --- a/arch/arm/boot/dts/bcm11351.dtsi
> +++ b/arch/arm/boot/dts/bcm11351.dtsi
> @@ -284,4 +284,22 @@
>   			#clock-cells = <0>;
>   		};
>   	};
> +
> +	usbotg: usbotg@3f120000 {

    According to ePAPR spec [1], the node name should be "usb@3f120000".


> +		compatible = "snps,dwc2";
> +		reg = <0x3f120000 0x10000>;
> +		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&usb_otg_ahb_clk>;
> +		clock-names = "otg";
> +		phys = <&usbphy>;
> +		phy-names = "usb2-phy";
> +		status = "disabled";
> +	};
> +
> +	usbphy: usbphy@3f130000 {

    This one should probably be named "usb-phy@3f130000", just like 
"ethernet-phy" from the ePAPR spec.

> +		compatible = "brcm,kona-usb2-phy";
> +		reg = <0x3f130000 0x28>;
> +		#phy-cells = <0>;
> +		status = "disabled";
> +	};
>   };

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
