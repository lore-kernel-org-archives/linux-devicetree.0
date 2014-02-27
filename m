From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v0 00/15] clk: st: Add new driver
Date: Thu, 27 Feb 2014 16:24:13 +0100
Message-ID: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@st.com>
List-Id: devicetree@vger.kernel.org

The goal of this series is to add Clocks support to ST SoCs.
The DT definition is added for STiH415 and STiH416 SoCs on
B2000 and B2020 boards.

The series has been tested working on STiH416-B2020 board.
It applies on top of v3.14-rc3.

Gabriel Fernandez (15):
  drivers: clk: st: Support for DIVMUX and PreDiv Clocks
  drivers: clk: st: Support for PLLs inside ClockGenA(s)
  drivers: clk: st: Support for VCC-mux and MUX clocks
  drivers: clk: st: Support for QUADFS inside ClockGenB/C/D/E/F
  drivers: clk: st: Support for ClockGenA9/DDR/GPU
  drivers: clk: st: Support for A9 MUX clocks
  clk: st: Adds divmux and prediv clock binding
  clk: st: Adds clockgen clock binding
  clk: st: Adds clockgen-vcc and clockgen-mux clock binding
  clk: st: Adds quadfs clock binding
  ARM: STi: DT: STiH416: 416 DT Entry for clockgen A0/1/10/11/12
  ARM: STi: DT: STiH416: 416 DT Entry for clockgen B/C/D/E/F
  ARM: STi: DT: STiH416: 416 DT Entry for clockgen A9/DDR/GPU
  ARM: STi: DT: STiH415: 415 DT Entry for clockgen A0/1/10/11/12
  ARM: STi: DT: STiH415: 415 DT Entry for clockgen A9

 .../bindings/clock/st/st,clkgen-divmux.txt         |   49 +
 .../devicetree/bindings/clock/st/st,clkgen-mux.txt |   36 +
 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |   48 +
 .../bindings/clock/st/st,clkgen-prediv.txt         |   36 +
 .../devicetree/bindings/clock/st/st,clkgen-vcc.txt |   53 +
 .../devicetree/bindings/clock/st/st,clkgen.txt     |   83 ++
 .../devicetree/bindings/clock/st/st,quadfs.txt     |   45 +
 arch/arm/boot/dts/stih415-clks.h                   |   11 +
 arch/arm/boot/dts/stih415-clock.dtsi               |  530 +++++++++-
 arch/arm/boot/dts/stih415.dtsi                     |    6 +-
 arch/arm/boot/dts/stih416-clks.h                   |   11 +
 arch/arm/boot/dts/stih416-clock.dtsi               |  717 +++++++++++++-
 arch/arm/boot/dts/stih416.dtsi                     |    6 +-
 drivers/clk/Makefile                               |    1 +
 drivers/clk/st/Makefile                            |    1 +
 drivers/clk/st/clkgen-fsyn.c                       | 1039 ++++++++++++++++++++
 drivers/clk/st/clkgen-mux.c                        |  820 +++++++++++++++
 drivers/clk/st/clkgen-pll.c                        |  698 +++++++++++++
 drivers/clk/st/clkgen.h                            |   48 +
 19 files changed, 4214 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-divmux.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-prediv.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-vcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,quadfs.txt
 create mode 100644 arch/arm/boot/dts/stih415-clks.h
 create mode 100644 arch/arm/boot/dts/stih416-clks.h
 create mode 100644 drivers/clk/st/Makefile
 create mode 100644 drivers/clk/st/clkgen-fsyn.c
 create mode 100644 drivers/clk/st/clkgen-mux.c
 create mode 100644 drivers/clk/st/clkgen-pll.c
 create mode 100644 drivers/clk/st/clkgen.h

-- 
1.9.0
