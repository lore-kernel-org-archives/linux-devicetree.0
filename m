From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 5/5] arm64: dts: renesas: condor: add EtherAVB support
Date: Fri, 16 Feb 2018 21:38:31 +0300
Message-ID: <5ca8941c-9273-733e-28bd-e76a82e94908@cogentembedded.com>
References: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the Condor board dependent part of the EtherAVB device node.

Based  on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- added the "renesas,no-ether-link" property;
- overrode the "phy-mode" property.

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   13 +++++++++++++
 1 file changed, 13 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -15,6 +15,7 @@
 
 	aliases {
 		serial0 = &scif0;
+		ethernet0 = &avb;
 	};
 
 	chosen {
@@ -28,6 +29,18 @@
 	};
 };
 
+&avb {
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
