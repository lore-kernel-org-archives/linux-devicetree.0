From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [RESEND PATCH 1/3] powerpc: dts: use 'atmel' as at24 anufacturer for pdm360ng
Date: Thu, 21 Jun 2018 10:33:03 +0200
Message-ID: <20180621083305.5322-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: devicetree@vger.kernel.org

Using 'at' as the <manufacturer> part of the compatible string is now
deprecated. Use a correct string: 'atmel,<model>'.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 arch/powerpc/boot/dts/pdm360ng.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/pdm360ng.dts
index 445b88114009..df1283b63d9b 100644
--- a/arch/powerpc/boot/dts/pdm360ng.dts
+++ b/arch/powerpc/boot/dts/pdm360ng.dts
@@ -98,7 +98,7 @@
 			fsl,preserve-clocking;
 
 			eeprom@50 {
-				compatible = "at,24c01";
+				compatible = "atmel,24c01";
 				reg = <0x50>;
 			};
 
-- 
2.17.1
