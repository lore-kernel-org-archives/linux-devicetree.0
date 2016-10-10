From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH RESEND] ARM: dts: keystone-k2*: Increase SPI Flash partition
 size for U-Boot
Date: Mon, 10 Oct 2016 19:41:41 +0530
Message-ID: <20161010141141.21333-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

U-Boot SPI Boot image is now more than 512KB for Keystone2 devices and
cannot fit into existing partition. So, increase the SPI Flash partition
for U-Boot to 1MB for all Keystone2 devices.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---

This was submitted to v4.9 merge window but was never picked up:
https://patchwork.kernel.org/patch/9135023/

 arch/arm/boot/dts/keystone-k2e-evm.dts  | 4 ++--
 arch/arm/boot/dts/keystone-k2hk-evm.dts | 4 ++--
 arch/arm/boot/dts/keystone-k2l-evm.dts  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-evm.dts b/arch/arm/boot/dts/keystone-k2e-evm.dts
index ae1ebe7ee021..08ca9dc6ef7c 100644
--- a/arch/arm/boot/dts/keystone-k2e-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2e-evm.dts
@@ -137,13 +137,13 @@
 
 		partition@0 {
 			label = "u-boot-spl";
-			reg = <0x0 0x80000>;
+			reg = <0x0 0x100000>;
 			read-only;
 		};
 
 		partition@1 {
 			label = "misc";
-			reg = <0x80000 0xf80000>;
+			reg = <0x100000 0xf00000>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/keystone-k2hk-evm.dts b/arch/arm/boot/dts/keystone-k2hk-evm.dts
index 2156ff92d08f..369e1245f1ba 100644
--- a/arch/arm/boot/dts/keystone-k2hk-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2hk-evm.dts
@@ -161,13 +161,13 @@
 
 		partition@0 {
 			label = "u-boot-spl";
-			reg = <0x0 0x80000>;
+			reg = <0x0 0x100000>;
 			read-only;
 		};
 
 		partition@1 {
 			label = "misc";
-			reg = <0x80000 0xf80000>;
+			reg = <0x100000 0xf00000>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/keystone-k2l-evm.dts b/arch/arm/boot/dts/keystone-k2l-evm.dts
index 056b42f99d7a..63ae65987ca5 100644
--- a/arch/arm/boot/dts/keystone-k2l-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2l-evm.dts
@@ -110,13 +110,13 @@
 
 		partition@0 {
 			label = "u-boot-spl";
-			reg = <0x0 0x80000>;
+			reg = <0x0 0x100000>;
 			read-only;
 		};
 
 		partition@1 {
 			label = "misc";
-			reg = <0x80000 0xf80000>;
+			reg = <0x100000 0xf00000>;
 		};
 	};
 };
-- 
2.10.1
