From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 0/6] ARM: imx6q{dl}: add the WEIM driver
Date: Fri, 24 May 2013 17:59:18 +0800
Message-ID: <1369389564-13181-1-git-send-email-b32955@freescale.com>
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
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: shc_work-JGs/UdohzUI@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds a new driver for WEIM in the imx6q{dl}-sabreauto boards.

The WEIM(Wireless External Interface Module) works like a bus.
You can attach many different devices on it, such as NOR, onenand.

In the case of i.MX6q-sabreauto, only the NOR is connected to WEIM.

v2 --> v3:
	[0] split the NOR pinctrl.
	[1] make the driver unloaded. change to bool type in Kconfig.
	[2] use the of_platform_populate().
	[3] remove the unused "interrupt" property from the Doc.
v1 --> v2:
	[0] remove used PADs.
	[1] fix the wrong pad values, (thanks Alison Chaiken)
	[2] remove the weim-cs-index.
	[3] add "fsl" for the weim-cs-timing.
	[4] remove the partitions info in the document.
	[5] rewrite the drivers(follow Sascha and Shawn's comments)


Huang Shijie (6):
  drivers: bus: add a new driver for WEIM
  ARM: dts: imx6q{dl}: fix the pin conflict between SPI and WEIM
  ARM: dts: imx6qdl: add more information for WEIM
  ARM: dts: imx6q: add pinctrls for WEIM NOR
  ARM: dts: imx6dl: add pinctrls for WEIM NOR
  ARM: dts: imx6qdl: enable the WEIM NOR

 Documentation/devicetree/bindings/bus/imx-weim.txt |   50 +++++++
 arch/arm/boot/dts/imx6dl-sabreauto.dts             |    9 +-
 arch/arm/boot/dts/imx6dl.dtsi                      |   60 +++++++++
 arch/arm/boot/dts/imx6q-sabreauto.dts              |    9 +-
 arch/arm/boot/dts/imx6q.dtsi                       |   61 +++++++++
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |   22 +++-
 arch/arm/boot/dts/imx6qdl.dtsi                     |    4 +-
 drivers/bus/Kconfig                                |    9 ++
 drivers/bus/Makefile                               |    1 +
 drivers/bus/imx-weim.c                             |  139 ++++++++++++++++++++
 10 files changed, 360 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/imx-weim.txt
 create mode 100644 drivers/bus/imx-weim.c
