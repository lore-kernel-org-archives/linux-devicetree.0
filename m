From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: [PATCH v2 06/10] net: hisilicon: dt-bindings: Add an field of port-handle
Date: Tue, 9 Jul 2019 11:31:07 +0800
Message-ID: <1562643071-46811-7-git-send-email-xiaojiangfeng@huawei.com>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com, xiaojiangfeng@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org

In general, group is the same as the port, but some
boards specify a special group for better load
balancing of each processing unit.

Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
---
 Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt b/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt
index d1df8a0..464c0da 100644
--- a/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt
+++ b/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt
@@ -10,6 +10,7 @@ Required properties:
 	phandle, specifies a reference to the syscon ppe node
 	port, port number connected to the controller
 	channel, recv channel start from channel * number (RX_DESC_NUM)
+	group, field in the pkg desc, in general, it is the same as the port.
 - phy-mode: see ethernet.txt [1].
 
 Optional properties:
@@ -66,7 +67,7 @@ Example:
 		reg = <0x28b0000 0x10000>;
 		interrupts = <0 413 4>;
 		phy-mode = "mii";
-		port-handle = <&ppe 31 0>;
+		port-handle = <&ppe 31 0 31>;
 	};
 
 	ge0: ethernet@2800000 {
@@ -74,7 +75,7 @@ Example:
 		reg = <0x2800000 0x10000>;
 		interrupts = <0 402 4>;
 		phy-mode = "sgmii";
-		port-handle = <&ppe 0 1>;
+		port-handle = <&ppe 0 1 0>;
 		phy-handle = <&phy0>;
 	};
 
@@ -83,6 +84,6 @@ Example:
 		reg = <0x2880000 0x10000>;
 		interrupts = <0 410 4>;
 		phy-mode = "sgmii";
-		port-handle = <&ppe 8 2>;
+		port-handle = <&ppe 8 2 8>;
 		phy-handle = <&phy1>;
 	};
-- 
1.8.5.6
