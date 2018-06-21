From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [RESEND PATCH 2/3] powerpc: dts: use 'atmel' as at24 manufacturer for kmcent2
Date: Thu, 21 Jun 2018 10:33:04 +0200
Message-ID: <20180621083305.5322-2-brgl@bgdev.pl>
References: <20180621083305.5322-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180621083305.5322-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: devicetree@vger.kernel.org

Using compatible strings without the <manufacturer> part for at24 is
now deprecated. Use a correct 'atmel,<model>' value.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 arch/powerpc/boot/dts/fsl/kmcent2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/kmcent2.dts b/arch/powerpc/boot/dts/fsl/kmcent2.dts
index 5922c1ea0e96..3094df05f5ea 100644
--- a/arch/powerpc/boot/dts/fsl/kmcent2.dts
+++ b/arch/powerpc/boot/dts/fsl/kmcent2.dts
@@ -130,7 +130,7 @@
 					#size-cells = <0>;
 
 					eeprom@54 {
-						compatible = "24c02";
+						compatible = "atmel,24c02";
 						reg = <0x54>;
 						pagesize = <2>;
 						read-only;
-- 
2.17.1
