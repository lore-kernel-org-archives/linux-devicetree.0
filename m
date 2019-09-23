From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/6] add the DDR clock controller on Meson8 and Meson8b
Date: Mon, 23 Sep 2019 12:06:21 +0200
Message-ID: <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Sat 21 Sep 2019 at 17:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
> registers. This series:
> - adds support for this DDR clock controller (patches 0 and 1)
> - wires up the DDR PLL as input for two audio clocks (patches 2 and 3)

Have you been able to validate somehow that DDR rate calculated by CCF
is the actual rate that gets to the audio clocks ?

While I understand the interest for completeness, I suspect the having
the DDR clock as an audio parent was just for debugging purpose. IOW,
I'm not sure if adding this parent is useful to an actual audio use
case. As far as audio would be concerned, I think we are better of
without this parent.

> - adds the DDR clock controller to meson8.dtsi and meson8b.dtsi
>

Could you please separate the driver and DT series in the future ? Those
take different paths and are meant for different maintainers.

> Special thanks go out to Alexandre Mergnat for switching the Amlogic
> clock drivers over to parent_hws and parent_data. That made this series
> a lot easier for me!
>
> This series depends on my other series from [0]:
> "provide the XTAL clock via OF on Meson8/8b/8m2"
>
>
> [0] https://patchwork.kernel.org/cover/11155515/
>
>
> Martin Blumenstingl (6):
>   dt-bindings: clock: add the Amlogic Meson8 DDR clock controller
>     binding
>   clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
>   clk: meson: meson8b: use of_clk_hw_register to register the clocks
>   clk: meson: meson8b: add the ddr_pll input for the audio clocks
>   ARM: dts: meson8: add the DDR clock controller
>   ARM: dts: meson8b: add the DDR clock controller
>
>  .../clock/amlogic,meson8-ddr-clkc.yaml        |  50 ++++++
>  arch/arm/boot/dts/meson8.dtsi                 |  13 +-
>  arch/arm/boot/dts/meson8b.dtsi                |  13 +-
>  drivers/clk/meson/Makefile                    |   2 +-
>  drivers/clk/meson/meson8-ddr.c                | 153 ++++++++++++++++++
>  drivers/clk/meson/meson8b.c                   |  36 ++---
>  include/dt-bindings/clock/meson8-ddr-clkc.h   |   4 +
>  7 files changed, 245 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
>  create mode 100644 drivers/clk/meson/meson8-ddr.c
>  create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h
>
> -- 
> 2.23.0
