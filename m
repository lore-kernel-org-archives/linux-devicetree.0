From: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4] Documentation: dt: binding: fsl: add devicetree binding for describing RCPM
Date: Mon, 26 Oct 2015 14:44:12 +0800
Message-ID: <1445841852-6830-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason.jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

RCPM is the Run Control and Power Management module performs all
device-level tasks associated with device run control and power
management.

Add this for freescale powerpc platform and layerscape platform.

Signed-off-by: Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
*v4*
- Change patch subject.
- A few grammatical mistakes.
- Change "rcpm-wakeup" property to "fsl,rcpm-wakeup" property.
- Remove a few "fsl,<chip>-rcpm" examples.
- Now the value of "fsl,#rcpm-wakeup-cells" is not contain rcpm node.
- Add a NOTE to describe IPPDEXPCR register.

*v3*
- Add "fsl,#rcpm-wakeup-cells" for rcpm node. The number of cells
  correspond rcpm-wakeup property.
- Modify rcpm-wakeup property description.

*v2*
- Remove P4080 example.
- Modify rcpm-wakeup property description.

diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
new file mode 100644
index 0000000..757e0eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
@@ -0,0 +1,64 @@
+* Run Control and Power Management
+-------------------------------------------
+The RCPM performs all device-level tasks associated with device run control
+and power management.
+
+Required properites:
+  - reg : Offset and length of the register set of the RCPM block.
+  - fsl,#rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
+	fsl,rcpm-wakeup property.
+  - compatible : Must contain a chip-specific RCPM block compatible string
+	and (if applicable) may contain a chassis-version RCPM compatible
+	string. Chip-specific strings are of the form "fsl,<chip>-rcpm",
+	such as:
+	* "fsl,p2041-rcpm"
+	* "fsl,p5020-rcpm"
+	* "fsl,t4240-rcpm"
+
+	Chassis-version strings are of the form "fsl,qoriq-rcpm-<version>",
+	such as:
+	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
+	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
+	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
+
+All references to "1.0" and "2.0" refer to the QorIQ chassis version to
+which the chip complies.
+Chassis Version		Example Chips
+---------------		-------------------------------
+1.0				p4080, p5020, p5040, p2041, p3041
+2.0				t4240, b4860, b4420
+2.1				t1040, ls1021
+
+Example:
+The RCPM node for T4240:
+	rcpm: global-utilities@e2000 {
+		compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
+		reg = <0xe2000 0x1000>;
+		fsl,#rcpm-wakeup-cells = <2>;
+	};
+
+* Freescale RCPM Wakeup Source Device Tree Bindings
+-------------------------------------------
+Required fsl,rcpm-wakeup property should be added to a device node if the device
+can be used as a wakeup source.
+
+  - fsl,rcpm-wakeup: Consists of a pointer to the rcpm node and the IPPDEXPCR
+	register cells. The number of IPPDEXPCR register cells is defined in
+	"fsl,#rcpm-wakeup-cells" in the rcpm node. The first register cell is
+	the bit mask that should be set in IPPDEXPCR0, and the second register
+	cell is for IPPDEXPCR1, and so on.
+
+	Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
+	mechanism for keeping certain blocks awake during STANDBY and MEM, in
+	order to use them as wake-up sources.
+
+Example:
+	lpuart0: serial@2950000 {
+		compatible = "fsl,ls1021a-lpuart";
+		reg = <0x0 0x2950000 0x0 0x1000>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&sysclk>;
+		clock-names = "ipg";
+		fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
+		status = "disabled";
+	};
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
