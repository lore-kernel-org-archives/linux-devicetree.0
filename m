From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/4] arm64: dts: meson: disable pad bias for mmc pinmuxes
Date: Thu,  8 Nov 2018 11:44:24 +0100
Message-ID: <20181108104426.1877-3-jbrunet@baylibre.com>
References: <20181108104426.1877-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108104426.1877-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In some cases (such as a boot from SPI) the bootloader or the ROM code may
leave a bias pull-down on the mmc pins. If so the MMC will fail during the
initialisation.

Explicitly disabling the pinmux solves the problem.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index e86f5f721f8f..bc427b9d3e13 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -273,6 +273,7 @@
 							 "emmc_cmd",
 							 "emmc_ds";
 						function = "emmc";
+						bias-disable;
 					};
 				};
 
@@ -503,6 +504,7 @@
 							 "sdio_cmd",
 							 "sdio_clk";
 						function = "sdio";
+						bias-disable;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 1cb8e7e0d0da..32ef82321340 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -363,6 +363,7 @@
 				       "emmc_cmd",
 				       "emmc_clk";
 				function = "emmc";
+				bias-disable;
 			};
 		};
 
@@ -370,6 +371,7 @@
 			mux {
 				groups = "emmc_ds";
 				function = "emmc";
+				bias-disable;
 			};
 		};
 
@@ -416,6 +418,7 @@
 				       "sdcard_cmd",
 				       "sdcard_clk";
 				function = "sdcard";
+				bias-disable;
 			};
 		};
 
@@ -436,6 +439,7 @@
 				       "sdio_cmd",
 				       "sdio_clk";
 				function = "sdio";
+				bias-disable;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 7cfee40d89e9..cfeec5579726 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -310,6 +310,7 @@
 				       "emmc_cmd",
 				       "emmc_clk";
 				function = "emmc";
+				bias-disable;
 			};
 		};
 
@@ -317,6 +318,7 @@
 			mux {
 				groups = "emmc_ds";
 				function = "emmc";
+				bias-disable;
 			};
 		};
 
@@ -363,6 +365,7 @@
 				       "sdcard_cmd",
 				       "sdcard_clk";
 				function = "sdcard";
+				bias-disable;
 			};
 		};
 
@@ -383,6 +386,7 @@
 				       "sdio_cmd",
 				       "sdio_clk";
 				function = "sdio";
+				bias-disable;
 			};
 		};
 
-- 
2.19.1
