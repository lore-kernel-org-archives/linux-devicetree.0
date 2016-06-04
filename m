From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 1/3] MIPS: OCTEON: delete built-in DTB pruning code for D-Link DSR-1000N
Date: Sun,  5 Jun 2016 00:18:18 +0300
Message-ID: <1465075100-19705-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

Users will get more complete functionality by using the appended DTB,
so delete the legacy booting support for this board.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts   | 12 ------------
 .../cavium-octeon/executive/cvmx-helper-board.c    | 22 ----------------------
 arch/mips/cavium-octeon/octeon-platform.c          | 11 ++++-------
 3 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
index de61f02..ca6b446 100644
--- a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
+++ b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
@@ -388,16 +388,4 @@
 		usbn = &usbn;
 		led0 = &led0;
 	};
-
-	dsr1000n-leds {
-		compatible = "gpio-leds";
-		usb1 {
-			label = "usb1";
-			gpios = <&gpio 9 1>; /* Active low */
-		};
-		usb2 {
-			label = "usb2";
-			gpios = <&gpio 10 1>; /* Active low */
-		};
-	};
  };
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
index 36e30d6..ff49fc0 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
@@ -186,15 +186,6 @@ int cvmx_helper_board_get_mii_address(int ipd_port)
 			return 7 - ipd_port;
 		else
 			return -1;
-	case CVMX_BOARD_TYPE_CUST_DSR1000N:
-		/*
-		 * Port 2 connects to Broadcom PHY (B5081). Other ports (0-1)
-		 * connect to a switch (BCM53115).
-		 */
-		if (ipd_port == 2)
-			return 8;
-		else
-			return -1;
 	case CVMX_BOARD_TYPE_KONTRON_S1901:
 		if (ipd_port == CVMX_HELPER_BOARD_MGMT_IPD_PORT)
 			return 1;
@@ -289,18 +280,6 @@ cvmx_helper_link_info_t __cvmx_helper_board_link_get(int ipd_port)
 			return result;
 		}
 		break;
-	case CVMX_BOARD_TYPE_CUST_DSR1000N:
-		if (ipd_port == 0 || ipd_port == 1) {
-			/* Ports 0 and 1 connect to a switch (BCM53115). */
-			result.s.link_up = 1;
-			result.s.full_duplex = 1;
-			result.s.speed = 1000;
-			return result;
-		} else {
-			/* Port 2 uses a Broadcom PHY (B5081). */
-			is_broadcom_phy = 1;
-		}
-		break;
 	}
 
 	phy_addr = cvmx_helper_board_get_mii_address(ipd_port);
@@ -765,7 +744,6 @@ enum cvmx_helper_board_usb_clock_types __cvmx_helper_board_usb_get_clock_type(vo
 	case CVMX_BOARD_TYPE_LANAI2_G:
 	case CVMX_BOARD_TYPE_NIC10E_66:
 	case CVMX_BOARD_TYPE_UBNT_E100:
-	case CVMX_BOARD_TYPE_CUST_DSR1000N:
 		return USB_CLOCK_TYPE_CRYSTAL_12;
 	case CVMX_BOARD_TYPE_NIC10E:
 		return USB_CLOCK_TYPE_REF_12;
diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
index 7aeafed..40e2f06 100644
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -689,6 +689,10 @@ int __init octeon_prune_device_tree(void)
 	if (fdt_check_header(initial_boot_params))
 		panic("Corrupt Device Tree.");
 
+	WARN(octeon_bootinfo->board_type == CVMX_BOARD_TYPE_CUST_DSR1000N,
+	     "Built-in DTB booting is deprecated on %s. Please switch to use appended DTB.",
+	     cvmx_board_type_to_string(octeon_bootinfo->board_type));
+
 	aliases = fdt_path_offset(initial_boot_params, "/aliases");
 	if (aliases < 0) {
 		pr_err("Error: No /aliases node in device tree.");
@@ -1032,13 +1036,6 @@ end_led:
 		}
 	}
 
-	if (octeon_bootinfo->board_type != CVMX_BOARD_TYPE_CUST_DSR1000N) {
-		int dsr1000n_leds = fdt_path_offset(initial_boot_params,
-						    "/dsr1000n-leds");
-		if (dsr1000n_leds >= 0)
-			fdt_nop_node(initial_boot_params, dsr1000n_leds);
-	}
-
 	return 0;
 }
 
-- 
2.7.2
