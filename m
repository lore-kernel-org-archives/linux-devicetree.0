From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH] ARM: dts: dove: add DT LCD controllers
Date: Wed, 19 Nov 2014 11:32:29 +0000
Message-ID: <E1Xr3Ur-0005Qx-Fx@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the DT fragment for the Marvell Dove LCD controllers.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
The documentation for this binding was submitted previously as part of
the code which parses this - v3.17-rc1~82^2~32^2~2.

 arch/arm/boot/dts/dove.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 3b891dd20993..a5441d5482a6 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -630,6 +630,20 @@
 				reg = <0xe8400 0x0c>;
 				ngpios = <8>;
 			};
+
+			lcd1: lcd-controller@810000 {
+				compatible = "marvell,dove-lcd";
+				reg = <0x810000 0x1000>;
+				interrupts = <46>;
+				status = "disabled";
+			};
+
+			lcd0: lcd-controller@820000 {
+				compatible = "marvell,dove-lcd";
+				reg = <0x820000 0x1000>;
+				interrupts = <47>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
1.8.3.1
