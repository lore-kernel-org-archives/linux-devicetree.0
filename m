From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v7 0/5] clk: Provide support for always-on clocks
Date: Wed, 22 Jul 2015 14:04:10 +0100
Message-ID: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
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
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, mturquette@linaro.org, kernel@stlinux.com, s.hauer@pengutronix.de, sboyd@codeaurora.org, geert@linux-m68k.org, maxime.ripard@free-electrons.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Lots of platforms contain clocks which if turned off would prove fatal.
The only way to recover from these catastrophic failures is to restart
the board(s).  Now, when a clock provider is registered with the
framework it is possible for a list of critical clocks to be supplied
which must be kept ungated.  Each clock mentioned in the newly
introduced 'critical-clock' property will be clk_prepare_enable()d
where the normal references will be taken.  This will prevent the
common clk framework from attempting to gate them during the normal
clk_disable_unused() and disable_clock() procedures.

Note that it will still be possible for knowledgeable drivers to turn
these clocks off using clk_{enable,disable}_critical() calls.

Changelog:
v6 => v7:
  - Introduce API to enable and disable critical clocks
  - Rename 'always-on-clock' to 'critical-clock'

v5 => v6:
  - Use of_clk_get_from_provider() instead of of_clk_get_by_clkspec()
  - Explicitly describe expected DT values
  - Be pedantic with regards to printk() format specifiers

vX => v5:
  Implementations have changed drastically between versions, thus I
  would like for this set to be thought of independently from its
  predecessors.  The only reason for identifying as 'v5' is ease of
  differentiation on the list, which stems from the confusion caused
  by submitting 'v4' as a separate entity.

Lee Jones (5):
  ARM: sti: stih407-family: Supply defines for CLOCKGEN A0
  ARM: sti: stih410-clocks: Identify critical clocks
  clk: Supply the critical clock {init, enable, disable} framework
  clk: Provide critical clock support
  clk: dt: Introduce binding for critical clock support

 .../devicetree/bindings/clock/clock-bindings.txt   | 39 +++++++++++++++++++
 arch/arm/boot/dts/stih410-clock.dtsi               | 10 +++++
 drivers/clk/clk-conf.c                             | 45 +++++++++++++++++++++-
 drivers/clk/clk.c                                  | 45 ++++++++++++++++++++++
 include/dt-bindings/clock/stih407-clks.h           |  4 ++
 include/linux/clk-provider.h                       |  2 +
 include/linux/clk.h                                | 30 +++++++++++++++
 7 files changed, 174 insertions(+), 1 deletion(-)

-- 
1.9.1
