From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH RESEND 00/12] Add Flexgen Clock support
Date: Wed,  4 Jun 2014 16:31:48 +0200
Message-ID: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
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
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The goal of this series is to add Flexgen clock support to ST SoCs.

A Flexgen clock is composed by:
  - a clock cross bar (represented by a mux element)
  - a pre and final dividers (represented by a divider and gate elements)

Tested on B2020 board.

Gabriel Fernandez (12):
  clk: st: Update ST clock binding documentation
  clk: st: Adds Flexgen clock binding
  drivers: clk: st: STiH407: Support for Flexgen Clocks
  drivers: clk: st: STiH407: Support for A9 MUX Clocks
  drivers: clk: st: STiH407: Support for clockgenA0
  drivers: clk: st: Add polarity bit indication
  drivers: clk: st: Add quadfs reset handling
  drivers: clk: st: STiH407: Support for clockgenC0
  drivers: clk: st: STiH407: Support for clockgenD0/D2/D3
  drivers: clk: st: STiH407: Support for clockgenA9
  drivers: clk: st: Update frequency tables for fs660c32 and fs432c65
  drivers: clk: st: Use round to closest divider flag

 .../devicetree/bindings/clock/st/st,clkgen-mux.txt |   2 +-
 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |   5 +-
 .../devicetree/bindings/clock/st/st,clkgen.txt     |  25 +-
 .../devicetree/bindings/clock/st/st,flexgen.txt    |  48 +++
 .../devicetree/bindings/clock/st/st,quadfs.txt     |   3 +
 drivers/clk/st/Makefile                            |   2 +-
 drivers/clk/st/clk-flexgen.c                       | 332 +++++++++++++++++++++
 drivers/clk/st/clkgen-fsyn.c                       | 175 ++++++++++-
 drivers/clk/st/clkgen-mux.c                        |  12 +-
 drivers/clk/st/clkgen-pll.c                        |  64 ++++
 10 files changed, 647 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,flexgen.txt
 create mode 100644 drivers/clk/st/clk-flexgen.c

-- 
1.9.1
