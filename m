From: Ding Tianhong <dingtianhong@huawei.com>
Subject: [PATCH 1/2] arm64: hip05-d02: Document devicetree bindings for Hisilicon Hip05-D02 Board
Date: Sat, 29 Aug 2015 16:52:40 +0800
Message-ID: <1440838361-1468-2-git-send-email-dingtianhong@huawei.com>
References: <1440838361-1468-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440838361-1468-1-git-send-email-dingtianhong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, marc.zyngier@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob.herring@linaro.org, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, xuwei5@hisilicon.com, linuxarm@huawei.com
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the devicetree bindings used by the
DT files of Hisilicon Hip05-D02 development board.

Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index c431c67..f98b39d 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -20,6 +20,10 @@ HiKey Board
 Required root node properties:
 	- compatible = "hisilicon,hi6220-hikey", "hisilicon,hi6220";
 
+HiP05 D02 Board
+Required root node properties:
+	- compatible = "hisilicon,hip05-d02";
+
 Hisilicon system controller
 
 Required properties:
-- 
1.9.0
