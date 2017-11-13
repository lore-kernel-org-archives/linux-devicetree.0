From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 8/8] arm64: dts: actions: Add S700 SPS node
Date: Tue, 14 Nov 2017 00:34:27 +0100
Message-ID: <20171113233427.5386-9-afaerber@suse.de>
References: <20171113233427.5386-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113233427.5386-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Liau <thomas.liau@actions-semi.com>, Jeff Chen <jeff.chen@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, =?UTF-8?q?=E6=A2=85=E5=88=A9?= <harrymei@actions-semi.com>, support@cubietech.com, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a node to the S700 Device Tree for the Smart Power System (SPS).

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v2: New
 
 To be squashed into 5/8 if binding gets acked.
 
 arch/arm64/boot/dts/actions/s700.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index b54df405aaeb..6a39968b209f 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -154,6 +154,12 @@
 			status = "disabled";
 		};
 
+		sps: power-controller@e01b0100 {
+			compatible = "actions,s700-sps";
+			reg = <0x0 0xe01b0100 0x0 0x100>;
+			#power-domain-cells = <1>;
+		};
+
 		timer: timer@e024c000 {
 			compatible = "actions,s700-timer";
 			reg = <0x0 0xe024c000 0x0 0x4000>;
-- 
2.13.6
