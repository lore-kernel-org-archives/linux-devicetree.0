From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: enable PCIe PHY support for Cygnus
Date: Mon, 23 Nov 2015 10:50:16 -0800
Message-ID: <56535FE8.2010504@broadcom.com>
References: <1447870619-2828-1-git-send-email-rjui@broadcom.com>
 <1447870619-2828-2-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447870619-2828-2-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Any comment on this DT change to enable PCIe PHY support for Cygnus?

Note the PHY driver has been accepted and is in v4.4.

Thanks,

Ray

On 11/18/2015 10:16 AM, Ray Jui wrote:
> Enable PCIe PHY for both PCIe root complexes on Cygnus
>
> Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arm/boot/dts/bcm-cygnus.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
> index 2778533..5df5300 100644
> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
> @@ -91,6 +91,21 @@
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>
> +		pcie_phy: phy@0301d0a0 {
> +			compatible = "brcm,cygnus-pcie-phy";
> +			reg = <0x0301d0a0 0x14>;
> +
> +			pcie0_phy: phy@0 {
> +				reg = <0>;
> +				#phy-cells = <0>;
> +			};
> +
> +			pcie1_phy: phy@1 {
> +				reg = <1>;
> +				#phy-cells = <0>;
> +			};
> +		};
> +
>   		pinctrl: pinctrl@0x0301d0c8 {
>   			compatible = "brcm,cygnus-pinmux";
>   			reg = <0x0301d0c8 0x30>,
> @@ -161,6 +176,9 @@
>   			ranges = <0x81000000 0 0	  0x28000000 0 0x00010000
>   				  0x82000000 0 0x20000000 0x20000000 0 0x04000000>;
>
> +			phys = <&pcie0_phy>;
> +			phy-names = "pcie-phy";
> +
>   			status = "disabled";
>   		};
>
> @@ -182,6 +200,9 @@
>   			ranges = <0x81000000 0 0	  0x48000000 0 0x00010000
>   				  0x82000000 0 0x40000000 0x40000000 0 0x04000000>;
>
> +			phys = <&pcie1_phy>;
> +			phy-names = "pcie-phy";
> +
>   			status = "disabled";
>   		};
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
