From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] ARM: dts: bcm: Add missing device_type = "memory" property
Date: Thu,  9 May 2019 10:15:25 -0700
Message-ID: <20190509171527.2331-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, "maintainer:BROADCOM BCM5301X ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

During the removal of the skeleton.dtsi file with commit abe60a3a7afb
("ARM: dts: Kill off skeleton{64}.dtsi") a number of Broadcom SoCs were
converted, but a few were left unoticed, now causing boot failures with
v5.1 since the kernel cannot find suitable memory.

Updating the .dtsi files with the property will be done next, since
there are some memory nodes that do not follow the proper naming
convention and lack an unit name.

Fixes: abe60a3a7afb ("ARM: dts: Kill off skeleton{64}.dtsi")
Reported-by: Kevin Hilman <khilman@kernel.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Rob,

Since I have additional ARM SoC fixes to submit, I will send that as
part of my pull request to Arnd, Olof and Kevin.

Thanks!

 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts       | 1 +
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts       | 1 +
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts | 1 +
 arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts   | 1 +
 arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts   | 1 +
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts      | 1 +
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts      | 1 +
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts       | 1 +
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts    | 1 +
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts     | 1 +
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts       | 1 +
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts | 1 +
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts      | 1 +
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts       | 1 +
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts       | 1 +
 arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts | 1 +
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts         | 1 +
 arch/arm/boot/dts/bcm94708.dts                    | 1 +
 arch/arm/boot/dts/bcm94709.dts                    | 1 +
 arch/arm/boot/dts/bcm963138dvt.dts                | 1 +
 20 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
index 79d454ff3be4..1c6f561ac52b 100644
--- a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
index 99365bb8c41e..e550799a6ae0 100644
--- a/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
index bc330b1f6de0..7bfa2238f70b 100644
--- a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x18000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts
index 258d2b251900..fd361c9b1374 100644
--- a/arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts
@@ -17,6 +17,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
 
diff --git a/arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts
index babcfec50dde..7c34360d3285 100644
--- a/arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts
@@ -18,6 +18,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
 
diff --git a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
index e7fdaed99bd0..969b8d78e492 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
@@ -16,6 +16,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
 
diff --git a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
index 42bafc644013..b62854ee27ab 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
 
diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
index dce35eb79dbe..75f7b4ef35da 100644
--- a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
@@ -21,6 +21,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
index b7a024b7951b..148d16a9085e 100644
--- a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
index f7f834cd3448..eed3aab6679b 100644
--- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
index 4cb10f88a95e..8f1e565c3db4 100644
--- a/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
index 77d1687b4228..ce888b1835d1 100644
--- a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x18000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts
index 983149b55269..ed8619b54d69 100644
--- a/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/bcm4709-linksys-ea9200.dts
@@ -17,6 +17,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
index ca41481b44bd..1f87993eae1d 100644
--- a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
index aa69e656d395..6c6199a53d09 100644
--- a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
@@ -31,6 +31,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
index b527d2ff987e..f806be5da723 100644
--- a/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
@@ -16,6 +16,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
 
diff --git a/arch/arm/boot/dts/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/bcm47094-phicomm-k3.dts
index ec09c0426d16..456045f17a00 100644
--- a/arch/arm/boot/dts/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/bcm47094-phicomm-k3.dts
@@ -14,6 +14,7 @@
 	model = "Phicomm K3";
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x18000000>;
 	};
diff --git a/arch/arm/boot/dts/bcm94708.dts b/arch/arm/boot/dts/bcm94708.dts
index 934f07adfe3c..3d13e46c6949 100644
--- a/arch/arm/boot/dts/bcm94708.dts
+++ b/arch/arm/boot/dts/bcm94708.dts
@@ -39,6 +39,7 @@
 	compatible = "brcm,bcm94708", "brcm,bcm4708";
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm94709.dts b/arch/arm/boot/dts/bcm94709.dts
index 31e4dd098776..5017b7b259cb 100644
--- a/arch/arm/boot/dts/bcm94709.dts
+++ b/arch/arm/boot/dts/bcm94709.dts
@@ -39,6 +39,7 @@
 	compatible = "brcm,bcm94709", "brcm,bcm4709", "brcm,bcm4708";
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm963138dvt.dts b/arch/arm/boot/dts/bcm963138dvt.dts
index 8dca97eeaf57..29525686e51a 100644
--- a/arch/arm/boot/dts/bcm963138dvt.dts
+++ b/arch/arm/boot/dts/bcm963138dvt.dts
@@ -17,6 +17,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x0 0x08000000>;
 	};
 
-- 
2.17.1
