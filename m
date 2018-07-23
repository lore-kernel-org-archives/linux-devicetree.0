Return-Path: <SRS0=VfE6=KH=baylibre.com=narmstrong@kernel.org>
Subject: Re: [PATCH 0/3] Meson8/Meson8b: introduce a HHI syscon node
References: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <833b569b-3e25-feac-6110-a837c0b13bfa@baylibre.com>
Date: Mon, 23 Jul 2018 09:55:25 +0200
MIME-Version: 1.0
In-Reply-To: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 21/07/2018 21:28, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
> as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
> There is a register area called "HHI" which is used for multiple IP
> blocks of the SoC:
> - the system clock controller
> - a few reset lines (there is a separate reset controller, these reset
>   lines are not part of the other reset controller). this reset
>   controller is currently implemented in the clock controller driver
> - a HDMI controller
> - temperature sensor calibration data (by "data" I really mean data,
>   the ADC driver has four bits for the TSC data in it's own register
>   space, however on Meson8b and Meson8m2 there is a fifth TSC bit which
>   is stored in the HHI register area)
> 
> The first three could be implemented with a single node (either in one
> big driver, or using a MFD driver which would register function-
> specific drivers).
> However, the TSC data is a big problem, because the ADC has it's own
> set of registers but needs to write one bit in the HHI register area.
> 
> NOTE: this series has multiple dependencies:
> - the clock controller changes depend "meson8b: add the CPU_DIV16 clock
>   for the ARM TWD" as well as "meson8b: register the clock controller
>   early" [2]
> - the dts changes depend on "fix clock controller register size on
>   Meson8/Meson8b" [3]
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006733.html
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007890.html
> [2] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007900.html
> [3] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007897.html
> 
> 
> Martin Blumenstingl (3):
>   dt-bindings: clock: meson8b: use the registers from the HHI syscon
>   clk: meson: meson8b: use the HHI syscon if available
>   ARM: dts: meson: switch the clock controller to the HHI register area
> 
>  .../bindings/clock/amlogic,meson8b-clkc.txt   | 13 ++++------
>  arch/arm/boot/dts/meson.dtsi                  |  5 ++++
>  arch/arm/boot/dts/meson8.dtsi                 | 15 ++++++------
>  arch/arm/boot/dts/meson8b.dtsi                | 15 ++++++------
>  drivers/clk/meson/meson8b.c                   | 24 ++++++++++++-------
>  5 files changed, 41 insertions(+), 31 deletions(-)
> 

For the whole serie, it follow the same switch as GX so :

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
