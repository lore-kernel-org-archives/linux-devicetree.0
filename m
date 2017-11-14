From: Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 7/8] MIPS: BMIPS: Add PCI bindings for 7425, 7435
Date: Tue, 14 Nov 2017 17:12:11 -0500
Message-ID: <1510697532-32828-8-git-send-email-jim2101024@gmail.com>
References: <1510697532-32828-1-git-send-email-jim2101024@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510697532-32828-1-git-send-email-jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds the PCIe nodes for the Broadcom STB PCIe root complex.

Signed-off-by: Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7425.dtsi     | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi     | 27 +++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts |  4 ++++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts |  4 ++++
 4 files changed, 61 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index f56fb25..c7bd88b 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -494,4 +494,30 @@
 			status = "disabled";
 		};
 	};
+
+	pcie: pcie@10410000 {
+		reg = <0x10410000 0x830c>;
+		compatible = "brcm,bcm7425-pcie";
+		interrupts = <37>, <37>;
+		interrupt-names = "pcie", "msi";
+		interrupt-parent = <&periph_intc>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		linux,pci-domain = <0>;
+		brcm,enable-ssc;
+		bus-range = <0x00 0xff>;
+		msi-controller;
+		#interrupt-cells = <1>;
+		/* 4x128mb windows */
+		ranges = <0x2000000 0x0 0xd0000000 0xd0000000 0 0x08000000>,
+			 <0x2000000 0x0 0xd8000000 0xd8000000 0 0x08000000>,
+			 <0x2000000 0x0 0xe0000000 0xe0000000 0 0x08000000>,
+			 <0x2000000 0x0 0xe8000000 0xe8000000 0 0x08000000>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &periph_intc 33
+				 0 0 0 2 &periph_intc 34
+				 0 0 0 3 &periph_intc 35
+				 0 0 0 4 &periph_intc 36>;
+	};
+
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index f2cead2..d321042 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -509,4 +509,31 @@
 			status = "disabled";
 		};
 	};
+
+	pcie: pcie@10410000 {
+		reg = <0x10410000 0x930c>;
+		interrupts = <0x27>, <0x27>;
+		interrupt-names = "pcie", "msi";
+		interrupt-parent = <&periph_intc>;
+		compatible = "brcm,bcm7435-pcie";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		linux,pci-domain = <0>;
+		brcm,enable-ssc;
+		bus-range = <0x00 0xff>;
+		msi-controller;
+		#interrupt-cells = <1>;
+		/* 4x128mb windows */
+		ranges = <0x2000000 0x0 0xd0000000 0xd0000000 0 0x08000000>,
+			 <0x2000000 0x0 0xd8000000 0xd8000000 0 0x08000000>,
+			 <0x2000000 0x0 0xe0000000 0xe0000000 0 0x08000000>,
+			 <0x2000000 0x0 0xe8000000 0xe8000000 0 0x08000000>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &periph_intc 35
+				 0 0 0 2 &periph_intc 36
+				 0 0 0 3 &periph_intc 37
+				 0 0 0 4 &periph_intc 38>;
+		status = "disabled";
+	};
+
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index 73aa006..3a87ac5 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -143,3 +143,7 @@
 &mspi {
 	status = "okay";
 };
+
+&pcie {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
index 0a915f3..456d024 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -119,3 +119,7 @@
 &mspi {
 	status = "okay";
 };
+
+&pcie {
+	status = "okay";
+};
-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
