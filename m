Return-Path: <SRS0=JpZ7=PQ=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: v3msk: specify EtherAVB PHY IRQ
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
Message-ID: <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
Date: Tue, 8 Jan 2019 22:56:50 +0300
MIME-Version: 1.0
In-Reply-To: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Specify EtherAVB PHY IRQ in the V3M Starter Kit board's device tree, now
that we have the GPIO support (previously phylib had to resort to polling).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'renesas-devel-20190107-v5.0-rc1' tag of Simon
Horman's 'renesas.git' repo...

 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -108,6 +108,8 @@
 	phy0: ethernet-phy@0 {
 		rxc-skew-ps = <1500>;
 		reg = <0>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
