From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 06/12] ARM: dts: armada-370-xp: use reworked NAND controller driver
Date: Thu,  7 Dec 2017 21:18:08 +0100
Message-ID: <20171207201814.30411-7-miquel.raynal@free-electrons.com>
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

Remove the 'marvell,nand-enable-arbiter' property, not needed anymore
as the driver activates the arbiter by default for all boards (either
needed or harmless).

Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-db.dts                |  57 ++++----
 arch/arm/boot/dts/armada-370-dlink-dns327l.dts     | 120 ++++++++--------
 arch/arm/boot/dts/armada-370-mirabox.dts           |  51 ++++---
 arch/arm/boot/dts/armada-370-netgear-rn102.dts     |  90 ++++++------
 arch/arm/boot/dts/armada-370-netgear-rn104.dts     |  90 ++++++------
 arch/arm/boot/dts/armada-370-rd.dts                |  52 ++++---
 arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi |  64 +++++----
 arch/arm/boot/dts/armada-370-xp.dtsi               |   6 +-
 arch/arm/boot/dts/armada-xp-db-dxbc2.dts           |   2 +-
 arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts      |   2 +-
 arch/arm/boot/dts/armada-xp-db.dts                 |   2 +-
 arch/arm/boot/dts/armada-xp-gp.dts                 |   2 +-
 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts    |   2 +-
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts      | 156 +++++++++++----------
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts     |  90 ++++++------
 15 files changed, 434 insertions(+), 352 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
index c4eef7323367..640f87a11834 100644
--- a/arch/arm/boot/dts/armada-370-db.dts
+++ b/arch/arm/boot/dts/armada-370-db.dts
@@ -142,33 +142,6 @@
 			usb@51000 {
 				status = "okay";
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
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
-						reg = <0 0x800000>;
-					};
-					partition@800000 {
-						label = "Linux";
-						reg = <0x800000 0x800000>;
-					};
-					partition@1000000 {
-						label = "Filesystem";
-						reg = <0x1000000 0x3f000000>;
-					};
-				};
-			};
 		};
 	};
 
@@ -276,3 +249,33 @@
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
diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
index db7f3aa38670..bb9be4d2b17e 100644
--- a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
+++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
@@ -81,61 +81,6 @@
 			usb@50000 {
 				status = "okay";
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "u-boot";
-					/* 1.0 MiB */
-					reg = <0x0000000 0x100000>;
-					read-only;
-				};
-
-				partition@100000 {
-					label = "u-boot-env";
-					/* 128 KiB */
-					reg = <0x100000 0x20000>;
-					read-only;
-				};
-
-				partition@120000 {
-					label = "uImage";
-					/* 7 MiB */
-					reg = <0x120000 0x700000>;
-				};
-
-				partition@820000 {
-					label = "ubifs";
-					/* ~ 84 MiB */
-					reg = <0x820000 0x54e0000>;
-				};
-
-				/* Hardcoded into stock bootloader */
-				partition@5d00000 {
-					label = "failsafe-uImage";
-					/* 5 MiB */
-					reg = <0x5d00000 0x500000>;
-				};
-
-				partition@6200000 {
-					label = "failsafe-fs";
-					/* 29 MiB */
-					reg = <0x6200000 0x1d00000>;
-				};
-
-				partition@7f00000 {
-					label = "bbt";
-					/* 1 MiB for BBT */
-					reg = <0x7f00000 0x100000>;
-				};
-			};
 		};
 	};
 
@@ -356,3 +301,68 @@
 	clock-frequency = <100000>;
 	status = "okay";
 };
+
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
+				label = "u-boot";
+				/* 1.0 MiB */
+				reg = <0x0000000 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "u-boot-env";
+				/* 128 KiB */
+				reg = <0x100000 0x20000>;
+				read-only;
+			};
+
+			partition@120000 {
+				label = "uImage";
+				/* 7 MiB */
+				reg = <0x120000 0x700000>;
+			};
+
+			partition@820000 {
+				label = "ubifs";
+				/* ~ 84 MiB */
+				reg = <0x820000 0x54e0000>;
+			};
+
+			/* Hardcoded into stock bootloader */
+			partition@5d00000 {
+				label = "failsafe-uImage";
+				/* 5 MiB */
+				reg = <0x5d00000 0x500000>;
+			};
+
+			partition@6200000 {
+				label = "failsafe-fs";
+				/* 29 MiB */
+				reg = <0x6200000 0x1d00000>;
+			};
+
+			partition@7f00000 {
+				label = "bbt";
+				/* 1 MiB for BBT */
+				reg = <0x7f00000 0x100000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
index 702f58c9642d..af4db48ca2eb 100644
--- a/arch/arm/boot/dts/armada-370-mirabox.dts
+++ b/arch/arm/boot/dts/armada-370-mirabox.dts
@@ -145,27 +145,6 @@
 					reg = <0x25>;
 				};
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-
-				partition@0 {
-					label = "U-Boot";
-					reg = <0 0x400000>;
-				};
-				partition@400000 {
-					label = "Linux";
-					reg = <0x400000 0x400000>;
-				};
-				partition@800000 {
-					label = "Filesystem";
-					reg = <0x800000 0x3f800000>;
-				};
-			};
 		};
 	};
 };
@@ -210,3 +189,33 @@
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
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0 0x400000>;
+			};
+			partition@400000 {
+				label = "Linux";
+				reg = <0x400000 0x400000>;
+			};
+			partition@800000 {
+				label = "Filesystem";
+				reg = <0x800000 0x3f800000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-370-netgear-rn102.dts b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
index b1a96e95e921..01bbb7d21cbc 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn102.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
@@ -118,46 +118,6 @@
 					pwm_polarity = <0>;
 				};
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-
-				/* Use Hardware BCH ECC */
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "u-boot";
-					reg = <0x0000000 0x180000>;  /* 1.5MB */
-					read-only;
-				};
-
-				partition@180000 {
-					label = "u-boot-env";
-					reg = <0x180000 0x20000>;    /* 128KB */
-					read-only;
-				};
-
-				partition@200000 {
-					label = "uImage";
-					reg = <0x0200000 0x600000>;    /* 6MB */
-				};
-
-				partition@800000 {
-					label = "minirootfs";
-					reg = <0x0800000 0x400000>;    /* 4MB */
-				};
-
-				/* Last MB is for the BBT, i.e. not writable */
-				partition@c00000 {
-					label = "ubifs";
-					reg = <0x0c00000 0x7400000>; /* 116MB */
-				};
-			};
 		};
 	};
 
@@ -301,3 +261,53 @@
 		marvell,function = "gpio";
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
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+
+		/* Use Hardware BCH ECC */
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x180000>;  /* 1.5MB */
+				read-only;
+			};
+
+			partition@180000 {
+				label = "u-boot-env";
+				reg = <0x180000 0x20000>;    /* 128KB */
+				read-only;
+			};
+
+			partition@200000 {
+				label = "uImage";
+				reg = <0x0200000 0x600000>;    /* 6MB */
+			};
+
+			partition@800000 {
+				label = "minirootfs";
+				reg = <0x0800000 0x400000>;    /* 4MB */
+			};
+
+			/* Last MB is for the BBT, i.e. not writable */
+			partition@c00000 {
+				label = "ubifs";
+				reg = <0x0c00000 0x7400000>; /* 116MB */
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-370-netgear-rn104.dts b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
index d67e7aa42b54..725181300575 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn104.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
@@ -127,46 +127,6 @@
 					reg = <0x23>;
 				};
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-
-				/* Use Hardware BCH ECC */
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "u-boot";
-					reg = <0x0000000 0x180000>;  /* 1.5MB */
-					read-only;
-				};
-
-				partition@180000 {
-					label = "u-boot-env";
-					reg = <0x180000 0x20000>;    /* 128KB */
-					read-only;
-				};
-
-				partition@200000 {
-					label = "uImage";
-					reg = <0x0200000 0x600000>;    /* 6MB */
-				};
-
-				partition@800000 {
-					label = "minirootfs";
-					reg = <0x0800000 0x400000>;    /* 4MB */
-				};
-
-				/* Last MB is for the BBT, i.e. not writable */
-				partition@c00000 {
-					label = "ubifs";
-					reg = <0x0c00000 0x7400000>; /* 116MB */
-				};
-			};
 		};
 	};
 
@@ -313,3 +273,53 @@
 		marvell,function = "gpio";
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
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+
+		/* Use Hardware BCH ECC */
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x180000>;  /* 1.5MB */
+				read-only;
+			};
+
+			partition@180000 {
+				label = "u-boot-env";
+				reg = <0x180000 0x20000>;    /* 128KB */
+				read-only;
+			};
+
+			partition@200000 {
+				label = "uImage";
+				reg = <0x0200000 0x600000>;    /* 6MB */
+			};
+
+			partition@800000 {
+				label = "minirootfs";
+				reg = <0x0800000 0x400000>;    /* 4MB */
+			};
+
+			/* Last MB is for the BBT, i.e. not writable */
+			partition@c00000 {
+				label = "ubifs";
+				reg = <0x0c00000 0x7400000>; /* 116MB */
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index 8b2fa9a49967..4301867bc973 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -148,27 +148,6 @@
 					default-state = "keep";
 				};
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
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
 		};
 	};
 
@@ -293,3 +272,34 @@
 		marvell,function = "gpio";
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
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
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
diff --git a/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi b/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi
index e9a5b952afc0..b13d18fad40a 100644
--- a/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi
+++ b/arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi
@@ -69,33 +69,6 @@
 					interrupts = <110>;
 				};
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "u-boot";
-					reg = <0x0 0x300000>;
-				};
-				partition@300000 {
-					label = "device-tree";
-					reg = <0x300000 0x20000>;
-				};
-				partition@320000 {
-					label = "linux";
-					reg = <0x320000 0x2000000>;
-				};
-				partition@2320000 {
-					label = "rootfs";
-					reg = <0x2320000 0xdce0000>;
-				};
-			};
 		};
 
 	};
@@ -230,3 +203,40 @@
 		marvell,function = "gpio";
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
+				label = "u-boot";
+				reg = <0x0 0x300000>;
+			};
+			partition@300000 {
+				label = "device-tree";
+				reg = <0x300000 0x20000>;
+			};
+			partition@320000 {
+				label = "linux";
+				reg = <0x320000 0x2000000>;
+			};
+			partition@2320000 {
+				label = "rootfs";
+				reg = <0x2320000 0xdce0000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 09495e87b038..b6bead81c438 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -281,11 +281,11 @@
 				status = "disabled";
 			};
 
-			nand: nand@d0000 {
-				compatible = "marvell,armada370-nand";
+			nand_controller: nand-controller@d0000 {
+				compatible = "marvell,armada370-nand-controller";
 				reg = <0xd0000 0x54>;
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 				interrupts = <113>;
 				clocks = <&coredivclk 0>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/armada-xp-db-dxbc2.dts b/arch/arm/boot/dts/armada-xp-db-dxbc2.dts
index 1b1ff17fdd9c..eb63cc8bcacc 100644
--- a/arch/arm/boot/dts/armada-xp-db-dxbc2.dts
+++ b/arch/arm/boot/dts/armada-xp-db-dxbc2.dts
@@ -107,9 +107,9 @@
 
 &nand {
 	status = "okay";
+	label = "pxa3xx_nand-0";
 	num-cs = <1>;
 	marvell,nand-keep-config;
-	marvell,nand-enable-arbiter;
 	nand-on-flash-bbt;
 	nand-ecc-strength = <4>;
 	nand-ecc-step-size = <512>;
diff --git a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
index 06fce35d7491..ee830687c2a8 100644
--- a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
+++ b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
@@ -106,9 +106,9 @@
 
 &nand {
 	status = "okay";
+	label = "pxa3xx_nand-0";
 	num-cs = <1>;
 	marvell,nand-keep-config;
-	marvell,nand-enable-arbiter;
 	nand-on-flash-bbt;
 	nand-ecc-strength = <4>;
 	nand-ecc-step-size = <512>;
diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index 065282c21789..6acf9cd65f5a 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -182,9 +182,9 @@
 
 			nand@d0000 {
 				status = "okay";
+				label = "pxa3xx_nand-0";
 				num-cs = <1>;
 				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
 
 				partitions {
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index ac9eab8ac186..9f3317cd4773 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -199,9 +199,9 @@
 
 			nand@d0000 {
 				status = "okay";
+				label = "pxa3xx_nand-0";
 				num-cs = <1>;
 				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
 			};
 		};
diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
index ce0afba1ce58..398fe027b2a7 100644
--- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
+++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
@@ -120,9 +120,9 @@
 
 			nand@d0000 {
 				status = "okay";
+				label = "pxa3xx_nand-0";
 				num-cs = <1>;
 				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
 
 				partitions {
diff --git a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
index 6d705f518254..4c09314a3260 100644
--- a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
+++ b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
@@ -196,79 +196,6 @@
 			bm@c8000 {
 				status = "okay";
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "u-boot";
-					reg = <0x0000000 0x100000>;  /* 1MB */
-					read-only;
-				};
-
-				partition@100000 {
-					label = "u_env";
-					reg = <0x100000 0x40000>;    /* 256KB */
-				};
-
-				partition@140000 {
-					label = "s_env";
-					reg = <0x140000 0x40000>;    /* 256KB */
-				};
-
-				partition@900000 {
-					label = "devinfo";
-					reg = <0x900000 0x100000>;   /* 1MB */
-					read-only;
-				};
-
-				/* kernel1 overlaps with rootfs1 by design */
-				partition@a00000 {
-					label = "kernel1";
-					reg = <0xa00000 0x2800000>;  /* 40MB */
-				};
-
-				partition@d00000 {
-					label = "rootfs1";
-					reg = <0xd00000 0x2500000>;  /* 37MB */
-				};
-
-				/* kernel2 overlaps with rootfs2 by design */
-				partition@3200000 {
-					label = "kernel2";
-					reg = <0x3200000 0x2800000>; /* 40MB */
-				};
-
-				partition@3500000 {
-					label = "rootfs2";
-					reg = <0x3500000 0x2500000>; /* 37MB */
-				};
-
-				/*
-				 * 38MB, last MB is for the BBT, not writable
-				 */
-				partition@5a00000 {
-					label = "syscfg";
-					reg = <0x5a00000 0x2600000>;
-				};
-
-				/*
-				 * Unused area between "s_env" and "devinfo".
-				 * Moved here because otherwise the renumbered
-				 * partitions would break the bootloader
-				 * supplied bootargs
-				 */
-				partition@180000 {
-					label = "unused_area";
-					reg = <0x180000 0x780000>;   /* 7.5MB */
-				};
-			};
 		};
 
 		bm-bppi {
@@ -465,3 +392,86 @@
 		};
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
+				label = "u-boot";
+				reg = <0x0000000 0x100000>;  /* 1MB */
+				read-only;
+			};
+
+			partition@100000 {
+				label = "u_env";
+				reg = <0x100000 0x40000>;    /* 256KB */
+			};
+
+			partition@140000 {
+				label = "s_env";
+				reg = <0x140000 0x40000>;    /* 256KB */
+			};
+
+			partition@900000 {
+				label = "devinfo";
+				reg = <0x900000 0x100000>;   /* 1MB */
+				read-only;
+			};
+
+			/* kernel1 overlaps with rootfs1 by design */
+			partition@a00000 {
+				label = "kernel1";
+				reg = <0xa00000 0x2800000>;  /* 40MB */
+			};
+
+			partition@d00000 {
+				label = "rootfs1";
+				reg = <0xd00000 0x2500000>;  /* 37MB */
+			};
+
+			/* kernel2 overlaps with rootfs2 by design */
+			partition@3200000 {
+				label = "kernel2";
+				reg = <0x3200000 0x2800000>; /* 40MB */
+			};
+
+			partition@3500000 {
+				label = "rootfs2";
+				reg = <0x3500000 0x2500000>; /* 37MB */
+			};
+
+			/*
+			 * 38MB, last MB is for the BBT, not writable
+			 */
+			partition@5a00000 {
+				label = "syscfg";
+				reg = <0x5a00000 0x2600000>;
+			};
+
+			/*
+			 * Unused area between "s_env" and "devinfo".
+			 * Moved here because otherwise the renumbered
+			 * partitions would break the bootloader
+			 * supplied bootargs
+			 */
+			partition@180000 {
+				label = "unused_area";
+				reg = <0x180000 0x780000>;   /* 7.5MB */
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
index 40c6fe21e720..e9e4c7a8fba9 100644
--- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
+++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
@@ -154,46 +154,6 @@
 				nr-ports = <2>;
 				status = "okay";
 			};
-
-			nand@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-
-				/* Use Hardware BCH ECC */
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "u-boot";
-					reg = <0x0000000 0x180000>;  /* 1.5MB */
-					read-only;
-				};
-
-				partition@180000 {
-					label = "u-boot-env";
-					reg = <0x180000 0x20000>;    /* 128KB */
-					read-only;
-				};
-
-				partition@200000 {
-					label = "uImage";
-					reg = <0x0200000 0x600000>;    /* 6MB */
-				};
-
-				partition@800000 {
-					label = "minirootfs";
-					reg = <0x0800000 0x400000>;    /* 4MB */
-				};
-
-				/* Last MB is for the BBT, i.e. not writable */
-				partition@c00000 {
-					label = "ubifs";
-					reg = <0x0c00000 0x7400000>; /* 116MB */
-				};
-			};
 		};
 	};
 
@@ -382,3 +342,53 @@
 		marvell,function = "gpio";
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
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+
+		/* Use Hardware BCH ECC */
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x180000>;  /* 1.5MB */
+				read-only;
+			};
+
+			partition@180000 {
+				label = "u-boot-env";
+				reg = <0x180000 0x20000>;    /* 128KB */
+				read-only;
+			};
+
+			partition@200000 {
+				label = "uImage";
+				reg = <0x0200000 0x600000>;    /* 6MB */
+			};
+
+			partition@800000 {
+				label = "minirootfs";
+				reg = <0x0800000 0x400000>;    /* 4MB */
+			};
+
+			/* Last MB is for the BBT, i.e. not writable */
+			partition@c00000 {
+				label = "ubifs";
+				reg = <0x0c00000 0x7400000>; /* 116MB */
+			};
+		};
+	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
