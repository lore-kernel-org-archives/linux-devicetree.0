From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] Add device tree probe for imx/mxc gpio
Date: Tue, 5 Jul 2011 23:19:23 +0800
Message-ID: <1309879166-25788-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The first patch removes the uses of cpu_is_mx(), and the second one
adds device tree probe support.

Changes since v1:
 * Address review comments given by Grant and Sascha
 * Add patch #1 to get gpio range/base from gpio core

Shawn Guo (3):
      gpio/mxc: get gpio range/base from gpio core
      gpio/mxc: get rid of the uses of cpu_is_mx()
      gpio/mxc: add device tree probe support

 .../devicetree/bindings/gpio/fsl-imx-gpio.txt      |   22 +++
 arch/arm/mach-imx/mm-imx1.c                        |    8 +-
 arch/arm/mach-imx/mm-imx21.c                       |   12 +-
 arch/arm/mach-imx/mm-imx25.c                       |    8 +-
 arch/arm/mach-imx/mm-imx27.c                       |   12 +-
 arch/arm/mach-imx/mm-imx31.c                       |    6 +-
 arch/arm/mach-imx/mm-imx35.c                       |    6 +-
 arch/arm/mach-mx5/mm-mx50.c                        |   12 +-
 arch/arm/mach-mx5/mm.c                             |   22 ++--
 arch/arm/plat-mxc/devices/platform-gpio-mxc.c      |    4 +-
 arch/arm/plat-mxc/include/mach/common.h            |    2 +-
 arch/arm/plat-mxc/include/mach/gpio.h              |   13 +-
 arch/arm/plat-mxc/include/mach/irqs.h              |   21 +--
 drivers/gpio/gpio-mxc.c                            |  165 ++++++++++++++++---
 14 files changed, 219 insertions(+), 94 deletions(-)
