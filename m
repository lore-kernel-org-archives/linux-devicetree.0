From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH v2 2/2] mips: dts: Fix a typo in the node unit name
Date: Wed, 24 Jan 2018 12:42:08 +0100
Message-ID: <20180124114210.26457-2-malat@debian.org>
References: <20171214165358.28058-1-malat@debian.org>
 <20180124114210.26457-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180124114210.26457-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Philippe Ombredanne <pombredanne@nexb.com>, Harvey Hunt <harvey.hunt@imgtec.com>, Paul Cercueil <paul@crapouillou.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The unit name was 8c00000 but since the reg property is declared as:

  reg = <0x0 0x4c00000 0x1 0xfb400000>;

the unit name should have been instead 4c00000.

Tested on MIPS Creator CI20 (v1):

$ cat /sys/firmware/devicetree/.../partitions/partition@4c00000/label;echo
system

Reported-by: James Hogan <jhogan@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 7d5e49e40b0d..38078594cf97 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -125,7 +125,7 @@
 					reg = <0x0 0xc00000 0x0 0x4000000>;
 				};
 
-				partition@8c00000 {
+				partition@4c00000 {
 					label = "system";
 					reg = <0x0 0x4c00000 0x1 0xfb400000>;
 				};
-- 
2.11.0
