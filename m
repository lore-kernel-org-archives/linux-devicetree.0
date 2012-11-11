From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 04/14] ARM: SPEAr: DT: Update partition info for MTD devices
Date: Sun, 11 Nov 2012 10:09:26 +0530
Message-ID: <5530adca95f45d44153f9c905cbbd7c97b0c4c75.1352608333.git.viresh.kumar@linaro.org>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1352608333.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1352608333.git.viresh.kumar@linaro.org>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: Vipul Kumar Samar <vipulkumar.samar@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, Vipin Kumar <vipin.kumar@st.com>, sr@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Vipin Kumar <vipin.kumar@st.com>

This patch enhances partition information of MTD devices like fsmc-nand and
spear-smi.

Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
Signed-off-by: Vipul Kumar Samar <vipulkumar.samar@st.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear1310-evb.dts | 43 ++++++++++++++++++++++++++++++++-----
 arch/arm/boot/dts/spear1340-evb.dts | 43 ++++++++++++++++++++++++++++++++-----
 arch/arm/boot/dts/spear300-evb.dts  | 18 +++++++++++-----
 arch/arm/boot/dts/spear310-evb.dts  | 18 +++++++++++-----
 arch/arm/boot/dts/spear320-evb.dts  | 18 +++++++++++-----
 arch/arm/boot/dts/spear600-evb.dts  | 18 +++++++++++-----
 6 files changed, 128 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index 08697ac..2e2887b 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -120,6 +120,31 @@
 
 		fsmc: flash@b0000000 {
 			status = "okay";
+
+			partition@0 {
+				label = "xloader";
+				reg = <0x0 0x80000>;
+			};
+			partition@80000 {
+				label = "u-boot";
+				reg = <0x80000 0x140000>;
+			};
+			partition@1C0000 {
+				label = "environment";
+				reg = <0x1C0000 0x40000>;
+			};
+			partition@200000 {
+				label = "dtb";
+				reg = <0x200000 0x40000>;
+			};
+			partition@240000 {
+				label = "linux";
+				reg = <0x240000 0xC00000>;
+			};
+			partition@E40000 {
+				label = "rootfs";
+				reg = <0xE40000 0x0>;
+			};
 		};
 
 		gmac0: eth@e2000000 {
@@ -146,15 +171,23 @@
 				};
 				partition@10000 {
 					label = "u-boot";
-					reg = <0x10000 0x40000>;
+					reg = <0x10000 0x50000>;
+				};
+				partition@60000 {
+					label = "environment";
+					reg = <0x60000 0x10000>;
+				};
+				partition@70000 {
+					label = "dtb";
+					reg = <0x70000 0x10000>;
 				};
-				partition@50000 {
+				partition@80000 {
 					label = "linux";
-					reg = <0x50000 0x2c0000>;
+					reg = <0x80000 0x310000>;
 				};
-				partition@310000 {
+				partition@390000 {
 					label = "rootfs";
-					reg = <0x310000 0x4f0000>;
+					reg = <0x390000 0x0>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index 8e35c14..8d6339d 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -128,6 +128,31 @@
 
 		fsmc: flash@b0000000 {
 			status = "okay";
+
+			partition@0 {
+				label = "xloader";
+				reg = <0x0 0x200000>;
+			};
+			partition@200000 {
+				label = "u-boot";
+				reg = <0x200000 0x200000>;
+			};
+			partition@400000 {
+				label = "environment";
+				reg = <0x400000 0x100000>;
+			};
+			partition@500000 {
+				label = "dtb";
+				reg = <0x500000 0x100000>;
+			};
+			partition@600000 {
+				label = "linux";
+				reg = <0x600000 0xC00000>;
+			};
+			partition@1200000 {
+				label = "rootfs";
+				reg = <0x1200000 0x0>;
+			};
 		};
 
 		gmac0: eth@e2000000 {
@@ -154,15 +179,23 @@
 				};
 				partition@10000 {
 					label = "u-boot";
-					reg = <0x10000 0x40000>;
+					reg = <0x10000 0x50000>;
+				};
+				partition@60000 {
+					label = "environment";
+					reg = <0x60000 0x10000>;
+				};
+				partition@70000 {
+					label = "dtb";
+					reg = <0x70000 0x10000>;
 				};
-				partition@50000 {
+				partition@80000 {
 					label = "linux";
-					reg = <0x50000 0x2c0000>;
+					reg = <0x80000 0x310000>;
 				};
-				partition@310000 {
+				partition@390000 {
 					label = "rootfs";
-					reg = <0x310000 0x4f0000>;
+					reg = <0x390000 0x0>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/spear300-evb.dts b/arch/arm/boot/dts/spear300-evb.dts
index 1e7c7a8..b3265f6 100644
--- a/arch/arm/boot/dts/spear300-evb.dts
+++ b/arch/arm/boot/dts/spear300-evb.dts
@@ -100,15 +100,23 @@
 				};
 				partition@10000 {
 					label = "u-boot";
-					reg = <0x10000 0x40000>;
+					reg = <0x10000 0x50000>;
 				};
-				partition@50000 {
+				partition@60000 {
+					label = "environment";
+					reg = <0x60000 0x10000>;
+				};
+				partition@70000 {
+					label = "dtb";
+					reg = <0x70000 0x10000>;
+				};
+				partition@80000 {
 					label = "linux";
-					reg = <0x50000 0x2c0000>;
+					reg = <0x80000 0x310000>;
 				};
-				partition@310000 {
+				partition@390000 {
 					label = "rootfs";
-					reg = <0x310000 0x4f0000>;
+					reg = <0x390000 0x0>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/spear310-evb.dts b/arch/arm/boot/dts/spear310-evb.dts
index b00544e..b30fa0e 100644
--- a/arch/arm/boot/dts/spear310-evb.dts
+++ b/arch/arm/boot/dts/spear310-evb.dts
@@ -114,15 +114,23 @@
 				};
 				partition@10000 {
 					label = "u-boot";
-					reg = <0x10000 0x40000>;
+					reg = <0x10000 0x50000>;
 				};
-				partition@50000 {
+				partition@60000 {
+					label = "environment";
+					reg = <0x60000 0x10000>;
+				};
+				partition@70000 {
+					label = "dtb";
+					reg = <0x70000 0x10000>;
+				};
+				partition@80000 {
 					label = "linux";
-					reg = <0x50000 0x2c0000>;
+					reg = <0x80000 0x310000>;
 				};
-				partition@310000 {
+				partition@390000 {
 					label = "rootfs";
-					reg = <0x310000 0x4f0000>;
+					reg = <0x390000 0x0>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/spear320-evb.dts b/arch/arm/boot/dts/spear320-evb.dts
index 3f87cd0..a3061ad 100644
--- a/arch/arm/boot/dts/spear320-evb.dts
+++ b/arch/arm/boot/dts/spear320-evb.dts
@@ -118,15 +118,23 @@
 				};
 				partition@10000 {
 					label = "u-boot";
-					reg = <0x10000 0x40000>;
+					reg = <0x10000 0x50000>;
 				};
-				partition@50000 {
+				partition@60000 {
+					label = "environment";
+					reg = <0x60000 0x10000>;
+				};
+				partition@70000 {
+					label = "dtb";
+					reg = <0x70000 0x10000>;
+				};
+				partition@80000 {
 					label = "linux";
-					reg = <0x50000 0x2c0000>;
+					reg = <0x80000 0x310000>;
 				};
-				partition@310000 {
+				partition@390000 {
 					label = "rootfs";
-					reg = <0x310000 0x4f0000>;
+					reg = <0x390000 0x0>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/spear600-evb.dts b/arch/arm/boot/dts/spear600-evb.dts
index 1119c22..16e4de4 100644
--- a/arch/arm/boot/dts/spear600-evb.dts
+++ b/arch/arm/boot/dts/spear600-evb.dts
@@ -49,15 +49,23 @@
 				};
 				partition@10000 {
 					label = "u-boot";
-					reg = <0x10000 0x40000>;
+					reg = <0x10000 0x50000>;
 				};
-				partition@50000 {
+				partition@60000 {
+					label = "environment";
+					reg = <0x60000 0x10000>;
+				};
+				partition@70000 {
+					label = "dtb";
+					reg = <0x70000 0x10000>;
+				};
+				partition@80000 {
 					label = "linux";
-					reg = <0x50000 0x2c0000>;
+					reg = <0x80000 0x310000>;
 				};
-				partition@310000 {
+				partition@390000 {
 					label = "rootfs";
-					reg = <0x310000 0x4f0000>;
+					reg = <0x390000 0x0>;
 				};
 			};
 		};
-- 
1.7.12.rc2.18.g61b472e
