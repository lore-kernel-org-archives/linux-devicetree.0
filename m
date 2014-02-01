From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH v2] arm: dts: keystone: add watchdog entry
Date: Sat, 1 Feb 2014 14:29:47 +0200
Message-ID: <1391257787-6565-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: santosh.shilimkar@ti.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add watchdog entry to keystone device tree.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>

Conflicts:
	arch/arm/boot/dts/keystone.dtsi
---
Rebased on
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
keystone/master

 arch/arm/boot/dts/keystone.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index b420290..3a83ffe 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -208,5 +208,11 @@
 				usb-phy = <&usb_phy>, <&usb_phy>;
 			};
 		};
+
+		wdt: wdt@022f0080 {
+			compatible = "ti,keystone-wdt","ti,davinci-wdt";
+			reg = <0x022f0080 0x80>;
+			clocks = <&clkwdtimer0>;
+		};
 	};
 };
-- 
1.8.3.2
