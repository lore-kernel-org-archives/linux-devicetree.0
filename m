From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add BCM53125 Device Tree nodes
Date: Fri, 24 Jun 2016 13:48:38 +0800
Message-ID: <CAGb2v64u74cXG0R-MSMtDBxBpg2tFoifQwqbvWL-+3pG=GLVTQ@mail.gmail.com>
References: <1465690459-30751-1-git-send-email-f.fainelli@gmail.com> <1465690459-30751-2-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465690459-30751-2-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jun 12, 2016 at 8:14 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Now that we have a proper binding for Ethernet switches hanging off
> different buses, and a driver for the BCM53125 switch, add its Device
> Tree as a child MDIO node, at MDIO address 30 (Broadcom pseudo-PHY
> address) and describe the ports layout of the Lamobo R1 board.
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts | 60 +++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> index 5ee43d8bf174..697582397dcf 100644
> --- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> @@ -110,13 +110,67 @@
>  &gmac {
>         pinctrl-names = "default";
>         pinctrl-0 = <&gmac_pins_rgmii_a>;
> -       phy = <&phy1>;
>         phy-mode = "rgmii";
>         phy-supply = <&reg_gmac_3v3>;
>         status = "okay";
>
> -       phy1: ethernet-phy@1 {
> -               reg = <1>;
> +       fixed-link {
> +               speed = <1000>;
> +               full-duplex;
> +       };
> +
> +       mdio1 {

mdio will suffice.

> +               compatible = "snps,dwmac-mdio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               switch: ethernet-switch@30 {

30 decimal or 0x30 hex? We typically use hex values here.

Otherwise this patch looks good. You should send it to Maxime though.

ChenYu

> +                       compatible = "brcm,bcm53125";
> +                       reg = <30>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       label = "lan2";
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       label = "lan3";
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +                                       label = "lan4";
> +                               };
> +
> +                               port@3 {
> +                                       reg = <3>;
> +                                       label = "wan";
> +                               };
> +
> +                               port@4 {
> +                                       reg = <4>;
> +                                       label = "lan1";
> +                               };
> +
> +                               port@8 {
> +                                       reg = <8>;
> +                                       label = "cpu";
> +                                       ethernet = <&gmac>;
> +                                       phy-mode = "rgmii";
> +                                       fixed-link {
> +                                               speed = <1000>;
> +                                               full-duplex;
> +                                       };
> +                               };
> +                       };
> +               };
>         };
>  };
>
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
