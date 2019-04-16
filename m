From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: ls1021: Fix SGMII PCS link remaining
 down after PHY disconnect
Date: Tue, 16 Apr 2019 11:57:53 -0500
Message-ID: <CADRPPNS2kecKh=MXJZafKW1x7wZ2MJh4qng1jdZ=-Pij2nXi2g@mail.gmail.com>
References: <20190411232315.19588-1-olteanv@gmail.com> <20190411232315.19588-2-olteanv@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232315.19588-2-olteanv@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, claudiu.manoil@nxp.com, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 6:28 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Each eTSEC MAC has its own TBI (SGMII) PCS and private MDIO bus.
> But due to a DTS oversight, both SGMII-compatible MACs of the LS1021 SoC
> are pointing towards the same internal PCS. Therefore nobody is
> controlling the internal PCS of eTSEC0.
>
> Upon initial ndo_open, the SGMII link is ok by virtue of U-boot
> initialization. But upon an ifdown/ifup sequence, the code path from
> ndo_open -> init_phy -> gfar_configure_serdes does not get executed for
> the PCS of eTSEC0 (and is executed twice for MAC eTSEC1). So the SGMII
> link remains down for eTSEC0. On the LS1021A-TWR board, to signal this
> failure condition, the PHY driver keeps printing
> '803x_aneg_done: SGMII link is not ok'.
>
> Fixes: 055223d4d22d ("ARM: dts: ls1021a: Enable the eTSEC ports on QDS and TWR")
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

Thanks,
Leo
> ---
>  arch/arm/boot/dts/ls1021a-twr.dts | 9 ++++++++-
>  arch/arm/boot/dts/ls1021a.dtsi    | 9 +++++++++
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
> index 97e1fb7ea932..9b1fe99d55b1 100644
> --- a/arch/arm/boot/dts/ls1021a-twr.dts
> +++ b/arch/arm/boot/dts/ls1021a-twr.dts
> @@ -145,7 +145,7 @@
>  };
>
>  &enet0 {
> -       tbi-handle = <&tbi1>;
> +       tbi-handle = <&tbi0>;
>         phy-handle = <&sgmii_phy2>;
>         phy-connection-type = "sgmii";
>         status = "okay";
> @@ -225,6 +225,13 @@
>         sgmii_phy2: ethernet-phy@2 {
>                 reg = <0x2>;
>         };
> +       tbi0: tbi-phy@1f {
> +               reg = <0x1f>;
> +               device_type = "tbi-phy";
> +       };
> +};
> +
> +&mdio1 {
>         tbi1: tbi-phy@1f {
>                 reg = <0x1f>;
>                 device_type = "tbi-phy";
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index 1a2a9509d9c2..89eab1fd1f7f 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -709,6 +709,15 @@
>                               <0x0 0x2d10030 0x0 0x4>;
>                 };
>
> +               mdio1: mdio@2d64000 {
> +                       compatible = "fsl,etsec2-mdio";
> +                       device_type = "mdio";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x0 0x2d64000 0x0 0x4000>,
> +                             <0x0 0x2d50030 0x0 0x4>;
> +               };
> +
>                 ptp_clock@2d10e00 {
>                         compatible = "fsl,etsec-ptp";
>                         reg = <0x0 0x2d10e00 0x0 0xb0>;
> --
> 2.17.1
>
