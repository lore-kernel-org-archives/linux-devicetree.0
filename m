From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH v3 00/14] Clock improvement for video playback
Date: Mon, 5 Sep 2016 15:20:23 +0200
Message-ID: <3588e4a5-7f80-a71d-9b56-a65dc8e5630d@st.com>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, arnaud.pouliquen@st.com, benjamin.gaignard@st.com, vincent.abriou@st.com, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Gabriel

For the whole series

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks



On 08/29/2016 02:26 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> v3:
>   - Rebase to v4.8-rc1
>   - Tipo fix in st,clkgen-pll.txt
>   - Add Ack of Peter for the series
>   - Add missed patch: "ARM: DT: STiH4xx: Simplify clock binding of STiH4xx platforms"
>
> v2:
>   - Simpliflication of clock binding
>     remark from Rob https://lkml.org/lkml/2016/5/25/492
>   - Suppression of stih415-416 support for the clocks (in order
> 	to help simplification of clock binding)
>     (others patchs for the machine and drivers will come)
>
> This serie allows to increase video resolutions and make audio
> adjustment during a video playback.
>
> Gabriel Fernandez (14):
>   drivers: clk: st: Remove stih415-416 clock support
>   drivers: clk: st: Simplify clock binding of STiH4xx platforms
>   ARM: DT: STiH4xx: Simplify clock binding of STiH4xx platforms
>   drivers: clk: st: Add fs660c32 synthesizer algorithm
>   drivers: clk: st: Add clock propagation for audio clocks
>   drivers: clk: st: Handle clk synchronous mode for video clocks
>   ARM: DT: STiH407: Enable clock propagation for audio clocks
>   ARM: DT: STiH410: Enable clock propagation for audio clocks
>   ARM: DT: STiH418: Enable clock propagation for audio clocks
>   ARM: DT: STiH407: Enable synchronous clock mode for video clocks
>   ARM: DT: STiH410: Enable synchronous clock mode for video clocks
>   ARM: DT: STiH418: Enable synchronous clock mode for video clocks
>   ARM: DT: STi: STiH407: clock configuration to address 720p and 1080p
>   ARM: DT: STi: STiH410: clock configuration to address 720p and 1080p
>
>  .../bindings/clock/st/st,clkgen-divmux.txt         |  49 --
>  .../devicetree/bindings/clock/st/st,clkgen-mux.txt |  20 +-
>  .../devicetree/bindings/clock/st/st,clkgen-pll.txt |  35 +-
>  .../bindings/clock/st/st,clkgen-prediv.txt         |  36 -
>  .../devicetree/bindings/clock/st/st,clkgen-vcc.txt |  61 --
>  .../devicetree/bindings/clock/st/st,clkgen.txt     |  54 +-
>  .../devicetree/bindings/clock/st/st,flexgen.txt    |   4 +
>  .../devicetree/bindings/clock/st/st,quadfs.txt     |  31 +-
>  arch/arm/boot/dts/stih407-clock.dtsi               |  22 +-
>  arch/arm/boot/dts/stih407.dtsi                     |  16 +-
>  arch/arm/boot/dts/stih410-clock.dtsi               |  20 +-
>  arch/arm/boot/dts/stih410.dtsi                     |  16 +-
>  arch/arm/boot/dts/stih418-clock.dtsi               |  20 +-
>  drivers/clk/st/clk-flexgen.c                       |  63 +-
>  drivers/clk/st/clkgen-fsyn.c                       | 481 ++++---------
>  drivers/clk/st/clkgen-mux.c                        | 748 +--------------------
>  drivers/clk/st/clkgen-pll.c                        | 472 +------------
>  17 files changed, 323 insertions(+), 1825 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-divmux.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-prediv.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-vcc.txt
>
