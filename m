From: David Lechner <david@lechnology.com>
Subject: [PATCH v6 4/5] ARM: DTS: da850: Add cfgchip syscon node
Date: Tue, 25 Oct 2016 22:06:50 -0500
Message-ID: <1477451211-31979-5-git-send-email-david@lechnology.com>
References: <1477451211-31979-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477451211-31979-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, David Lechner <david@lechnology.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org, Axel Haslam <ahaslam@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a syscon node for the SoC CFGCHIPn registers. This is needed for
the new usb phy driver.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/da850.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index f79e1b9..6bbf20d 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -188,6 +188,10 @@
 			};
 
 		};
+		cfgchip: cfgchip@1417c {
+			compatible = "ti,da830-cfgchip", "syscon";
+			reg = <0x1417c 0x14>;
+		};
 		edma0: edma@0 {
 			compatible = "ti,edma3-tpcc";
 			/* eDMA3 CC0: 0x01c0 0000 - 0x01c0 7fff */
-- 
2.7.4
