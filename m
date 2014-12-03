From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 06/11] memory: atmel-ebi: add DT bindings documentation
Date: Wed,  3 Dec 2014 21:44:10 +0100
Message-ID: <1417639455-17410-7-git-send-email-boris.brezillon@free-electrons.com>
References: <1417639455-17410-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417639455-17410-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The EBI (External Bus Interface) is used to access external peripherals
(NOR, SRAM, NAND, and other specific devices like ethernet controllers).
Each device is assigned a CS line and an address range and can have its
own configuration (timings, access mode, bus width, ...).
This driver provides a generic DT binding to configure a device according
to its requirements.
For specific device controllers (like the NAND one) the SMC timings
should be configured by the controller driver through the matrix and smc
syscon regmaps.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/memory-controllers/atmel-ebi.txt      | 155 +++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/atmel-ebi.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/atmel-ebi.txt b/Documentation/devicetree/bindings/memory-controllers/atmel-ebi.txt
new file mode 100644
index 0000000..3749ea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/atmel-ebi.txt
@@ -0,0 +1,155 @@
+* Device tree bindings for Atmel EBI
+
+The External Bus Interface (EBI) controller is a bus where you can connect
+asynchronous (NAND, NOR, SRAM, ....) and synchronous memories (SDR/DDR SDRAMs).
+The EBI provides a glue-less interface to asynchronous memories though the SMC
+(Static Memory Controller).
+Synchronous memories (and some asynchronous memories like NANDs) can be
+attached to specialized controllers which are responsible for configuring the
+bus appropriately according to the connected device.
+In the other hand, the bus interface can be automated for simple asynchronous
+devices.
+
+Required properties:
+
+- compatible:		"atmel,at91sam9260-ebi"
+			"atmel,at91sam9261-ebi"
+			"atmel,at91sam9263-ebi0"
+			"atmel,at91sam9263-ebi1"
+			"atmel,at91sam9g45-ebi"
+			"atmel,at91sam9x5-ebi"
+			"atmel,sama5d3-ebi"
+
+- reg:			Contains offset/length value for EBI memory mapping.
+			This property might contain several entries if the EBI
+			memory range is not contiguous
+
+- #address-cells:	Must be 2.
+			The first cell encodes the CS.
+			The second cell encode the offset into the CS memory
+			range.
+
+- #size-cells:		Must be set to 1.
+
+- ranges:		Encodes CS to memory region association.
+
+- clocks:		Clock feeding the EBI controller.
+			See clock-bindings.txt
+
+Child chip-select (cs) nodes contain the memory devices nodes connected to
+such as NOR (e.g. cfi-flash) and NAND.
+There might be board specific devices like FPGAs.
+You'll define you device requirements in these child nodes.
+
+Required child cs node properties:
+
+- #address-cells:	Must be 2.
+
+- #size-cells:		Must be 1.
+
+- ranges:		Empty property indicating that child nodes can inherit
+			memory layout.
+
+Optional child cs node properties:
+- atmel,generic-dev		boolean property specifying if the device is
+				a generic device.
+				The following properties are only parsed if
+				this property is present.
+				Specialized devices are attached to specialized
+				controllers which are responsible for
+				configuring the bus appropriately.
+				Here are some examples of specialized
+				controllers: NAND, CompactFlash, SDR-SDRAM.
+
+- atmel,bus-width:		width of the asynchronous device's data bus
+				8, 16 or 32.
+				8 if not present.
+
+- atmel,byte-access-type	"write" or "select" (see Atmel datasheet).
+				"select" if not present.
+
+- atmel,read-mode		"nrd" or "ncs".
+				"ncs" is not present.
+
+- atmel,write-mode		"nwe" or "ncs".
+				"ncs" is not present.
+
+- atmel,exnw-mode		"disabled", "frozen" or "ready".
+				"disabled" if not present.
+
+- atmel,page-mode		enable page mode if present. The provided value
+				defines the page size (supported values: 4, 8,
+				16 and 32).
+
+Optional device timings expressed in nanoseconds (if the property is not
+present 0 is assumed):
+
+- atmel,ncs-rd-setup-ns
+- atmel,nrd-setup-ns
+- atmel,ncs-wr-setup-ns
+- atmel,nwe-setup-ns
+- atmel,ncs-rd-pulse-ns
+- atmel,nrd-pulse-ns
+- atmel,ncs-wr-pulse-ns
+- atmel,nwe-pulse-ns
+- atmel,nwe-cycle-ns
+- atmel,nrd-cycle-ns
+- atmel,tdf-ns
+
+- atmel,tdf-optimized		data float optimized mode. If present the data
+				float time is optimized depending on the next
+				device being accessed (next device setup
+				time is substracted to the current devive data
+				float time).
+
+
+
+Example:
+
+	ebi: ebi@10000000 {
+		compatible = "atmel,sama5d3-ebi", "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		atmel,smc = <&hsmc>;
+		atmel,matrix = <&matrix>;
+		reg = <0x10000000 0x10000000
+		       0x40000000 0x30000000>;
+		ranges = <0x0 0x0 0x10000000 0x10000000
+			  0x1 0x0 0x40000000 0x10000000
+			  0x2 0x0 0x50000000 0x10000000
+			  0x3 0x0 0x60000000 0x10000000>;
+		clocks = <&mck>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ebi_addr>;
+
+		cs@0 {
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges;
+			atmel,generic-dev;
+			atmel,read-mode = "nrd";
+			atmel,write-mode = "nwe";
+			atmel,bus-width = <16>;
+			atmel,ncs-rd-setup-ns = <0>;
+			atmel,ncs-wr-setup-ns = <0>;
+			atmel,nwe-setup-ns = <8>;
+			atmel,nrd-setup-ns = <16>;
+			atmel,ncs-rd-pulse-ns = <84>;
+			atmel,ncs-wr-pulse-ns = <84>;
+			atmel,nrd-pulse-ns = <76>;
+			atmel,nwe-pulse-ns = <76>;
+			atmel,nrd-cycle-ns = <107>;
+			atmel,nwe-cycle-ns = <84>;
+			atmel,tdf-ns = <16>;
+
+			nor: flash@0,0 {
+				compatible = "cfi-flash";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0x0 0x0 0x1000000>;
+				bank-width = <2>;
+			};
+		};
+	};
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
