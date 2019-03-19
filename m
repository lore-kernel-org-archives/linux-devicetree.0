From: Jiada Wang <jiada_wang@mentor.com>
Subject: [PATCH v3 3/3] arm64: dts: renesas: r8a77965: use extended audio dmac register
Date: Tue, 19 Mar 2019 14:57:05 +0900
Message-ID: <20190319055705.24115-4-jiada_wang@mentor.com>
References: <20190319055705.24115-1-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319055705.24115-1-jiada_wang@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org, jiada_wang@mentor.com
List-Id: devicetree@vger.kernel.org

Basic audio dmac register only supports busif from 0 to 3,
in order to use busif4 ~ busif7, extended audio dmac register
need to be used

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9763d108e183..e9dd91081c52 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1461,7 +1461,7 @@
 				<0 0xec5a0000 0 0x100>,  /* ADG */
 				<0 0xec540000 0 0x1000>, /* SSIU */
 				<0 0xec541000 0 0x280>,  /* SSI */
-				<0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
+				<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
 			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
 			clocks = <&cpg CPG_MOD 1005>,
-- 
2.19.2
