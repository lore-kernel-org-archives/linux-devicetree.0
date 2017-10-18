From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 1/3] arm64: dts: hisilicon: supplement properties of ir node for poplar board
Date: Wed, 18 Oct 2017 07:22:06 -0400
Message-ID: <1508325728-55823-2-git-send-email-xuejiancheng@hisilicon.com>
References: <1508325728-55823-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508325728-55823-1-git-send-email-xuejiancheng@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, project-aspen-dev@linaro.org, hermit.wangheming@hisilicon.com, xuejiancheng@hisilicon.com, Younian Wang <wangyounian@hisilicon.com>
List-Id: devicetree@vger.kernel.org

From: Younian Wang <wangyounian@hisilicon.com>

Supplement properties of ir node for poplar board.

Signed-off-by: Younian Wang <wangyounian@hisilicon.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 75865f8a..0d11dc7 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -405,6 +405,8 @@
 			reg = <0x8001000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&sysctrl HISTB_IR_CLK>;
+			hisilicon,power-syscon = <&sysctrl>;
+			linux,rc-map-name = "rc-hisi-poplar";
 			status = "disabled";
 		};
 	};
-- 
2.7.4
