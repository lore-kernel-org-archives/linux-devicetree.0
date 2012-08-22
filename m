From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] Move imx6q/28/23 clock lookup over to device tree
Date: Wed, 22 Aug 2012 21:36:26 +0800
Message-ID: <1345642590-29905-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Change since v1:
* Rewrite of_clk_src_onecell_get() to get the clk using the index
  provided by device tree and the clks array provided by clock driver.
  Then we can save that big clock name list in dts and the string
  matching which is relatively slow. 

Shawn Guo (4):
  clk: add of_clk_src_onecell_get() support
  ARM: imx6q: replace clk_register_clkdev with clock DT lookup
  clk: mxs: replace imx28 clk_register_clkdev with clock DT lookup
  clk: mxs: replace imx23 clk_register_clkdev with clock DT lookup

 .../devicetree/bindings/clock/imx23-clock.txt      |   76 +++++++
 .../devicetree/bindings/clock/imx28-clock.txt      |   99 +++++++++
 .../devicetree/bindings/clock/imx6q-clock.txt      |  222 ++++++++++++++++++++
 arch/arm/boot/dts/imx23.dtsi                       |   16 ++-
 arch/arm/boot/dts/imx28.dtsi                       |   33 +++-
 arch/arm/boot/dts/imx6q-sabrelite.dts              |    1 +
 arch/arm/boot/dts/imx6q.dtsi                       |   73 ++++++-
 arch/arm/mach-imx/clk-imx6q.c                      |   44 +----
 arch/arm/mach-imx/mach-imx6q.c                     |    1 -
 drivers/clk/clk.c                                  |   14 ++
 drivers/clk/mxs/clk-imx23.c                        |   55 +----
 drivers/clk/mxs/clk-imx28.c                        |  113 +---------
 include/linux/clk-provider.h                       |    5 +
 13 files changed, 550 insertions(+), 202 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx23-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/imx28-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/imx6q-clock.txt

-- 
1.7.5.4
