From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/13] ARM: dts: armada-385-linksys: flatten dtsi
Date: Sun, 21 May 2017 14:48:50 +0200
Message-ID: <20170521124903.11050-2-ralph.sennhauser@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170521124903.11050-1-ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since the addition of the spi reference two styles are used. Use
references instead of recreating the same structure over and over again.

This helps to distinguish which are changes to the underlying nodes and
which are new additions and helps helps maintainability in general.

Verified the resulting dtb to be binary identical.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---

Notes:

  Care has been taken to change nothing but flatten and sorting
  references by name.

  Sorting by internal reg no longer makes sense, would be a pain to
  maintain order at least.

  Comments have at least one level of indentation, they aren't really
  meta comments anyway.

  The armada-xp-linksys-mamba.dts already makes much better use of this
  style.
---
 arch/arm/boot/dts/armada-385-linksys.dtsi | 414 +++++++++++++++---------------
 1 file changed, 206 insertions(+), 208 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index 2306c45..481e4a3 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -61,214 +61,6 @@
 			  MBUS_ID(0x09, 0x19) 0 0xf1100000 0x10000
 			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000
 			  MBUS_ID(0x0c, 0x04) 0 0xf1200000 0x100000>;
-
-		internal-regs {
-			i2c@11000 {
-				pinctrl-names = "default";
-				pinctrl-0 = <&i2c0_pins>;
-				status = "okay";
-
-				tmp421@4c {
-					compatible = "ti,tmp421";
-					reg = <0x4c>;
-				};
-
-				pca9635@68 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					compatible = "nxp,pca9635";
-					reg = <0x68>;
-				};
-			};
-
-			/* J10: VCC, NC, RX, NC, TX, GND  */
-			serial@12000 {
-				status = "okay";
-			};
-
-			ethernet@70000 {
-				status = "okay";
-				phy-mode = "rgmii-id";
-				buffer-manager = <&bm>;
-				bm,pool-long = <2>;
-				bm,pool-short = <3>;
-				fixed-link {
-					speed = <1000>;
-					full-duplex;
-				};
-			};
-
-			ethernet@34000 {
-				status = "okay";
-				phy-mode = "sgmii";
-				buffer-manager = <&bm>;
-				bm,pool-long = <0>;
-				bm,pool-short = <1>;
-				fixed-link {
-					speed = <1000>;
-					full-duplex;
-				};
-			};
-
-			mdio@72004 {
-				status = "okay";
-
-				switch@0 {
-					compatible = "marvell,mv88e6085";
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0>;
-
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port@0 {
-							reg = <0>;
-							label = "lan4";
-						};
-
-						port@1 {
-							reg = <1>;
-							label = "lan3";
-						};
-
-						port@2 {
-							reg = <2>;
-							label = "lan2";
-						};
-
-						port@3 {
-							reg = <3>;
-							label = "lan1";
-						};
-
-						port@4 {
-							reg = <4>;
-							label = "wan";
-						};
-
-						port@5 {
-							reg = <5>;
-							label = "cpu";
-							ethernet = <&eth2>;
-
-							fixed-link {
-								speed = <1000>;
-								full-duplex;
-							};
-						};
-					};
-				};
-			};
-
-			sata@a8000 {
-				status = "okay";
-			};
-
-			bm@c8000 {
-				status = "okay";
-			};
-
-			/* USB part of the eSATA/USB 2.0 port */
-			usb@58000 {
-				status = "okay";
-			};
-
-			usb3@f8000 {
-				status = "okay";
-				usb-phy = <&usb3_phy>;
-			};
-
-			flash@d0000 {
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-
-				partition@0 {
-					label = "u-boot";
-					reg = <0x0000000 0x200000>;  /* 2MB */
-					read-only;
-				};
-
-				partition@100000 {
-					label = "u_env";
-					reg = <0x200000 0x40000>;    /* 256KB */
-				};
-
-				partition@140000 {
-					label = "s_env";
-					reg = <0x240000 0x40000>;    /* 256KB */
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
-				partition@1000000 {
-					label = "rootfs1";
-					reg = <0x1000000 0x2200000>;  /* 34MB */
-				};
-
-				/* kernel2 overlaps with rootfs2 by design */
-				partition@3200000 {
-					label = "kernel2";
-					reg = <0x3200000 0x2800000>; /* 40MB */
-				};
-
-				partition@3800000 {
-					label = "rootfs2";
-					reg = <0x3800000 0x2200000>; /* 34MB */
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
-					reg = <0x280000 0x680000>;   /* 6.5MB */
-				};
-			};
-		};
-
-		bm-bppi {
-			status = "okay";
-		};
-
-		pcie-controller {
-			status = "okay";
-
-			pcie@1,0 {
-				/* Marvell 88W8864, 5GHz-only */
-				status = "okay";
-			};
-
-			pcie@2,0 {
-				/* Marvell 88W8864, 2GHz-only */
-				status = "okay";
-			};
-		};
 	};
 
 	usb3_phy: usb3_phy {
@@ -372,6 +164,197 @@
 	};
 };
 
+&ahci0 {
+	status = "okay";
+};
+
+&bm {
+	status = "okay";
+};
+
+&bm_bppi {
+	status = "okay";
+};
+
+&eth0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	buffer-manager = <&bm>;
+	bm,pool-long = <2>;
+	bm,pool-short = <3>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&eth2 {
+	status = "okay";
+	phy-mode = "sgmii";
+	buffer-manager = <&bm>;
+	bm,pool-long = <0>;
+	bm,pool-short = <1>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	tmp421@4c {
+		compatible = "ti,tmp421";
+		reg = <0x4c>;
+	};
+
+	pca9635@68 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nxp,pca9635";
+		reg = <0x68>;
+	};
+};
+
+&nand {
+	status = "okay";
+	num-cs = <1>;
+	marvell,nand-keep-config;
+	marvell,nand-enable-arbiter;
+	nand-on-flash-bbt;
+
+	partition@0 {
+		label = "u-boot";
+		reg = <0x0000000 0x200000>;  /* 2MB */
+		read-only;
+	};
+
+	partition@100000 {
+		label = "u_env";
+		reg = <0x200000 0x40000>;    /* 256KB */
+	};
+
+	partition@140000 {
+		label = "s_env";
+		reg = <0x240000 0x40000>;    /* 256KB */
+	};
+
+	partition@900000 {
+		label = "devinfo";
+		reg = <0x900000 0x100000>;   /* 1MB */
+		read-only;
+	};
+
+	/* kernel1 overlaps with rootfs1 by design */
+	partition@a00000 {
+		label = "kernel1";
+		reg = <0xa00000 0x2800000>;  /* 40MB */
+	};
+
+	partition@1000000 {
+		label = "rootfs1";
+		reg = <0x1000000 0x2200000>;  /* 34MB */
+	};
+
+	/* kernel2 overlaps with rootfs2 by design */
+	partition@3200000 {
+		label = "kernel2";
+		reg = <0x3200000 0x2800000>; /* 40MB */
+	};
+
+	partition@3800000 {
+		label = "rootfs2";
+		reg = <0x3800000 0x2200000>; /* 34MB */
+	};
+
+	/*
+	 * 38MB, last MB is for the BBT, not writable
+	 */
+	partition@5a00000 {
+		label = "syscfg";
+		reg = <0x5a00000 0x2600000>;
+	};
+
+	/*
+	 * Unused area between "s_env" and "devinfo".
+	 * Moved here because otherwise the renumbered
+	 * partitions would break the bootloader
+	 * supplied bootargs
+	 */
+	partition@180000 {
+		label = "unused_area";
+		reg = <0x280000 0x680000>;   /* 6.5MB */
+	};
+};
+
+&mdio {
+	status = "okay";
+
+	switch@0 {
+		compatible = "marvell,mv88e6085";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				label = "lan4";
+			};
+
+			port@1 {
+				reg = <1>;
+				label = "lan3";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "lan2";
+			};
+
+			port@3 {
+				reg = <3>;
+				label = "lan1";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "wan";
+			};
+
+			port@5 {
+				reg = <5>;
+				label = "cpu";
+				ethernet = <&eth2>;
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
+};
+
+&pciec {
+	status = "okay";
+};
+
+&pcie1 {
+	/* Marvell 88W8864, 5GHz-only */
+	status = "okay";
+};
+
+&pcie2 {
+	/* Marvell 88W8864, 2GHz-only */
+	status = "okay";
+};
+
 &pinctrl {
 	keys_pin: keys-pin {
 		marvell,pins = "mpp24", "mpp29";
@@ -397,3 +380,18 @@
 &spi0 {
 	status = "disabled";
 };
+
+&uart0 {
+	/* J10: VCC, NC, RX, NC, TX, GND  */
+	status = "okay";
+};
+
+&usb0 {
+	/* USB part of the eSATA/USB 2.0 port */
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+	usb-phy = <&usb3_phy>;
+};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
