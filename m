From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 08/12] ARM: dts: armada-38x: use reworked NAND controller driver
Date: Thu,  7 Dec 2017 21:18:10 +0100
Message-ID: <20171207201814.30411-9-miquel.raynal@free-electrons.com>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207201814.30411-1-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ofer Heifetz <oferh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the new bindings of the reworked Marvell NAND controller driver.
Also adapt the nand controller node organization to distinguish which
property is relevant for the controller, and which one is NAND chip
specific. Expose the partitions as a subnode of the NAND chip.

Remove the 'marvell,nand-enable-arbiter' property, not needed anymore as
the driver activates the arbiter by default for all boards (either
needed or harmless).

Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-385-db-ap.dts          |  69 ++++++------
 arch/arm/boot/dts/armada-385-linksys-caiman.dts | 129 +++++++++++-----------
 arch/arm/boot/dts/armada-385-linksys-cobra.dts  | 129 +++++++++++-----------
 arch/arm/boot/dts/armada-385-linksys-rango.dts  | 141 ++++++++++++------------
 arch/arm/boot/dts/armada-385-linksys-shelby.dts | 129 +++++++++++-----------
 arch/arm/boot/dts/armada-385-linksys.dtsi       |  16 ++-
 arch/arm/boot/dts/armada-388-db.dts             |  55 +++++----
 arch/arm/boot/dts/armada-38x.dtsi               |   6 +-
 8 files changed, 356 insertions(+), 318 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-db-ap.dts b/arch/arm/boot/dts/armada-385-db-ap.dts
index 25d2d720dc0e..c741708dabdb 100644
--- a/arch/arm/boot/dts/armada-385-db-ap.dts
+++ b/arch/arm/boot/dts/armada-385-db-ap.dts
@@ -166,39 +166,6 @@
 				status = "okay";
 			};
 
-			nfc: flash@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-
-				partitions {
-					compatible = "fixed-partitions";
-					#address-cells = <1>;
-					#size-cells = <1>;
-
-					partition@0 {
-						label = "U-Boot";
-						reg = <0x00000000 0x00800000>;
-						read-only;
-					};
-
-					partition@800000 {
-						label = "uImage";
-						reg = <0x00800000 0x00400000>;
-						read-only;
-					};
-
-					partition@c00000 {
-						label = "Root";
-						reg = <0x00c00000 0x3f400000>;
-					};
-				};
-			};
-
 			usb3@f0000 {
 				status = "okay";
 				usb-phy = <&usb3_phy>;
@@ -263,3 +230,39 @@
 		spi-max-frequency = <54000000>;
 	};
 };
+
+&nand_controller {
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		marvell,rb = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0x00000000 0x00800000>;
+				read-only;
+			};
+
+			partition@800000 {
+				label = "uImage";
+				reg = <0x00800000 0x00400000>;
+				read-only;
+			};
+
+			partition@c00000 {
+				label = "Root";
+				reg = <0x00c00000 0x3f400000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-385-linksys-caiman.dts b/arch/arm/boot/dts/armada-385-linksys-caiman.dts
index ee669ae61011..e769bcf7a9d1 100644
--- a/arch/arm/boot/dts/armada-385-linksys-caiman.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-caiman.dts
@@ -105,67 +105,72 @@
 
 &nand {
 	/* 128MiB */
-
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0000000 0x200000>;  /* 2MiB */
-		read-only;
-	};
-
-	partition@100000 {
-		label = "u_env";
-		reg = <0x200000 0x40000>;    /* 256KiB */
-	};
-
-	partition@140000 {
-		label = "s_env";
-		reg = <0x240000 0x40000>;    /* 256KiB */
-	};
-
-	partition@900000 {
-		label = "devinfo";
-		reg = <0x900000 0x100000>;   /* 1MiB */
-		read-only;
-	};
-
-	/* kernel1 overlaps with rootfs1 by design */
-	partition@a00000 {
-		label = "kernel1";
-		reg = <0xa00000 0x2800000>;  /* 40MiB */
-	};
-
-	partition@1000000 {
-		label = "rootfs1";
-		reg = <0x1000000 0x2200000>;  /* 34MiB */
-	};
-
-	/* kernel2 overlaps with rootfs2 by design */
-	partition@3200000 {
-		label = "kernel2";
-		reg = <0x3200000 0x2800000>; /* 40MiB */
-	};
-
-	partition@3800000 {
-		label = "rootfs2";
-		reg = <0x3800000 0x2200000>; /* 34MiB */
-	};
-
-	/*
-	 * 38MiB, last MiB is for the BBT, not writable
-	 */
-	partition@5a00000 {
-		label = "syscfg";
-		reg = <0x5a00000 0x2600000>;
-	};
-
-	/*
-	 * Unused area between "s_env" and "devinfo".
-	 * Moved here because otherwise the renumbered
-	 * partitions would break the bootloader
-	 * supplied bootargs
-	 */
-	partition@180000 {
-		label = "unused_area";
-		reg = <0x280000 0x680000>;   /* 6.5MiB */
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x200000>;  /* 2MiB */
+			read-only;
+		};
+
+		partition@100000 {
+			label = "u_env";
+			reg = <0x200000 0x40000>;    /* 256KiB */
+		};
+
+		partition@140000 {
+			label = "s_env";
+			reg = <0x240000 0x40000>;    /* 256KiB */
+		};
+
+		partition@900000 {
+			label = "devinfo";
+			reg = <0x900000 0x100000>;   /* 1MiB */
+			read-only;
+		};
+
+		/* kernel1 overlaps with rootfs1 by design */
+		partition@a00000 {
+			label = "kernel1";
+			reg = <0xa00000 0x2800000>;  /* 40MiB */
+		};
+
+		partition@1000000 {
+			label = "rootfs1";
+			reg = <0x1000000 0x2200000>;  /* 34MiB */
+		};
+
+		/* kernel2 overlaps with rootfs2 by design */
+		partition@3200000 {
+			label = "kernel2";
+			reg = <0x3200000 0x2800000>; /* 40MiB */
+		};
+
+		partition@3800000 {
+			label = "rootfs2";
+			reg = <0x3800000 0x2200000>; /* 34MiB */
+		};
+
+		/*
+		 * 38MiB, last MiB is for the BBT, not writable
+		 */
+		partition@5a00000 {
+			label = "syscfg";
+			reg = <0x5a00000 0x2600000>;
+		};
+
+		/*
+		 * Unused area between "s_env" and "devinfo".
+		 * Moved here because otherwise the renumbered
+		 * partitions would break the bootloader
+		 * supplied bootargs
+		 */
+		partition@180000 {
+			label = "unused_area";
+			reg = <0x280000 0x680000>;   /* 6.5MiB */
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/armada-385-linksys-cobra.dts b/arch/arm/boot/dts/armada-385-linksys-cobra.dts
index 5169ca89c55a..690be217838c 100644
--- a/arch/arm/boot/dts/armada-385-linksys-cobra.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-cobra.dts
@@ -105,67 +105,72 @@
 
 &nand {
 	/* 128MiB */
-
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0000000 0x200000>;  /* 2MiB */
-		read-only;
-	};
-
-	partition@100000 {
-		label = "u_env";
-		reg = <0x200000 0x40000>;    /* 256KiB */
-	};
-
-	partition@140000 {
-		label = "s_env";
-		reg = <0x240000 0x40000>;    /* 256KiB */
-	};
-
-	partition@900000 {
-		label = "devinfo";
-		reg = <0x900000 0x100000>;   /* 1MiB */
-		read-only;
-	};
-
-	/* kernel1 overlaps with rootfs1 by design */
-	partition@a00000 {
-		label = "kernel1";
-		reg = <0xa00000 0x2800000>;  /* 40MiB */
-	};
-
-	partition@1000000 {
-		label = "rootfs1";
-		reg = <0x1000000 0x2200000>;  /* 34MiB */
-	};
-
-	/* kernel2 overlaps with rootfs2 by design */
-	partition@3200000 {
-		label = "kernel2";
-		reg = <0x3200000 0x2800000>; /* 40MiB */
-	};
-
-	partition@3800000 {
-		label = "rootfs2";
-		reg = <0x3800000 0x2200000>; /* 34MiB */
-	};
-
-	/*
-	 * 38MiB, last MiB is for the BBT, not writable
-	 */
-	partition@5a00000 {
-		label = "syscfg";
-		reg = <0x5a00000 0x2600000>;
-	};
-
-	/*
-	 * Unused area between "s_env" and "devinfo".
-	 * Moved here because otherwise the renumbered
-	 * partitions would break the bootloader
-	 * supplied bootargs
-	 */
-	partition@180000 {
-		label = "unused_area";
-		reg = <0x280000 0x680000>;   /* 6.5MiB */
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x200000>;  /* 2MiB */
+			read-only;
+		};
+
+		partition@100000 {
+			label = "u_env";
+			reg = <0x200000 0x40000>;    /* 256KiB */
+		};
+
+		partition@140000 {
+			label = "s_env";
+			reg = <0x240000 0x40000>;    /* 256KiB */
+		};
+
+		partition@900000 {
+			label = "devinfo";
+			reg = <0x900000 0x100000>;   /* 1MiB */
+			read-only;
+		};
+
+		/* kernel1 overlaps with rootfs1 by design */
+		partition@a00000 {
+			label = "kernel1";
+			reg = <0xa00000 0x2800000>;  /* 40MiB */
+		};
+
+		partition@1000000 {
+			label = "rootfs1";
+			reg = <0x1000000 0x2200000>;  /* 34MiB */
+		};
+
+		/* kernel2 overlaps with rootfs2 by design */
+		partition@3200000 {
+			label = "kernel2";
+			reg = <0x3200000 0x2800000>; /* 40MiB */
+		};
+
+		partition@3800000 {
+			label = "rootfs2";
+			reg = <0x3800000 0x2200000>; /* 34MiB */
+		};
+
+		/*
+		 * 38MiB, last MiB is for the BBT, not writable
+		 */
+		partition@5a00000 {
+			label = "syscfg";
+			reg = <0x5a00000 0x2600000>;
+		};
+
+		/*
+		 * Unused area between "s_env" and "devinfo".
+		 * Moved here because otherwise the renumbered
+		 * partitions would break the bootloader
+		 * supplied bootargs
+		 */
+		partition@180000 {
+			label = "unused_area";
+			reg = <0x280000 0x680000>;   /* 6.5MiB */
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/armada-385-linksys-rango.dts b/arch/arm/boot/dts/armada-385-linksys-rango.dts
index da8a0f3d432b..93570c6bfe85 100644
--- a/arch/arm/boot/dts/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-rango.dts
@@ -113,74 +113,79 @@
 
 &nand {
 	/* AMD/Spansion S34ML02G2 256MiB, OEM Layout */
-
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0000000 0x200000>;  /* 2MiB */
-		read-only;
-	};
-
-	partition@200000 {
-		label = "u_env";
-		reg = <0x200000 0x20000>;    /* 128KiB */
-	};
-
-	partition@220000 {
-		label = "s_env";
-		reg = <0x220000 0x40000>;    /* 256KiB */
-	};
-
-	partition@7e0000 {
-		label = "devinfo";
-		reg = <0x7e0000 0x40000>;   /* 256KiB */
-		read-only;
-	};
-
-	partition@820000 {
-		label = "sysdiag";
-		reg = <0x820000 0x1e0000>;   /* 1920KiB */
-		read-only;
-	};
-
-	/* kernel1 overlaps with rootfs1 by design */
-	partition@a00000 {
-		label = "kernel1";
-		reg = <0xa00000 0x5000000>;  /* 80MiB */
-	};
-
-	partition@1000000 {
-		label = "rootfs1";
-		reg = <0x1000000 0x4a00000>;  /* 74MiB */
-	};
-
-	/* kernel2 overlaps with rootfs2 by design */
-	partition@5a00000 {
-		label = "kernel2";
-		reg = <0x5a00000 0x5000000>; /* 80MiB */
-	};
-
-	partition@6000000 {
-		label = "rootfs2";
-		reg = <0x6000000 0x4a00000>; /* 74MiB */
-	};
-
-	/*
-	 * 86MiB, last MiB is for the BBT, not writable
-	 */
-	partition@aa00000 {
-		label = "syscfg";
-		reg = <0xaa00000 0x5600000>;
-	};
-
-	/*
-	 * Unused area between "s_env" and "devinfo".
-	 * Moved here because otherwise the renumbered
-	 * partitions would break the bootloader
-	 * supplied bootargs
-	 */
-	partition@180000 {
-		label = "unused_area";
-		reg = <0x260000 0x5c0000>;   /* 5.75MiB */
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x200000>;  /* 2MiB */
+			read-only;
+		};
+
+		partition@200000 {
+			label = "u_env";
+			reg = <0x200000 0x20000>;    /* 128KiB */
+		};
+
+		partition@220000 {
+			label = "s_env";
+			reg = <0x220000 0x40000>;    /* 256KiB */
+		};
+
+		partition@7e0000 {
+			label = "devinfo";
+			reg = <0x7e0000 0x40000>;   /* 256KiB */
+			read-only;
+		};
+
+		partition@820000 {
+			label = "sysdiag";
+			reg = <0x820000 0x1e0000>;   /* 1920KiB */
+			read-only;
+		};
+
+		/* kernel1 overlaps with rootfs1 by design */
+		partition@a00000 {
+			label = "kernel1";
+			reg = <0xa00000 0x5000000>;  /* 80MiB */
+		};
+
+		partition@1000000 {
+			label = "rootfs1";
+			reg = <0x1000000 0x4a00000>;  /* 74MiB */
+		};
+
+		/* kernel2 overlaps with rootfs2 by design */
+		partition@5a00000 {
+			label = "kernel2";
+			reg = <0x5a00000 0x5000000>; /* 80MiB */
+		};
+
+		partition@6000000 {
+			label = "rootfs2";
+			reg = <0x6000000 0x4a00000>; /* 74MiB */
+		};
+
+		/*
+		 * 86MiB, last MiB is for the BBT, not writable
+		 */
+		partition@aa00000 {
+			label = "syscfg";
+			reg = <0xaa00000 0x5600000>;
+		};
+
+		/*
+		 * Unused area between "s_env" and "devinfo".
+		 * Moved here because otherwise the renumbered
+		 * partitions would break the bootloader
+		 * supplied bootargs
+		 */
+		partition@180000 {
+			label = "unused_area";
+			reg = <0x260000 0x5c0000>;   /* 5.75MiB */
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/armada-385-linksys-shelby.dts b/arch/arm/boot/dts/armada-385-linksys-shelby.dts
index 94aa35bc0bff..4694556700ff 100644
--- a/arch/arm/boot/dts/armada-385-linksys-shelby.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-shelby.dts
@@ -105,67 +105,72 @@
 
 &nand {
 	/* 128MiB */
-
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0000000 0x200000>;  /* 2MiB */
-		read-only;
-	};
-
-	partition@100000 {
-		label = "u_env";
-		reg = <0x200000 0x40000>;    /* 256KiB */
-	};
-
-	partition@140000 {
-		label = "s_env";
-		reg = <0x240000 0x40000>;    /* 256KiB */
-	};
-
-	partition@900000 {
-		label = "devinfo";
-		reg = <0x900000 0x100000>;   /* 1MiB */
-		read-only;
-	};
-
-	/* kernel1 overlaps with rootfs1 by design */
-	partition@a00000 {
-		label = "kernel1";
-		reg = <0xa00000 0x2800000>;  /* 40MiB */
-	};
-
-	partition@1000000 {
-		label = "rootfs1";
-		reg = <0x1000000 0x2200000>;  /* 34MiB */
-	};
-
-	/* kernel2 overlaps with rootfs2 by design */
-	partition@3200000 {
-		label = "kernel2";
-		reg = <0x3200000 0x2800000>; /* 40MiB */
-	};
-
-	partition@3800000 {
-		label = "rootfs2";
-		reg = <0x3800000 0x2200000>; /* 34MiB */
-	};
-
-	/*
-	 * 38MiB, last MiB is for the BBT, not writable
-	 */
-	partition@5a00000 {
-		label = "syscfg";
-		reg = <0x5a00000 0x2600000>;
-	};
-
-	/*
-	 * Unused area between "s_env" and "devinfo".
-	 * Moved here because otherwise the renumbered
-	 * partitions would break the bootloader
-	 * supplied bootargs
-	 */
-	partition@180000 {
-		label = "unused_area";
-		reg = <0x280000 0x680000>;   /* 6.5MiB */
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x200000>;  /* 2MiB */
+			read-only;
+		};
+
+		partition@100000 {
+			label = "u_env";
+			reg = <0x200000 0x40000>;    /* 256KiB */
+		};
+
+		partition@140000 {
+			label = "s_env";
+			reg = <0x240000 0x40000>;    /* 256KiB */
+		};
+
+		partition@900000 {
+			label = "devinfo";
+			reg = <0x900000 0x100000>;   /* 1MiB */
+			read-only;
+		};
+
+		/* kernel1 overlaps with rootfs1 by design */
+		partition@a00000 {
+			label = "kernel1";
+			reg = <0xa00000 0x2800000>;  /* 40MiB */
+		};
+
+		partition@1000000 {
+			label = "rootfs1";
+			reg = <0x1000000 0x2200000>;  /* 34MiB */
+		};
+
+		/* kernel2 overlaps with rootfs2 by design */
+		partition@3200000 {
+			label = "kernel2";
+			reg = <0x3200000 0x2800000>; /* 40MiB */
+		};
+
+		partition@3800000 {
+			label = "rootfs2";
+			reg = <0x3800000 0x2200000>; /* 34MiB */
+		};
+
+		/*
+		 * 38MiB, last MiB is for the BBT, not writable
+		 */
+		partition@5a00000 {
+			label = "syscfg";
+			reg = <0x5a00000 0x2600000>;
+		};
+
+		/*
+		 * Unused area between "s_env" and "devinfo".
+		 * Moved here because otherwise the renumbered
+		 * partitions would break the bootloader
+		 * supplied bootargs
+		 */
+		partition@180000 {
+			label = "unused_area";
+			reg = <0x280000 0x680000>;   /* 6.5MiB */
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index e1f355ffc8f7..214630b06f0e 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -169,13 +169,19 @@
 	};
 };
 
-&nand {
+&nand_controller {
 	/* 128MiB or 256MiB */
 	status = "okay";
-	num-cs = <1>;
-	marvell,nand-keep-config;
-	marvell,nand-enable-arbiter;
-	nand-on-flash-bbt;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand: nand@0 {
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		marvell,rb = <0>;
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+	};
 };
 
 &mdio {
diff --git a/arch/arm/boot/dts/armada-388-db.dts b/arch/arm/boot/dts/armada-388-db.dts
index a4ec1fa37529..61bfed5adaaa 100644
--- a/arch/arm/boot/dts/armada-388-db.dts
+++ b/arch/arm/boot/dts/armada-388-db.dts
@@ -128,29 +128,6 @@
 				status = "okay";
 			};
 
-			flash@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "U-Boot";
-					reg = <0 0x800000>;
-				};
-				partition@800000 {
-					label = "Linux";
-					reg = <0x800000 0x800000>;
-				};
-				partition@1000000 {
-					label = "Filesystem";
-					reg = <0x1000000 0x3f000000>;
-				};
-			};
-
 			sdhci@d8000 {
 				broken-cd;
 				wp-inverted;
@@ -202,3 +179,35 @@
 	};
 };
 
+&nand_controller {
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		marvell,rb = <0>;
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0 0x800000>;
+			};
+			partition@800000 {
+				label = "Linux";
+				reg = <0x800000 0x800000>;
+			};
+			partition@1000000 {
+				label = "Filesystem";
+				reg = <0x1000000 0x3f000000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 00ff549d4e39..28669188f69d 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -583,11 +583,11 @@
 				status = "okay";
 			};
 
-			nand: flash@d0000 {
-				compatible = "marvell,armada370-nand";
+			nand_controller: nand-controller@d0000 {
+				compatible = "marvell,armada370-nand-controller";
 				reg = <0xd0000 0x54>;
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&coredivclk 0>;
 				status = "disabled";
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
