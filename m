From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] Add device tree support for i.mx51/53 boards
Date: Sun, 31 Jul 2011 02:53:18 +0800
Message-ID: <1312052001-16660-1-git-send-email-shawn.guo@linaro.org>
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

It coverts i.mx51 Babbage, i.mx53 ARD, EVK, QSB (aka loco) and SMD
to use device tree.

Changes since v1:
 * Address comments on v1 given by Grant and Sascha
 * Add i.mx51 Babbage support

Shawn Guo (3):
      arm/mx5: parse iomuxc pad configuratoin from device tree
      arm/mx5: add device tree support for imx53 boards
      arm/mx5: add device tree support for imx51 babbage

 .../devicetree/bindings/arm/fsl/boards.txt         |   19 +
 .../devicetree/bindings/arm/fsl/iomuxc.txt         |   47 +
 arch/arm/boot/dts/imx51-babbage.dts                |  548 +++++++++
 arch/arm/boot/dts/imx51.dtsi                       | 1190 ++++++++++++++++++++
 arch/arm/boot/dts/imx53-ard.dts                    |  365 ++++++
 arch/arm/boot/dts/imx53-evk.dts                    |  353 ++++++
 arch/arm/boot/dts/imx53-qsb.dts                    |  357 ++++++
 arch/arm/boot/dts/imx53-smd.dts                    |  443 ++++++++
 arch/arm/boot/dts/imx53.dtsi                       | 1055 +++++++++++++++++
 arch/arm/mach-mx5/Kconfig                          |   16 +
 arch/arm/mach-mx5/Makefile                         |    4 +
 arch/arm/mach-mx5/imx51-dt.c                       |  101 ++
 arch/arm/mach-mx5/imx53-dt.c                       |  161 +++
 arch/arm/mach-mx5/iomuxc-dt.c                      |   70 ++
 arch/arm/plat-mxc/include/mach/common.h            |    3 +
 15 files changed, 4732 insertions(+), 0 deletions(-)
