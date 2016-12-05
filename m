From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 3/3] ARM: dts: vf610-zii-dev-rev-b: Remove 'fixed-link'
 from DSA ports
Date: Mon,  5 Dec 2016 06:38:36 -0800
Message-ID: <1480948716-17744-3-git-send-email-andrew.smirnov@gmail.com>
References: <1480948716-17744-1-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480948716-17744-1-git-send-email-andrew.smirnov@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, andrew@lunn.ch, Andrey Smirnov <andrew.smirnov@gmail.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

Remove 'fixed-link' nodes from DSA ports since they are not needed (they
are not limiting link's speed and the ports will be configured to their
maximux speed as a default)

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since v2:

	- None


 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
index c0fc3f2..646c90c 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
@@ -97,10 +97,6 @@
 						phy-mode = "rgmii-txid";
 						link = <&switch1port6
 							&switch2port9>;
-						fixed-link {
-							speed = <1000>;
-							full-duplex;
-						};
 					};
 
 					port@6 {
@@ -165,10 +161,6 @@
 						label = "dsa";
 						phy-mode = "rgmii-txid";
 						link = <&switch0port5>;
-						fixed-link {
-							speed = <1000>;
-							full-duplex;
-						};
 					};
 				};
 				mdio {
-- 
2.5.5
