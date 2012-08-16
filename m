From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] Move imx6q clock lookup over to device tree
Date: Thu, 16 Aug 2012 16:08:44 +0800
Message-ID: <1345104526-14797-1-git-send-email-shawn.guo@linaro.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The series adds a generic of_clk_src_onecell_get() function into clock
framework, and then moves imx6q clock lookup over to device tree, so
that any new clock lookup to be added at later time does not need to
patch kerenel.

Shawn Guo (2):
  clk: add of_clk_src_onecell_get() support
  ARM: imx6q: replace clk_register_clkdev with clock DT lookup

 .../devicetree/bindings/clock/imx6q-clock.txt      |  223 +++++++++++++++++
 arch/arm/boot/dts/imx6q-sabrelite.dts              |    1 +
 arch/arm/boot/dts/imx6q.dtsi                       |  261 +++++++++++++++++++-
 arch/arm/mach-imx/clk-imx6q.c                      |   41 +---
 arch/arm/mach-imx/mach-imx6q.c                     |    1 -
 drivers/clk/clk.c                                  |   15 ++
 include/linux/clk-provider.h                       |    1 +
 7 files changed, 493 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx6q-clock.txt

-- 
1.7.5.4
