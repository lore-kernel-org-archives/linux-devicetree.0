From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH] ARM: dts: berlin2q: add "cache-unified" to l2 node
Date: Tue, 15 May 2018 14:05:53 +0800
Message-ID: <20180515140553.7e4d7c9d@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Without this property, we get this boot warning:

"L2C: device tree omits to specify unified cache"

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index e23c49ae3ec2..7cba798152b9 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -149,6 +149,7 @@
 		l2: l2-cache-controller@ac0000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xac0000 0x1000>;
+			cache-unified;
 			cache-level = <2>;
 			arm,data-latency = <2 2 2>;
 			arm,tag-latency = <2 2 2>;
-- 
2.17.0
