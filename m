From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 3/6] tegra: fdt: Add NAND controller binding and
	definitions
Date: Fri, 13 Jan 2012 15:10:53 -0800
Message-ID: <1326496256-5559-4-git-send-email-sjg@chromium.org>
References: <1326496256-5559-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326496256-5559-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add a NAND controller along with a bindings file for review.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 arch/arm/dts/tegra20.dtsi                     |    7 ++-
 doc/device-tree-bindings/nand/nvidia-nand.txt |   68 +++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletions(-)
 create mode 100644 doc/device-tree-bindings/nand/nvidia-nand.txt

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index c009f16..33d6972 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -210,5 +210,10 @@
 		reg = <0x7000f400 0x200>;
 	};
 
+	nand: nand-controller@0x70008000 {
+		#address-cells = <0>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-nand";
+		reg = <0x70008000 0x100>;
+	};
 };
-
diff --git a/doc/device-tree-bindings/nand/nvidia-nand.txt b/doc/device-tree-bindings/nand/nvidia-nand.txt
new file mode 100644
index 0000000..3674cf3
--- /dev/null
+++ b/doc/device-tree-bindings/nand/nvidia-nand.txt
@@ -0,0 +1,68 @@
+NAND Flash
+----------
+
+(there isn't yet a generic binding in Linux, so this describes what is in
+U-Boot)
+
+The device node for a NAND flash device is as described in the document
+"Open Firmware Recommended Practice : Universal Serial Bus" with the
+following modifications and additions :
+
+Required properties :
+ - compatible : Should be "manufacture,device", "nand-flash"
+ - page-data-bytes : Number of bytes in the data area
+ - page-spare-bytes : * Number of bytes in spare area
+       spare area = skipped-spare-bytes + data-ecc-bytes + tag-bytes
+			+ tag-ecc-bytes
+ - skipped-spare-bytes : Number of bytes to skip at start of spare area
+	(these are typically used for bad block maintenance)
+ - data-ecc-bytes : Number of ECC bytes for data area
+ - tag-bytes :Number of tag bytes in spare area
+ - tag-ecc-bytes : Number ECC bytes to be generated for tag bytes
+
+(replace -bytes with -size or -length?)
+
+This node should sit inside its controller.
+
+
+Nvidia NAND Controller
+----------------------
+
+The device node for a NAND flash controller is as described in the document
+"Open Firmware Recommended Practice : Universal Serial Bus" with the
+following modifications and additions :
+
+Optional properties:
+
+wp-gpio : GPIO of write-protect line, three cells in the format:
+		phandle, parameter, flags
+width : bus width of the NAND device in bits
+
+For now here is something specific to the Nvidia controller, with naming
+based on Nvidia's original (non-fdt) NAND driver:
+
+ - nvidia,nand-timing : Timing parameters for the NAND. Each is in ns.
+	Order is: MAX_TRP_TREA, TWB, Max(tCS, tCH, tALS, tALH),
+	TWHR, Max(tCS, tCH, tALS, tALH), TWH, TWP, TRH, TADL
+
+	MAX_TRP_TREA is:
+		non-EDO mode: Max(tRP, tREA) + 6ns
+		EDO mode: tRP timing
+
+Example:
+
+nand-controller@0x70008000 {
+	compatible = "nvidia,tegra20-nand";
+	wp-gpios = <&gpio 59 0>;		/* PH3 */
+	width = <8>;
+	nvidia,timing = <26 100 20 80 20 10 12 10 70>;
+	nand@0 {
+		compatible = "hynix,hy27uf4g2b", "nand-flash";
+		page-data-bytes = <2048>;
+		tag-ecc-bytes = <4>;
+		tag-bytes = <20>;
+		data-ecc-bytes = <36>;
+		skipped-spare-bytes = <4>;
+		page-spare-bytes = <64>;
+	};
+};
-- 
1.7.7.3
