From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH V3 02/12] dtb: amd: Fix GICv2 hypervisor and virtual interface sizes
Date: Wed, 10 Feb 2016 21:51:01 -0600
Message-ID: <1455162671-16044-3-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: olof@lixom.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

From: Brijesh Singh <brijeshkumar.singh@amd.com>

This patch fixes incorrect sizes of the GICv2 device tree node.
This has triggered error message when booting Xen hypervisor.

Signed-off-by: Brijesh Singh <brijeshkumar.singh@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 2874d92..fdd0c96 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -18,8 +18,8 @@
 		#size-cells = <2>;
 		reg = <0x0 0xe1110000 0 0x1000>,
 		      <0x0 0xe112f000 0 0x2000>,
-		      <0x0 0xe1140000 0 0x10000>,
-		      <0x0 0xe1160000 0 0x10000>;
+		      <0x0 0xe1140000 0 0x2000>,
+		      <0x0 0xe1160000 0 0x2000>;
 		interrupts = <1 9 0xf04>;
 		ranges = <0 0 0 0xe1100000 0 0x100000>;
 		v2m0: v2m@e0080000 {
-- 
2.5.0
