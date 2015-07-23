From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v5 1/8] Documentation: add DT binding for ARM System Control and Power Interface(SCPI) protocol
Date: Thu, 23 Jul 2015 12:10:21 +0100
Message-ID: <1437649828-14540-2-git-send-email-sudeep.holla@arm.com>
References: <1437649828-14540-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437649828-14540-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds devicetree binding for System Control and Power
Interface (SCPI) Message Protocol used between the Application Cores(AP)
and the System Control Processor(SCP). The MHU peripheral provides a
mechanism for inter-processor communication between SCP's M3 processor
and AP.

SCP offers control and management of the core/cluster power states,
various power domain DVFS including the core/cluster, certain system
clocks configuration, thermal sensors and many others.

Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
CC: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Jon Medhurst (Tixy) <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/arm/arm,scpi.txt | 151 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,scpi.txt

diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
new file mode 100644
index 000000000000..e21cce646561
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
@@ -0,0 +1,151 @@
+System Control and Power Interface (SCPI) Message Protocol
+----------------------------------------------------------
+
+Firmware implementing the SCPI described in ARM document number ARM DUI 0922B
+("ARM Compute Subsystem SCP: Message Interface Protocols")[0] can be used
+by Linux to initiate various system control and power operations.
+
+Required properties:
+
+- compatible : should be "arm,scpi"
+- mboxes: List of phandle and mailbox channel specifiers
+	  All the channels reserved by remote SCP firmware for use by
+	  SCPI message protocol should be specified in any order
+- shmem : List of phandle pointing to the shared memory(SHM) area between the
+	  processors using these mailboxes for IPC, one for each mailbox
+	  SHM can be any memory reserved for the purpose of this communication
+	  between the processors.
+
+See Documentation/devicetree/bindings/mailbox/mailbox.txt
+for more details about the generic mailbox controller and
+client driver bindings.
+
+Clock bindings for the clocks based on SCPI Message Protocol
+------------------------------------------------------------
+
+This binding uses the common clock binding[1].
+
+Container Node
+==============
+Required properties:
+- compatible : should be "arm,scpi-clocks"
+	       All the clocks provided by SCP firmware via SCPI message
+	       protocol much be listed as sub-nodes under this node.
+
+Sub-nodes
+=========
+Required properties:
+- compatible : shall include one of the following
+	"arm,scpi-dvfs-clocks" - all the clocks that are variable and index based.
+		These clocks don't provide an entire range of values between the
+		limits but only discrete points within the range. The firmware
+		provides the mapping for each such operating frequency and the
+		index associated with it. The firmware also manages the
+		voltage scaling appropriately with the clock scaling.
+	"arm,scpi-variable-clocks" - all the clocks that are variable and provide full
+		range within the specified range. The firmware provides the
+		range of values within a specified range.
+
+Other required properties for all clocks(all from common clock binding):
+- #clock-cells : should be set to 1 as each of the SCPI clocks have multiple
+	outputs.
+- clock-output-names : shall be the corresponding names of the outputs.
+- clock-indices: The identifying number for the clocks(i.e.clock_id) in the
+	node. It can be non linear and hence provide the mapping of identifiers
+	into the clock-output-names array.
+
+SRAM and Shared Memory for SCPI
+-------------------------------
+
+A small area of SRAM is reserved for SCPI communication between application
+processors and SCP.
+
+Required properties:
+- compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno
+
+The rest of the properties should follow the generic mmio-sram description
+found in ../../misc/sysram.txt
+
+Each sub-node represents the reserved area for SCPI.
+
+Required sub-node properties:
+- reg : The base offset and size of the reserved area with the SRAM
+- compatible : should be "arm,juno-scp-shmem" for Non-secure SRAM based
+	       shared memory on Juno platforms
+
+[0] http://community.arm.com/servlet/JiveServlet/download/8401-45-18326/DUI0922B_scp_message_interface.pdf
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Example:
+
+sram: sram@50000000 {
+	compatible = "arm,juno-sram-ns", "mmio-sram";
+	reg = <0x0 0x50000000 0x0 0x10000>;
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0 0x0 0x50000000 0x10000>;
+
+	cpu_scp_lpri: scp-shmem@0 {
+		compatible = "arm,juno-scp-shmem";
+		reg = <0x0 0x200>;
+	};
+
+	cpu_scp_hpri: scp-shmem@200 {
+		compatible = "arm,juno-scp-shmem";
+		reg = <0x200 0x200>;
+	};
+};
+
+mailbox: mailbox0@40000000 {
+	....
+	#mbox-cells = <1>;
+};
+
+scpi_protocol: scpi@2e000000 {
+	compatible = "arm,scpi";
+	mboxes = <&mailbox 0 &mailbox 1>;
+	shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
+
+	clocks {
+		compatible = "arm,scpi-clocks";
+
+		scpi_dvfs: scpi_clocks@0 {
+			compatible = "arm,scpi-dvfs-clocks";
+			#clock-cells = <1>;
+			clock-indices = <0>, <1>, <2>;
+			clock-output-names = "atlclk", "aplclk","gpuclk";
+		};
+		scpi_clk: scpi_clocks@3 {
+			compatible = "arm,scpi-variable-clocks";
+			#clock-cells = <1>;
+			clock-indices = <3>, <4>;
+			clock-output-names = "pxlclk0", "pxlclk1";
+		};
+	};
+};
+
+cpu@0 {
+	...
+	reg = <0 0>;
+	clocks = <&scpi_dvfs 0>;
+};
+
+hdlcd@7ff60000 {
+	...
+	reg = <0 0x7ff60000 0 0x1000>;
+	clocks = <&scpi_clk 4>;
+};
+
+In the above example, the #clock-cells is set to 1 as required.
+scpi_dvfs has 3 output clocks namely: vbig, vlittle and vgpu with 0, 1
+and 2 as clock-indices. scpi_clk has 2 output clocks namely: pxlclk0 and
+pxlclk1 with 3 and 4 as clock-indices.
+
+The first consumer in the example is cpu@0 and it has '0' as the clock
+specifier which points to the first entry in the output clocks of
+scpi_dvfs i.e. "atlclk".
+
+Similarly the second example is hdlcd@7ff60000 and it has pxlclk1 as input
+clock. '4' in the clock specifier here points to the second entry
+in the output clocks of scpi_clocks  i.e. "pxlclk1"
diff --git a/MAINTAINERS b/MAINTAINERS
index a2264167791a..9351b62dbbd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8955,6 +8955,12 @@ W:	http://www.sunplus.com
 S:	Supported
 F:	arch/score/
 
+SYSTEM CONTROL & POWER INTERFACE (SCPI) Message Protocol drivers
+M:	Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
+L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/arm,scpi.txt
+
 SCSI CDROM DRIVER
 M:	Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
 L:	linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
