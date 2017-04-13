From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 13/22] ARM: dts: uniphier: Add generic compatible string
 for I2C EEPROM
Date: Thu, 13 Apr 2017 15:28:30 -0300
Message-ID: <20170413182839.25381-14-javier@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170413182839.25381-1-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

Changes in v2: None

 arch/arm/boot/dts/uniphier-pro4-ace.dts    | 2 +-
 arch/arm/boot/dts/uniphier-pro4-sanji.dts  | 2 +-
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-pro4-ace.dts b/arch/arm/boot/dts/uniphier-pro4-ace.dts
index fefc89149234..783c76b6ce72 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ace.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ace.dts
@@ -88,7 +88,7 @@
 	status = "okay";
 
 	eeprom@54 {
-		compatible = "st,24c64";
+		compatible = "st,24c64","atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
 	};
diff --git a/arch/arm/boot/dts/uniphier-pro4-sanji.dts b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
index 6c63c8bad825..d65788c4835e 100644
--- a/arch/arm/boot/dts/uniphier-pro4-sanji.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
@@ -83,7 +83,7 @@
 	status = "okay";
 
 	eeprom@54 {
-		compatible = "st,24c64";
+		compatible = "st,24c64","atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
 	};
diff --git a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
index cccc86658d20..f9bd35f7d0de 100644
--- a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
+++ b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
@@ -80,7 +80,7 @@
 	status = "okay";
 
 	eeprom@54 {
-		compatible = "st,24c64";
+		compatible = "st,24c64","atmel,24c64";
 		reg = <0x54>;
 		pagesize = <32>;
 	};
-- 
2.9.3
