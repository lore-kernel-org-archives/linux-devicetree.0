From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/5] arm64: dts: meson: g12a: add ethernet pinctrl definitions
Date: Tue, 14 May 2019 17:10:47 -0700
Message-ID: <7hpnokd1bs.fsf@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com> <20190510164940.13496-3-jbrunet@baylibre.com> <CAFBinCAmGRHDU5QX2VEsV8vLBXD6fJtcRHbjdW8=p9Yti0V4qA@mail.gmail.com> <7244c6d3e81e7bbb84ac508399ab64e236051673.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7244c6d3e81e7bbb84ac508399ab64e236051673.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Sat, 2019-05-11 at 19:06 +0200, Martin Blumenstingl wrote:
>> Hi Jerome,
>> 
>> On Fri, May 10, 2019 at 6:49 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> > Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds
>> > 
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > ---
>> >  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
>> >  1 file changed, 37 insertions(+)
>> > 
>> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> > index a32db09809f7..fe0f73730525 100644
>> > --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> > @@ -206,6 +206,43 @@
>> >                                                 };
>> >                                         };
>> > 
>> > +                                       eth_leds_pins: eth-leds {
>> > +                                               mux {
>> > +                                                       groups = "eth_link_led",
>> > +                                                                "eth_act_led";
>> > +                                                       function = "eth";
>> > +                                                       bias-disable;
>> > +                                               };
>> > +                                       };
>> > +
>> > +                                       eth_rmii_pins: eth-rmii {
>> > +                                               mux {
>> > +                                                       groups = "eth_mdio",
>> > +                                                                "eth_mdc",
>> > +                                                                "eth_rgmii_rx_clk",
>> > +                                                                "eth_rx_dv",
>> > +                                                                "eth_rxd0",
>> > +                                                                "eth_rxd1",
>> > +                                                                "eth_txen",
>> > +                                                                "eth_txd0",
>> > +                                                                "eth_txd1";
>> > +                                                       function = "eth";
>> > +                                                       bias-disable;
>> > +                                               };
>> > +                                       };
>> > +
>> > +                                       eth_rgmii_pins: eth-rgmii {
>> > +                                               mux {
>> > +                                                       groups = "eth_rxd2_rgmii",
>> > +                                                                "eth_rxd3_rgmii",
>> > +                                                                "eth_rgmii_tx_clk",
>> > +                                                                "eth_txd2_rgmii",
>> > +                                                                "eth_txd3_rgmii";
>> > +                                                       function = "eth";
>> > +                                                       bias-disable;
>> > +                                               };
>> > +                                       };
>> it seems that the group definition is incomplete (missing things like
>> eth_mdc, eth_rx_dv, ...)
>> 
>> we could also mix the eth_rmii_pins and eth_rgmii_pins in a board.dts
>> (maybe that was your idea in the first place?):
>
> yes that's the idea
>
>>   phy-mode = "rgmii";
>>   pinctrl-0 = <&eth_rmii_pins>, <&eth_rgmii_pins>;
>>   pinctrl-names = "default";
>> however, in this case I would prefer if "eth_rmii_pins" was named only
>> "eth_pins" (following mostly what Amlogic does with the pin group
>> naming: eth_* for pins that are valid in both, rmii and rgmii mode and
>> eth*rgmii* for pins that are only valid in rgmii mode)
>
> I can't say I share your preference. I let Kevin decide what he wants.
>
It seems we've gone the eth_pins route for meson-gxl.dtsi, so I'd prefer
to be consistent with that.

Kevin
