From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] Add device tree support for i.mx53 boards
Date: Mon, 25 Jul 2011 23:07:45 +0800
Message-ID: <1311606467-28985-1-git-send-email-shawn.guo@linaro.org>
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

With all device drivers that the current i.mx53 board files are users
of converted to be device tree aware, it may be the time to convert
all the i.mx53 board support to device tree.

The device tree based i.mx53 ARD, EVK, QSB (aka loco) and SMD now can
work equivalently as the non-dt ones.

Shawn Guo (2):
      arm/mx5: parse iomuxc pad configuratoin from device tree
      arm/mx5: add device tree support for imx53 boards

 .../devicetree/bindings/arm/fsl/boards.txt         |   15 +
 .../devicetree/bindings/arm/fsl/iomuxc.txt         |   47 +
 arch/arm/boot/dts/imx53-ard.dts                    |  365 +++++++
 arch/arm/boot/dts/imx53-evk.dts                    |  354 +++++++
 arch/arm/boot/dts/imx53-qsb.dts                    |  358 +++++++
 arch/arm/boot/dts/imx53-smd.dts                    |  444 +++++++++
 arch/arm/boot/dts/imx53.dtsi                       | 1044 ++++++++++++++++++++
 arch/arm/mach-mx5/Kconfig                          |    8 +
 arch/arm/mach-mx5/Makefile                         |    3 +
 arch/arm/mach-mx5/imx53-dt.c                       |  128 +++
 arch/arm/mach-mx5/iomuxc-dt.c                      |   72 ++
 arch/arm/plat-mxc/include/mach/common.h            |    3 +
 12 files changed, 2841 insertions(+), 0 deletions(-)
