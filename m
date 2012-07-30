From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 3/6] tegra: fdt: Add NAND controller binding and
	definitions
Date: Sun, 29 Jul 2012 23:53:27 -0700
Message-ID: <1343631210-22278-4-git-send-email-sjg@chromium.org>
References: <1343631210-22278-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1343631210-22278-1-git-send-email-sjg@chromium.org>
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
Cc: Stephen Warren <swarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Scott Wood <scottwood@freescale.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Add a NAND controller along with a bindings file for review.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v2:
- Update NAND binding to add "nvidia," prefix

Changes in v3:
- Add reg property for unit address (should be used for chip select)
- Change note in fdt binding about the need for a hardware-specific binding
- Fix up typos in fdt binding, and rename the file
- Update fdt binding to make everything Nvidia-specific

Changes in v4:
- Remove fdt bindings related to page structure

 arch/arm/dts/tegra20.dtsi                          |    7 +++
 .../nand/nvidia,tegra20-nand.txt                   |   53 ++++++++++++++++++++
 2 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index f95be58..d936b1e 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -204,4 +204,11 @@
 		compatible = "nvidia,tegra20-kbc";
 		reg = <0x7000e200 0x0078>;
 	};
+
+	nand: nand-controller@70008000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-nand";
+		reg = <0x70008000 0x100>;
+	};
 };
diff --git a/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt b/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt
new file mode 100644
index 0000000..86ae408
--- /dev/null
+++ b/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt
@@ -0,0 +1,53 @@
+NAND Flash
+----------
+
+(there isn't yet a generic binding in Linux, so this describes what is in
+U-Boot. There should not be Linux-specific or U-Boot specific binding, just
+a binding that describes this hardware. But agreeing a binding in Linux in
+the absence of a driver may be beyond my powers.)
+
+The device node for a NAND flash device is as follows:
+
+Required properties :
+ - compatible : Should be "manufacturer,device", "nand-flash"
+
+This node should sit inside its controller.
+
+
+Nvidia NAND Controller
+----------------------
+
+The device node for a NAND flash controller is as follows:
+
+Optional properties:
+
+nvidia,wp-gpios : GPIO of write-protect line, three cells in the format:
+		phandle, parameter, flags
+nvidia,nand-width : bus width of the NAND device in bits
+
+ - nvidia,nand-timing : Timing parameters for the NAND. Each is in ns.
+	Order is: MAX_TRP_TREA, TWB, Max(tCS, tCH, tALS, tALH),
+	TWHR, Max(tCS, tCH, tALS, tALH), TWH, TWP, TRH, TADL
+
+	MAX_TRP_TREA is:
+		non-EDO mode: Max(tRP, tREA) + 6ns
+		EDO mode: tRP timing
+
+The 'reg' property should provide the chip select used by the flash chip.
+
+
+Example
+-------
+
+nand-controller@0x70008000 {
+	compatible = "nvidia,tegra20-nand";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	nvidia,wp-gpios = <&gpio 59 0>;		/* PH3 */
+	nvidia,nand-width = <8>;
+	nvidia,timing = <26 100 20 80 20 10 12 10 70>;
+	nand@0 {
+		reg = <0>;
+		compatible = "hynix,hy27uf4g2b", "nand-flash";
+	};
+};
-- 
1.7.7.3
