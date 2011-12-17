From: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>
Subject: [RFC PATCH 1/3] dt: device tree bindings for DDR memories
Date: Sat, 17 Dec 2011 18:50:50 +0530
Message-ID: <1324128052-11220-2-git-send-email-aneesh@ti.com>
References: <1324128052-11220-1-git-send-email-aneesh@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324128052-11220-1-git-send-email-aneesh-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-patch-review-uAqBSO/uNfhBDgjK7y7TUQ@public.gmane.org
Cc: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

device tree bindings for DDR SDRAM memories compliant
to JEDEC standards. Currently only DDR3 and LPDDR2 have
been considered for this binding. Properties for other
memory types(DDR2 etc) could be added to this binding
on a need-basis.

The 'ddr' binding in-turn uses another binding 'ddr-timings'
for specifying the AC timing parameters of the memory device
at different speed-bins.

Cc: Rajendra Nayak <rnayak-l0cyMroinI0@public.gmane.org>
Cc: Benoit Cousson <b-cousson-l0cyMroinI0@public.gmane.org>
Signed-off-by: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/ddr/ddr.txt      |  113 ++++++++++++++++++++
 .../devicetree/bindings/ddr/ddr_timings.txt        |   60 +++++++++++
 2 files changed, 173 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ddr/ddr.txt
 create mode 100644 Documentation/devicetree/bindings/ddr/ddr_timings.txt

diff --git a/Documentation/devicetree/bindings/ddr/ddr.txt b/Documentation/devicetree/bindings/ddr/ddr.txt
new file mode 100644
index 0000000..2f8e4e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/ddr/ddr.txt
@@ -0,0 +1,113 @@
+* DDR SDRAM memories compliant to JEDEC specifications JESD209-2(LPDDR2)
+  or JESD79-3(DDR3).
+
+Required properties:
+- compatible : Should be one of - "jedec,ddr3", "jedec,lpddr2-nvm",
+  "jedec,lpddr2-s2", or "jedec,lpddr2-s4"
+
+  "ti,emif-ddr3" should be listed if the memory part is DDR3 type
+
+  "ti,emif-lpddr2-s2" should be listed if the memory part is LPDDR2-S2 type
+
+  "ti,emif-lpddr2-s4" should be listed if the memory part is LPDDR2-S4 type
+
+  "ti,emif-lpddr2-nvm" should be listed if the memory part is LPDDR2-NVM type
+
+- density  : string representing the density of the device in terms of
+  Mb (mega bits). Following are the allowed values: "64Mb", "128Mb",
+  "256Mb", "512Mb", "1Gb", "2Gb", "4Gb", "8Gb", "16Gb", or "32Gb"
+
+- io-width : string representing the io width: "x8", "x16" or "x32".
+
+- manufacturer : string with manufacturer name
+
+Optional properties:
+
+The following optional properties represent the minimum value of some AC
+timing parameters of the DDR device in terms of number of clock cycles.
+These values shall be obtained from the device data-sheet.
+
+- tRRD-min-tck
+- tWTR-min-tck
+- tXP-min-tck
+- tRTP-min-tck
+- tCKE-min-tck
+- tRPab-min-tck		/* LPDDR2 only */
+- tRCD-min-tck		/* LPDDR2 only */
+- tWR-min-tck		/* LPDDR2 only */
+- tRASmin-min-tck	/* LPDDR2 only */
+- tCKESR-min-tck	/* LPDDR2 only */
+- tFAW-min-tck		/* LPDDR2 only */
+- tZQCS-min-tck		/* DDR3 only */
+- tZQoper-min-tck	/* DDR3 only */
+- tZQinit-min-tck	/* DDR3 only */
+- tXS-min-tck		/* DDR3 only */
+
+Child nodes:
+- The ddr node may have one or more child nodes of type "ddr-timings".
+  "ddr-timings" provides AC timing parameters of the device for
+  a given speed-bin. The user may provide the timings for as many
+  speed-bins as is required. Please see Documentation/devicetree/
+  bindings/ddr/ddr-timings.txt for more information on "ddr-timings"
+
+Example:
+
+elpida_2GS4 : ddr {
+	compatible 	= "jedec,lpddr2-s4";
+	density		= "2Gb";
+	io-width	= "x32";
+	manufacturer	= "Elpida";
+
+	tRPab-min-tck	= <3>;
+	tRCD-min-tck	= <3>;
+	tWR-min-tck	= <3>;
+	tRASmin-min-tck	= <3>;
+	tRRD-min-tck	= <2>;
+	tWTR-min-tck	= <2>;
+	tXP-min-tck	= <2>;
+	tRTP-min-tck	= <2>;
+	tCKE-min-tck	= <3>;
+	tCKESR-min-tck	= <3>;
+	tFAW-min-tck	= <8>;
+
+	timings_elpida_2GS4_400mhz: ddr-timings {
+		min-freq	= <10000000>;
+		max-freq	= <400000000>;
+		tRP-ps		= <21000>;
+		tRCD-ps		= <18000>;
+		tWR-ps		= <15000>;
+		tRAS-min-ps	= <42000:;
+		tRRD-ps		= <10000>;
+		tWTR-ps		= <7500>;
+		tXP-ps		= <7500>;
+		tRTP-ps		= <7500>;
+		tCKESR-ps	= <15000>;
+		tDQSCK-max-ps 	= <5500>;
+		tFAW-ps		= <50000>;
+		tZQCS-ps	= <90000>;
+		tZQoper-ps	= <360000>;
+		tZQinit-ps	= <1000000>;
+		tRAS-max-ns	= <70000>;
+	};
+
+	timings_elpida_2GS4_200mhz: ddr-timings {
+		min-freq	= <10000000>;
+		max-freq	= <200000000>;
+		tRP-ps		= <21000>;
+		tRCD-ps		= <18000>;
+		tWR-ps		= <15000>;
+		tRAS-min-ps	= <42000:;
+		tRRD-ps		= <10000>;
+		tWTR-ps		= <10000>;
+		tXP-ps		= <7500>;
+		tRTP-ps		= <7500>;
+		tCKESR-ps	= <15000>;
+		tDQSCK-max-ps 	= <5500>;
+		tFAW-ps		= <50000>;
+		tZQCS-ps	= <90000>;
+		tZQoper-ps	= <360000>;
+		tZQinit-ps	= <1000000>;
+		tRAS-max-ns	= <70000>;
+	};
+
+}
diff --git a/Documentation/devicetree/bindings/ddr/ddr_timings.txt b/Documentation/devicetree/bindings/ddr/ddr_timings.txt
new file mode 100644
index 0000000..f3cd5e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/ddr/ddr_timings.txt
@@ -0,0 +1,60 @@
+* AC timing parameters of DDR memories for a given speed-bin
+  At the moment properties for only LPDDR2 and DDR3 have been added
+
+Required properties:
+- min-freq : minimum DDR clock frequency for the speed-bin
+- max-freq : maximum DDR clock frequency for the speed-bin
+
+Optional properties:
+
+The following properties represent AC timing parameters from the memory
+data-sheet of the device for a given speed-bin. All these properties are
+of type <u32> and "-ps", "-ns", "-nCK" etc in the name indicates the
+unit of the corresponding parameter:
+  ps - pico seconds
+  ns - nano seconds
+  nCK - number of DDR clock cycles
+
+- tRCD-ps
+- tWR-ps
+- tRAS-min-ps
+- tRRD-ps
+- tWTR-ps
+- tXP-ps
+- tRTP-ps
+- tDQSCK-max-ps
+- tFAW-ps
+- tZQCS-ps
+- tZQinit-ps
+- tRP-ps	/* DDR3 only */
+- tRC-ps	/* DDR3 only */
+- tXSDLL-nCK	/* DDR3 only */
+- tCKE-ps	/* DDR3 only */
+- tZQoper-ps	/* DDR3 only */
+- tRPab-ps	/* LPDDR2 only */
+- tZQCL-ps	/* LPDDR2 only */
+- tCKESR-ps	/* LPDDR2 only */
+- tRAS-max-ns	/* LPDDR2 only */
+
+Example:
+
+timings_elpida_2GS4_400mhz: ddr-timings {
+	min-freq	= <10000000>;
+	max-freq	= <400000000>;
+	tRPab-ps	= <21000>;
+	tRCD-ps		= <18000>;
+	tWR-ps		= <15000>;
+	tRAS-min-ps	= <42000:;
+	tRRD-ps		= <10000>;
+	tWTR-ps		= <7500>;
+	tXP-ps		= <7500>;
+	tRTP-ps		= <7500>;
+	tCKESR-ps	= <15000>;
+	tDQSCK-max-ps 	= <5500>;
+	tFAW-ps		= <50000>;
+	tZQCS-ps	= <90000>;
+	tZQCL-ps	= <360000>;
+	tZQinit-ps	= <1000000>;
+	tRAS-max-ns	= <70000>;
+};
+
-- 
1.7.1
