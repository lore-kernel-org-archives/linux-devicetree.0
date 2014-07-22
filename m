From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RESEND PATCH 1/1] ARM: DT: STi: STiH416: Add DT node for ST's
 SATA device
Date: Tue, 22 Jul 2014 11:06:54 +0200
Message-ID: <53CE29AE.3040505@st.com>
References: <1405931573-12407-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405931573-12407-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 07/21/2014 10:32 AM, Lee Jones wrote:
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Acked-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/ata/ahci-st.txt |  2 +-
>   arch/arm/boot/dts/stih416-b2020.dts               |  4 ++++
>   arch/arm/boot/dts/stih416-b2020e.dts              |  4 ++++
>   arch/arm/boot/dts/stih416.dtsi                    | 16 ++++++++++++++++
>   4 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/ata/ahci-st.txt b/Documentation/devicetree/bindings/ata/ahci-st.txt
> index 0574a77..9883542 100644
> --- a/Documentation/devicetree/bindings/ata/ahci-st.txt
> +++ b/Documentation/devicetree/bindings/ata/ahci-st.txt
> @@ -21,7 +21,7 @@ Example:
>   		reg             = <0xfe380000 0x1000>;
>   		interrupts      = <GIC_SPI 157 IRQ_TYPE_NONE>;
>   		interrupt-names = "hostc";
> -		phys	        = <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
> +		phys	        = <&phy_port0 MIPHY_TYPE_SATA>;
>   		phy-names       = "ahci_phy";
>   		resets	        = <&powerdown STIH416_SATA0_POWERDOWN>,
>   				  <&softreset STIH416_SATA0_SOFTRESET>;

Patch does not apply because this file does not exist in my tree.
Shouldn't be in a separate patch?

Regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
