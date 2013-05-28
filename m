From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 4/6] ARM: dts: imx6q: add pinctrls for WEIM NOR
Date: Tue, 28 May 2013 14:20:10 +0800
Message-ID: <1369722012-6915-5-git-send-email-b32955@freescale.com>
References: <1369722012-6915-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369722012-6915-1-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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

Add two pinctrls for WEIM:
   one for the weim nor, another for the chipselect.

Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q.dtsi |   59 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index ed11bcf..d79455d 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -323,6 +323,65 @@
 						>;
 					};
 				};
+
+				weim {
+					pinctrl_weim_cs0_1: weim_cs0grp-1 {
+						fsl,pins = <
+							MX6Q_PAD_EIM_CS0__EIM_CS0_B   0xb0b1
+						>;
+					};
+
+					pinctrl_weim_nor_1: weimnorgrp-1 {
+						fsl,pins = <
+							MX6Q_PAD_EIM_OE__EIM_OE_B     0xb0b1
+							MX6Q_PAD_EIM_RW__EIM_RW       0xb0b1
+							MX6Q_PAD_EIM_WAIT__EIM_WAIT_B 0xb060
+							/* data */
+							MX6Q_PAD_EIM_D16__EIM_DATA16 0x1b0b0
+							MX6Q_PAD_EIM_D17__EIM_DATA17 0x1b0b0
+							MX6Q_PAD_EIM_D18__EIM_DATA18 0x1b0b0
+							MX6Q_PAD_EIM_D19__EIM_DATA19 0x1b0b0
+							MX6Q_PAD_EIM_D20__EIM_DATA20 0x1b0b0
+							MX6Q_PAD_EIM_D21__EIM_DATA21 0x1b0b0
+							MX6Q_PAD_EIM_D22__EIM_DATA22 0x1b0b0
+							MX6Q_PAD_EIM_D23__EIM_DATA23 0x1b0b0
+							MX6Q_PAD_EIM_D24__EIM_DATA24 0x1b0b0
+							MX6Q_PAD_EIM_D25__EIM_DATA25 0x1b0b0
+							MX6Q_PAD_EIM_D26__EIM_DATA26 0x1b0b0
+							MX6Q_PAD_EIM_D27__EIM_DATA27 0x1b0b0
+							MX6Q_PAD_EIM_D28__EIM_DATA28 0x1b0b0
+							MX6Q_PAD_EIM_D29__EIM_DATA29 0x1b0b0
+							MX6Q_PAD_EIM_D30__EIM_DATA30 0x1b0b0
+							MX6Q_PAD_EIM_D31__EIM_DATA31 0x1b0b0
+							/* address */
+							MX6Q_PAD_EIM_A23__EIM_ADDR23 0xb0b1
+							MX6Q_PAD_EIM_A22__EIM_ADDR22 0xb0b1
+							MX6Q_PAD_EIM_A21__EIM_ADDR21 0xb0b1
+							MX6Q_PAD_EIM_A20__EIM_ADDR20 0xb0b1
+							MX6Q_PAD_EIM_A19__EIM_ADDR19 0xb0b1
+							MX6Q_PAD_EIM_A18__EIM_ADDR18 0xb0b1
+							MX6Q_PAD_EIM_A17__EIM_ADDR17 0xb0b1
+							MX6Q_PAD_EIM_A16__EIM_ADDR16 0xb0b1
+							MX6Q_PAD_EIM_DA15__EIM_AD15  0xb0b1
+							MX6Q_PAD_EIM_DA14__EIM_AD14  0xb0b1
+							MX6Q_PAD_EIM_DA13__EIM_AD13  0xb0b1
+							MX6Q_PAD_EIM_DA12__EIM_AD12  0xb0b1
+							MX6Q_PAD_EIM_DA11__EIM_AD11  0xb0b1
+							MX6Q_PAD_EIM_DA10__EIM_AD10  0xb0b1
+							MX6Q_PAD_EIM_DA9__EIM_AD09   0xb0b1
+							MX6Q_PAD_EIM_DA8__EIM_AD08   0xb0b1
+							MX6Q_PAD_EIM_DA7__EIM_AD07   0xb0b1
+							MX6Q_PAD_EIM_DA6__EIM_AD06   0xb0b1
+							MX6Q_PAD_EIM_DA5__EIM_AD05   0xb0b1
+							MX6Q_PAD_EIM_DA4__EIM_AD04   0xb0b1
+							MX6Q_PAD_EIM_DA3__EIM_AD03   0xb0b1
+							MX6Q_PAD_EIM_DA2__EIM_AD02   0xb0b1
+							MX6Q_PAD_EIM_DA1__EIM_AD01   0xb0b1
+							MX6Q_PAD_EIM_DA0__EIM_AD00   0xb0b1
+						>;
+					};
+
+				};
 			};
 		};
 
-- 
1.7.1
