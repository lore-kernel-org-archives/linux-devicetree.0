From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] Add device tree probe for imx-sdma driver
Date: Fri, 15 Jul 2011 17:44:23 +0800
Message-ID: <1310723066-567-1-git-send-email-shawn.guo@linaro.org>
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

The first patch remove the use of software defined sdma version, and
instead uses platform_device_id to handle the sdma differences from
one soc to another.  The second one makes a small cleanup on function
sdma_get_firmware(), and the third patch adds the actual device tree
probe support.

Changes since v1:
 * Do not encode ROM script address in device tree
 * Add one more small cleanup on function sdma_get_firmware()

ShawnsGuo (3):
      dmaengine: imx-sdma: use platform_device_id to identify sdma version
      dmaengine: imx-sdma: sdma_get_firmware does not need to copy fw_name
      dmaengine: imx-sdma: add device tree probe support

 .../devicetree/bindings/dma/fsl-imx-sdma.txt       |   17 ++++
 arch/arm/mach-imx/clock-imx25.c                    |    3 +-
 arch/arm/mach-imx/clock-imx31.c                    |    2 +-
 arch/arm/mach-imx/clock-imx35.c                    |    2 +-
 arch/arm/mach-imx/mm-imx25.c                       |    4 +-
 arch/arm/mach-imx/mm-imx31.c                       |    3 +-
 arch/arm/mach-imx/mm-imx35.c                       |    3 +-
 arch/arm/mach-mx5/clock-mx51-mx53.c                |    6 +-
 arch/arm/mach-mx5/mm.c                             |    8 +-
 arch/arm/plat-mxc/devices/platform-imx-dma.c       |    4 +-
 arch/arm/plat-mxc/include/mach/devices-common.h    |    2 +-
 arch/arm/plat-mxc/include/mach/dma.h               |    3 +-
 arch/arm/plat-mxc/include/mach/sdma.h              |    2 -
 drivers/dma/imx-sdma.c                             |   92 +++++++++++++++-----
 14 files changed, 107 insertions(+), 44 deletions(-)
