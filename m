From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 5/8] ARM: mvebu: armada-xp: Add GE0 pinctrl settings for GMII
Date: Fri, 19 Sep 2014 22:14:41 +0200
Message-ID: <1411157684-6991-6-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There is a GMII setting for GE0, add it to the common pinctrl node.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/armada-xp.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index dfbcb10ad0db..327cace42242 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -74,6 +74,17 @@
 			pinctrl: pin-ctrl@18000 {
 				reg = <0x18000 0x38>;
 
+				pmx_ge0_gmii: pmx-ge0-gmii {
+					marvell,pins =
+					     "mpp0",  "mpp1",  "mpp2",  "mpp3",
+					     "mpp4",  "mpp5",  "mpp6",  "mpp7",
+					     "mpp8",  "mpp9",  "mpp10", "mpp11",
+					     "mpp12", "mpp13", "mpp14", "mpp15",
+					     "mpp16", "mpp17", "mpp18", "mpp19",
+					     "mpp20", "mpp21", "mpp22", "mpp23";
+					marvell,function = "ge0";
+				};
+
 				pmx_ge0_rgmii: pmx-ge0-rgmii {
 					marvell,pins =
 					     "mpp0", "mpp1", "mpp2", "mpp3",
-- 
2.0.0
