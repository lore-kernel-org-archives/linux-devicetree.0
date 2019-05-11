From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/5] arm64: dts: meson: g12a: add mdio multiplexer
Date: Sat, 11 May 2019 18:59:47 +0200
Message-ID: <CAFBinCAe3jd598MPLUGFEoBAOaeXovSz7_8Kn7ZMmSFvRLFSXg@mail.gmail.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com> <20190510164940.13496-4-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510164940.13496-4-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Fri, May 10, 2019 at 6:49 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the g12a mdio multiplexer which allows to connect to either
> an external phy through the SoC pins or the internal 10/100 phy
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index fe0f73730525..6e9587aafb5d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -460,6 +460,38 @@
>                                 assigned-clock-rates = <100000000>;
>                                 #phy-cells = <1>;
>                         };
> +
> +                       eth_phy: mdio-multiplexer@4c000 {
> +                               compatible = "amlogic,g12a-mdio-mux";
> +                               reg = <0x0 0x4c000 0x0 0xa4>;
> +                               clocks = <&clkc CLKID_ETH_PHY>,
> +                                        <&xtal>,
> +                                        <&clkc CLKID_MPLL_5OM>;
I haven't noticed that before but there's a typo in the MPLL_5OM clock
definition:
the O (capital o) should be a 0 (zero).
can you fix this typo in an additional clock patch for v5.2 - then we
don't have to do it in v5.3 where this .dtsi might already use it

> +                               clock-names = "pclk", "clkin0", "clkin1";
> +                               mdio-parent-bus = <&mdio0>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               ext_mdio: mdio@0 {
> +                                       reg = <0>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                               };
> +
> +                               int_mdio: mdio@1 {
> +                                       reg = <1>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       internal_ephy: ethernet_phy@8 {
> +                                               compatible = "ethernet-phy-id0180.3301",
> +                                                            "ethernet-phy-ieee802.3-c22";
please drop the compatible string and replace it with a comment (if
you feel that it's needed).
quote from Documentation/devicetree/bindings/net/phy.txt:
> If the PHY reports an incorrect ID (or none at all) then the
> "compatible" list may contain an entry with the correct PHY ID in the
> form: "ethernet-phy-idAAAA.BBBB"

I am going to send a patch for other Amlogic boards to remove any
ethernet-phy-id comaptible string


Regards
Martin
