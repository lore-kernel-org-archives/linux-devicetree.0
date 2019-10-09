From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] riscv: dts: HiFive Unleashed: add default
 chosen/stdout-path
Date: Wed, 9 Oct 2019 12:42:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1910091240220.11044@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Add a default "stdout-path" to the kernel DTS file, as is present in many 
of the board DTS files elsewhere in the kernel tree. With this line 
present, earlyconsole can be enabled by simply passing "earlycon" on the 
kernel command line.  No specific device details are necessary, since the 
kernel will use the stdout-path as the default.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
Tested on a HiFive Unleashed using BBL.

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 104d334511cd..88cfcb96bf23 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -13,6 +13,7 @@
 	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
 
 	chosen {
+		stdout-path = "serial0";
 	};
 
 	cpus {
-- 
2.23.0
