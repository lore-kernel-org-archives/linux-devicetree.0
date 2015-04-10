From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 2/5] PCI: st: Add Device Tree bindings for sti pcie
Date: Fri, 10 Apr 2015 09:38:24 +0200
Message-ID: <1428651507-32554-3-git-send-email-gabriel.fernandez@linaro.org>
References: <1428651507-32554-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428651507-32554-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, " David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Viresh Kumar <viresh.kumar@li>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

sti pcie is built around a Synopsis Designware PCIe IP.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/pci/st-pcie.txt | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/st-pcie.txt b/Documentation/devicetree/bindings/pci/st-pcie.txt
new file mode 100644
index 0000000..25fcab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st-pcie.txt
@@ -0,0 +1,53 @@
+STMicroelectronics STi PCIe controller
+
+This PCIe host controller is based on the Synopsis Designware PCIe IP
+and thus inherits all the common properties defined in designware-pcie.txt.
+
+Required properties:
+ - compatible: "st,stih407-pcie"
+ - reg: base address and length of the pcie controller, mem-window address
+   and length available to the controller.
+ - interrupts: A list of interrupt outputs of the controller. Must contain an
+   entry for each entry in the interrupt-names property.
+ - interrupt-names: Should be "msi". STi interrupt that is asserted when an
+   MSI is received.
+ - st,syscfg : should be a phandle of the syscfg node. Also contains syscfg
+   offset for IP configuration.
+ - resets, reset-names: the power-down and soft-reset lines of PCIe IP.
+   Associated names must be "powerdown" and "softreset".
+ - phys, phy-names: the phandle for the PHY device.
+   Associated name must be "pcie"
+
+Optional properties:
+ - reset-gpio: a GPIO spec to define which pin is connected to the bus reset.
+
+Example:
+
+pcie0: pcie@9b00000 {
+	compatible = "st,pcie", "snps,dw-pcie";
+	device_type = "pci";
+	reg = <0x09b00000 0x4000>,	/* dbi cntrl registers */
+	      <0x2fff0000 0x00010000>,	/* configuration space */
+	      <0x40000000 0x80000000>;	/* lmi mem window */
+	reg-names = "dbi", "config", "mem-window";
+	st,syscfg = <&syscfg_core 0xd8 0xe0>;
+	#address-cells = <3>;
+	#size-cells = <2>;
+	ranges = <0x82000000 0 0x20000000 0x20000000 0 0x0FFF0000>; /* non-prefetchable memory */
+	num-lanes = <1>;
+	interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "msi";
+	#interrupt-cells = <1>;
+	interrupt-map-mask = <0 0 0 7>;
+	interrupt-map = <0 0 0 1 &intc GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>, /* INT A */
+			<0 0 0 2 &intc GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>, /* INT B */
+			<0 0 0 3 &intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>, /* INT C */
+			<0 0 0 4 &intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>; /* INT D */
+
+	resets = <&powerdown STIH407_PCIE0_POWERDOWN>,
+		 <&softreset STIH407_PCIE0_SOFTRESET>;
+	reset-names = "powerdown",
+		      "softreset";
+	phys = <&phy_port0 PHY_TYPE_PCIE>;
+	phy-names = "pcie";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
