From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 4/4] ARM: dts: clps711x: Add keypad devicetree node
Date: Fri, 21 Dec 2018 13:30:19 +0300
Message-ID: <20181221103019.15374-4-shc_work@mail.ru>
References: <20181221103019.15374-1-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181221103019.15374-1-shc_work@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

This patch adds keypad devicetree node for Cirrus Logic CLPS711X CPUs.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/boot/dts/ep7209.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/ep7209.dtsi b/arch/arm/boot/dts/ep7209.dtsi
index 1630b3d3873e..6e86b22c1b90 100644
--- a/arch/arm/boot/dts/ep7209.dtsi
+++ b/arch/arm/boot/dts/ep7209.dtsi
@@ -193,6 +193,12 @@
 		};
 	};
 
+	keypad: keypad {
+		compatible = "cirrus,ep7209-keypad";
+		syscon = <&syscon1>;
+		status = "disabled";
+	};
+
 	mctrl: mctrl {
 		compatible = "cirrus,ep7209-mctrl-gpio";
 		gpio,syscon-dev = <&syscon1 0 0>;
-- 
2.13.0
