From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH 1/4] dt-binding: gpio: Add Qualcomm SMSM device tree documentation
Date: Thu, 27 Aug 2015 10:37:55 -0700
Message-ID: <1440697078-4106-2-git-send-email-bjorn.andersson@sonymobile.com>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440697078-4106-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This documents a device tree binding for exposing the Qualcomm Shared
Memory State Machine as a set of gpio- and interrupt-controllers.

Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 .../devicetree/bindings/gpio/qcom,smsm.txt         | 114 +++++++++++++++++++++
 drivers/gpio/Kconfig                               |   8 ++
 drivers/gpio/Makefile                              |   1 +
 3 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,smsm.txt

diff --git a/Documentation/devicetree/bindings/gpio/qcom,smsm.txt b/Documentation/devicetree/bindings/gpio/qcom,smsm.txt
new file mode 100644
index 000000000000..06201ba76594
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/qcom,smsm.txt
@@ -0,0 +1,114 @@
+Qualcomm Shared Memory State Machine
+
+The Shared Memory State Machine facilitates broadcasting of single bit state
+information between the processors in a Qualcomm SoC. Each processor is
+assigned 32 bits of state that can be modified. A processor can through a
+matrix of bitmaps signal subscription of notifications upon changes to a
+certain bit owned by a certain remote processor.
+
+This document defines the binding for a driver that implements and exposes this
+a GPIO controller and a set of interrupt controllers.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,smsm"
+
+- qcom,ipc-N:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: three entries specifying the outgoing ipc bit used for
+		    signaling the N:th remote processor
+		    - phandle to a syscon node representing the apcs registers
+		    - u32 representing offset to the register within the syscon
+		    - u32 representing the ipc bit within the register
+
+- qcom,local-host:
+	Usage: optional
+	Value type: <u32>
+	Definition: identifier of the local processor in the list of hosts, or
+		    in other words specifier of the column in the subscription
+		    matrix representing the local processor
+		    defaults to host 0
+
+- #address-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 1
+
+- #size-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 0
+
+= SUBNODES
+Each processor's state bits are described by a subnode of the smsm device node.
+A node can either be a gpio-controller - denoting the local processors bits -
+or an interrupt-controller - denoting a remote processors state bits.  The node
+names are not important.
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: specifies the offset, in words, of the first bit for this
+		    entry
+
+- gpio-controller:
+	Usage: required for local entry
+	Value type: <empty>
+	Definition: marks the entry as a gpio-controller and the state bits to
+		    belong to the local processor
+
+- #gpio-cells:
+	Usage: required for local entry
+	Value type: <u32>
+	Definition: must be 2 - denotes bit number and GPIO flags
+
+- interrupt-controller:
+	Usage: required for remote entries
+	Value type: <empty>
+	Definition: marks the entry as a interrupt-controller and the state bits
+		    to belong to a remote processor
+
+- #interrupt-cells:
+	Usage: required for remote entries
+	Value type: <u32>
+	Definition: must be 2 - denotes bit number and IRQ flags
+
+- interrupts:
+	Usage: required for remote entries
+	Value type: <prop-encoded-array>
+	Definition: one entry specifying remote IRQ used by the remote processor
+		    to signal changes of its state bits
+
+
+= EXAMPLE
+The following example shows the SMEM setup for controlling properties of the
+wireless processor, defined from the 8974 apps processor's point-of-view. It
+encompasses one outbound entry and the outgoing interrupt for the wireless
+processor.
+
+smsm {
+	compatible = "qcom,smsm";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	qcom,ipc-3 = <&apcs 8 19>;
+
+	apps_smsm: apps@0 {
+		reg = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	wcnss_smsm: wcnss@7 {
+		reg = <7>;
+		interrupts = <0 144 1>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b4fc9e4d24c6..0e57b60faae8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -354,6 +354,14 @@ config GPIO_PXA
 	help
 	  Say yes here to support the PXA GPIO device
 
+config GPIO_QCOM_SMSM
+	bool "Qualcomm Shared Memory State Machine"
+	depends on QCOM_SMEM
+	help
+	  Say yes here to support the Qualcomm Shared Memory State Machine.
+	  The state machine is represented by bits in shared memory and is
+	  exposed to the system as GPIOs.
+
 config GPIO_RCAR
 	tristate "Renesas R-Car GPIO"
 	depends on ARM && (ARCH_SHMOBILE || COMPILE_TEST)
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f79a7c482a99..0fd213892403 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_GPIO_PCF857X)	+= gpio-pcf857x.o
 obj-$(CONFIG_GPIO_PCH)		+= gpio-pch.o
 obj-$(CONFIG_GPIO_PL061)	+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
+obj-$(CONFIG_GPIO_QCOM_SMSM)	+= gpio-qcom-smsm.o
 obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_RCAR)		+= gpio-rcar.o
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
