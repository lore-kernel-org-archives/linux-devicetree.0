From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 4/9] ARM: kirkwood: fdt: use mrvl ticker symbol
Date: Fri, 16 Mar 2012 04:21:24 +0000
Message-ID: <12bc9d34d737beecb2c7a0703bd779b025e94721.1331868507.git.jason@lakedaemon.net>
References: <cover.1331868507.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1331868507.git.jason@lakedaemon.net>
In-Reply-To: <cover.1331868507.git.jason@lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <cover.1331868507.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, olof@lixom.net
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, Jason Cooper <jason@lakedaemon.net>, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Also, use inclusive register size for uart0.

Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---
 arch/arm/boot/dts/kirkwood-dreamplug.dts |    4 ++--
 arch/arm/boot/dts/kirkwood.dtsi          |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
index 8a5dff8..333f11b 100644
--- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
+++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
@@ -4,7 +4,7 @@
 
 / {
 	model = "Globalscale Technologies Dreamplug";
-	compatible = "globalscale,dreamplug-003-ds2001", "globalscale,dreamplug", "marvell,kirkwood-88f6281", "marvell,kirkwood";
+	compatible = "globalscale,dreamplug-003-ds2001", "globalscale,dreamplug", "mrvl,kirkwood-88f6281", "mrvl,kirkwood";
 
 	memory {
 		device_type = "memory";
@@ -17,7 +17,7 @@
 
 	serial@f1012000 {
 		compatible = "ns16550a";
-		reg = <0xf1012000 0xff>;
+		reg = <0xf1012000 0x100>;
 		reg-shift = <2>;
 		interrupts = <33>;
 		clock-frequency = <200000000>;
diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 771c6bb..702b955 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -1,6 +1,6 @@
 /include/ "skeleton.dtsi"
 
 / {
-	compatible = "marvell,kirkwood";
+	compatible = "mrvl,kirkwood";
 };
 
-- 
1.7.3.4
