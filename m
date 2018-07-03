From: "Jonathan A. Kollasch" <jakllsch@kollasch.net>
Subject: [PATCH] dts: fix status gpioleds on nanopi-neo-plus2
Date: Tue,  3 Jul 2018 08:26:36 -0500
Message-ID: <20180703132636.21587-1-jakllsch@kollasch.net>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "moderated list:ARM/Allwinner sunXi SoC
 support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: "Jonathan A. Kollasch" <jakllsch@kollasch.net>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jonathan A. Kollasch <jakllsch@kollasch.net>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index 506e25ba028a..b8eb43a0d007 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -71,8 +71,8 @@
 		};
 
 		status {
-			label = "nanopi:red:status";
-			gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
+			label = "nanopi:blue:status";
+			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
-- 
2.11.0
