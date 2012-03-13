From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 0/7] Highbank clock support using DT
Date: Tue, 13 Mar 2012 18:22:20 -0500
Message-ID: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

This series adds clock support to highbank using common clock
infrastructure and DT clock bindings. This is based on DT clock
support cherry-picked from Grant's devicetree/test-clocks branch
and Mike T's v6 common clock infrastructure series.

It supports initialization of the clocks in any order at least in my
relatively simple case of 1 clock output per DT node. 

Rob

Grant Likely (3):
  of: add clock providers
  of: Add of_property_match_string() to find index into a string list
  dt/clock: Add handling for fixed clocks and a clock node setup
    iterator

Rob Herring (4):
  clk: fix orphan list iterator to be safe
  dt/clock: add a simple provider get function
  dt/clock: add function to get parent clock name
  clk: add highbank clock support

 .../devicetree/bindings/clock/clock-bindings.txt   |  116 +++++++
 .../devicetree/bindings/clock/fixed-clock.txt      |   21 ++
 arch/arm/Kconfig                                   |    1 +
 arch/arm/boot/dts/highbank.dts                     |   76 +++++
 arch/arm/boot/dts/testcases/tests-phandle.dtsi     |    2 +
 arch/arm/mach-highbank/Makefile                    |    2 +-
 arch/arm/mach-highbank/clock.c                     |   62 ----
 arch/arm/mach-highbank/highbank.c                  |   16 +
 drivers/clk/Makefile                               |    2 +
 drivers/clk/clk-highbank.c                         |  335 ++++++++++++++++++++
 drivers/clk/clk.c                                  |    4 +-
 drivers/clk/clkdev.c                               |    9 +
 drivers/of/Kconfig                                 |    6 +
 drivers/of/Makefile                                |    1 +
 drivers/of/base.c                                  |   36 ++
 drivers/of/clock.c                                 |  236 ++++++++++++++
 drivers/of/selftest.c                              |   29 ++
 include/linux/of.h                                 |    3 +
 include/linux/of_clk.h                             |   43 +++
 19 files changed, 935 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/clock-bindings.txt
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-clock.txt
 delete mode 100644 arch/arm/mach-highbank/clock.c
 create mode 100644 drivers/clk/clk-highbank.c
 create mode 100644 drivers/of/clock.c
 create mode 100644 include/linux/of_clk.h

-- 
1.7.5.4
