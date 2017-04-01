From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v3 7/7] ARM: ux500: Add vendor prefix to tps61052 node
Date: Sat,  1 Apr 2017 03:18:54 -0400
Message-ID: <20170401071854.23198-8-javier@osg.samsung.com>
References: <20170401071854.23198-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170401071854.23198-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The tps61052 device node doesn't have a vendor prefix
in its compatible string, fix it by adding one.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/ste-hrefprev60.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ste-hrefprev60.dtsi b/arch/arm/boot/dts/ste-hrefprev60.dtsi
index 5882a2606ac3..3f14b4df69b4 100644
--- a/arch/arm/boot/dts/ste-hrefprev60.dtsi
+++ b/arch/arm/boot/dts/ste-hrefprev60.dtsi
@@ -30,7 +30,7 @@
 
 		i2c@80004000 {
 			tps61052@33 {
-				compatible = "tps61052";
+				compatible = "ti,tps61052";
 				reg = <0x33>;
 			};
 
-- 
2.9.3
