From: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add initial support for cm-fx6
Date: Wed, 16 Oct 2013 20:45:50 -0500
Message-ID: <CAKCjkJY=6mCKnxtzEgosVEYP9D3X51UAw9etr-H=j=22E=WhzA@mail.gmail.com>
References: <1381848564-29839-1-git-send-email-valentin@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381848564-29839-1-git-send-email-valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 15, 2013 at 9:49 AM, Valentin Raevsky
<valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wrote:
> Add initial support for cm-fx6 module.
>
> cm-fx6 is a module based on mx6q SoC with the following features:
> - Up to 4GB of DDR3
> - 1 LCD/DVI output port
> - 1 HDMI output port
> - 2 LVDS LCD ports
> - Gigabit Ethernet
> - Analog Audio
> - CAN
> - SATA
> - NAND
> - PCIE
>
> This patch allows to boot up the module, configures the serial console,
> the Ethernet adapter and the hearbeat led.
>
> Signed-off-by: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> Acked-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> ---
>  arch/arm/boot/dts/cm-fx6.dts |   51 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 arch/arm/boot/dts/cm-fx6.dts
>
> diff --git a/arch/arm/boot/dts/cm-fx6.dts b/arch/arm/boot/dts/cm-fx6.dts
> new file mode 100644
> index 0000000..1080215
> --- /dev/null
> +++ b/arch/arm/boot/dts/cm-fx6.dts
> @@ -0,0 +1,51 @@
> +/*
> + * Copyright 2013 CompuLab Ltd.
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "imx6q.dtsi"
> +
> +/ {
> +       model = "CompuLab CM-FX6";
> +       compatible = "compulab,cm-fx6", "fsl,imx6q";
> +
> +       memory {
> +               reg = <0x10000000 0x80000000>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               debug-led {
> +                       label = "Heartbeat";
> +                       gpios = <&gpio2 31 0>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +};
> +
> +&gpmi {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_gpmi_nand_1>;
> +       status = "okay";
> +};
> +
> +&fec {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_enet_1>;
> +       phy-mode = "rgmii";
> +       status = "okay";
> +};
> +
> +&uart4 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart4_1>;
> +       status = "okay";
> +};
> --
> 1.7.9.5
>

Hi Valentin,

Completely skipped over this, as I wasn't sure what the cm-fx6 was.
Could we maybe mention that this is commonly referred to as the
Utilite?

-- 
This e-mail and any attachments are for the sole use of the intended 
recipients(s) and may be confidential. Use of any Pwnie Express product 
signifies your agreement to the Rapid Focus Security EULA<http://pwnieexpress.com/pdfs/RFSEULA.pdf>and is subject to export controls under the U.S. Commerce Department's 
Export Administration Regulations ("EAR").
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
