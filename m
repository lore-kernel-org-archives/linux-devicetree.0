From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [RESEND PATCH v2 00/13] Clock improvement for video playback
Date: Thu, 16 Jun 2016 11:20:20 +0200
Message-ID: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, arnaud.pouliquen@st.com, benjamin.gaignard@st.com, vincent.abriou@st.com, gabriel.fernandez@st.com
List-Id: devicetree@vger.kernel.org

v2:
  - Simpliflication of clock binding
    remark from Rob https://lkml.org/lkml/2016/5/25/492
  - Suppression of stih415-416 support for the clocks (in order
	to help simplification of clock binding)
    (others patchs for the machine and drivers will come)

This serie allows to increase video resolutions and make audio
adjustment during a video playback.

Gabriel Fernandez (13):
  drivers: clk: st: Remove stih415-416 clock support
  drivers: clk: st: Simplify clock binding of STiH4xx platforms
  drivers: clk: st: Add fs660c32 synthesizer algorithm
  drivers: clk: st: Add clock propagation for audio clocks
  drivers: clk: st: Handle clk synchronous mode for video clocks
  ARM: DT: STiH407: Enable clock propagation for audio clocks
  ARM: DT: STiH410: Enable clock propagation for audio clocks
  ARM: DT: STiH418: Enable clock propagation for audio clocks
  ARM: DT: STiH407: Enable synchronous clock mode for video clocks
  ARM: DT: STiH410: Enable synchronous clock mode for video clocks
  ARM: DT: STiH418: Enable synchronous clock mode for video clocks
  ARM: DT: STi: STiH407: clock configuration to address 720p and 1080p
  ARM: DT: STi: STiH410: clock configuration to address 720p and 1080p

 .../bindings/clock/st/st,clkgen-divmux.txt         |  49 --
 .../devicetree/bindings/clock/st/st,clkgen-mux.txt |  20 +-
 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |  35 +-
 .../bindings/clock/st/st,clkgen-prediv.txt         |  36 -
 .../devicetree/bindings/clock/st/st,clkgen-vcc.txt |  61 --
 .../devicetree/bindings/clock/st/st,clkgen.txt     |  54 +-
 .../devicetree/bindings/clock/st/st,flexgen.txt    |   4 +
 .../devicetree/bindings/clock/st/st,quadfs.txt     |  31 +-
 arch/arm/boot/dts/stih407-clock.dtsi               |   4 +-
 arch/arm/boot/dts/stih407.dtsi                     |  16 +-
 arch/arm/boot/dts/stih410-clock.dtsi               |   4 +-
 arch/arm/boot/dts/stih410.dtsi                     |  16 +-
 arch/arm/boot/dts/stih418-clock.dtsi               |   4 +-
 drivers/clk/st/clk-flexgen.c                       |  61 +-
 drivers/clk/st/clkgen-fsyn.c                       | 481 ++++---------
 drivers/clk/st/clkgen-mux.c                        | 748 +--------------------
 drivers/clk/st/clkgen-pll.c                        | 470 +------------
 17 files changed, 297 insertions(+), 1797 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-divmux.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-prediv.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-vcc.txt

-- 
1.9.1

