From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: meson: g12a: add mdio multiplexer
Date: Mon, 20 May 2019 19:37:35 +0200
Message-ID: <CAFBinCA_XE86eqCMpEFc3xMZDH8J7wVQPRj7bFZyqDxQx-w-qw@mail.gmail.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com> <20190520131401.11804-4-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520131401.11804-4-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Mon, May 20, 2019 at 3:14 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the g12a mdio multiplexer which allows to connect to either
> an external phy through the SoC pins or the internal 10/100 phy
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index def02ebf6501..90da7cc81681 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -1698,6 +1698,38 @@
>                                 assigned-clock-rates = <100000000>;
>                                 #phy-cells = <1>;
>                         };
> +
> +                       eth_phy: mdio-multiplexer@4c000 {
> +                               compatible = "amlogic,g12a-mdio-mux";
> +                               reg = <0x0 0x4c000 0x0 0xa4>;
> +                               clocks = <&clkc CLKID_ETH_PHY>,
> +                                        <&xtal>,
> +                                        <&clkc CLKID_MPLL_50M>;
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
Based on your comment on v1 of this patch [0] the Ethernet PHY ID is
defined by this "mdio-multiplexer" (write arbitrary value to a
register then that's the PHY ID which will show up on the bus)
I'm fine with explicitly listing the ID which the PHY driver binds to
because I don't know a better way.

+Cc Andrew, Florian and Heiner because I think they should be aware of
such cases (it seems like a special case to me).


Martin


[0] https://patchwork.kernel.org/patch/10939255/
