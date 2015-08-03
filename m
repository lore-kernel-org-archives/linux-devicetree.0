From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 2/5] dt-bindings: arm: Hi6220: add doc for SRAM controller
Date: Mon,  3 Aug 2015 09:13:35 +0800
Message-ID: <1438564418-15948-3-git-send-email-leo.yan@linaro.org>
References: <1438564418-15948-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438564418-15948-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Wei Xu <xuwei5@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, sunzhaosheng@hisilicon.com, victor.lixin@hisilicon.com
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Document "hisilicon,hi6220-sramctrl" for SRAM controller.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../devicetree/bindings/arm/hisilicon/hisilicon.txt    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index c431c67..c733e28 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -127,6 +127,24 @@ Example:
 		#clock-cells = <1>;
 	};
 
+
+Hisilicon Hi6220 SRAM controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-sramctrl", "syscon"
+- reg : Register address and size
+
+Hisilicon's SoCs use sram for multiple purpose; on Hi6220 there have several
+SRAM banks for power management, modem, security, etc. Further, use "syscon"
+managing the common sram which can be shared by multiple modules.
+
+Example:
+	/*for Hi6220*/
+	sram: sram@fff80000 {
+		compatible = "hisilicon,hi6220-sramctrl", "syscon";
+		reg = <0x0 0xfff80000 0x0 0x12000>;
+	};
+
 -----------------------------------------------------------------------
 Hisilicon HiP01 system controller
 
-- 
1.9.1
