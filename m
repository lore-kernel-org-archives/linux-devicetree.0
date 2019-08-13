From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv8 2/7] PCI: mobiveil: Make mobiveil_host_init() can be used to
 re-init host
Date: Tue, 13 Aug 2019 11:04:04 +0000
Message-ID: <20190813110557.45643-3-Zhiqiang.Hou@nxp.com>
References: <20190813110557.45643-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813110557.45643-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "m.karthikeyan@mobiveil.co.in" <m.karthikeyan@mobiveil.co.in>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Make the mobiveil_host_init() function can be used to re-init
host controller's PAB and GPEX CSR register block, as NXP
integrated Mobiveil IP has to reset and then re-init the PAB
and GPEX CSR registers upon hot-reset.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V8:
 - Re-generate the patch on the new code base.

 .../controller/mobiveil/pcie-mobiveil-host.c  | 43 ++++++++++---------
 .../pci/controller/mobiveil/pcie-mobiveil.h   |  3 +-
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers=
/pci/controller/mobiveil/pcie-mobiveil-host.c
index 995487c4f760..775754522363 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -215,16 +215,21 @@ static void mobiveil_pcie_enable_msi(struct mobiveil_=
pcie *pcie)
 	writel_relaxed(1, pcie->apb_csr_base + MSI_ENABLE_OFFSET);
 }
=20
-static int mobiveil_host_init(struct mobiveil_pcie *pcie)
+int mobiveil_host_init(struct mobiveil_pcie *pcie, bool reinit)
 {
 	u32 value, pab_ctrl, type;
 	struct resource_entry *win;
=20
-	/* setup bus numbers */
-	value =3D csr_readl(pcie, PCI_PRIMARY_BUS);
-	value &=3D 0xff000000;
-	value |=3D 0x00ff0100;
-	csr_writel(pcie, value, PCI_PRIMARY_BUS);
+	pcie->ib_wins_configured =3D 0;
+	pcie->ob_wins_configured =3D 0;
+
+	if (!reinit) {
+		/* setup bus numbers */
+		value =3D csr_readl(pcie, PCI_PRIMARY_BUS);
+		value &=3D 0xff000000;
+		value |=3D 0x00ff0100;
+		csr_writel(pcie, value, PCI_PRIMARY_BUS);
+	}
=20
 	/*
 	 * program Bus Master Enable Bit in Command Register in PAB Config
@@ -270,7 +275,7 @@ static int mobiveil_host_init(struct mobiveil_pcie *pci=
e)
 	program_ib_windows(pcie, WIN_NUM_0, 0, 0, MEM_WINDOW_TYPE, IB_WIN_SIZE);
=20
 	/* Get the I/O and memory ranges from DT */
-	resource_list_for_each_entry(win, &pcie->resources) {
+	resource_list_for_each_entry(win, pcie->resources) {
 		if (resource_type(win->res) =3D=3D IORESOURCE_MEM) {
 			type =3D MEM_WINDOW_TYPE;
 		} else if (resource_type(win->res) =3D=3D IORESOURCE_IO) {
@@ -541,8 +546,6 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie=
)
 	resource_size_t iobase;
 	int ret;
=20
-	INIT_LIST_HEAD(&pcie->resources);
-
 	ret =3D mobiveil_pcie_parse_dt(pcie);
 	if (ret) {
 		dev_err(dev, "Parsing DT failed, ret: %x\n", ret);
@@ -551,34 +554,35 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pc=
ie)
=20
 	/* parse the host bridge base addresses from the device tree file */
 	ret =3D devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
-						    &pcie->resources, &iobase);
+						    &bridge->windows, &iobase);
 	if (ret) {
 		dev_err(dev, "Getting bridge resources failed\n");
 		return ret;
 	}
=20
+	pcie->resources =3D &bridge->windows;
+
 	/*
 	 * configure all inbound and outbound windows and prepare the RC for
 	 * config access
 	 */
-	ret =3D mobiveil_host_init(pcie);
+	ret =3D mobiveil_host_init(pcie, false);
 	if (ret) {
 		dev_err(dev, "Failed to initialize host\n");
-		goto error;
+		return ret;
 	}
=20
 	ret =3D mobiveil_pcie_interrupt_init(pcie);
 	if (ret) {
 		dev_err(dev, "Interrupt init failed\n");
-		goto error;
+		return ret;
 	}
=20
-	ret =3D devm_request_pci_bus_resources(dev, &pcie->resources);
+	ret =3D devm_request_pci_bus_resources(dev, pcie->resources);
 	if (ret)
-		goto error;
+		return ret;
=20
 	/* Initialize bridge */
-	list_splice_init(&pcie->resources, &bridge->windows);
 	bridge->dev.parent =3D dev;
 	bridge->sysdata =3D pcie;
 	bridge->busnr =3D pcie->rp.root_bus_nr;
@@ -589,13 +593,13 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pc=
ie)
 	ret =3D mobiveil_bringup_link(pcie);
 	if (ret) {
 		dev_info(dev, "link bring-up failed\n");
-		goto error;
+		return ret;
 	}
=20
 	/* setup the kernel resources for the newly added PCIe root bus */
 	ret =3D pci_scan_root_bus_bridge(bridge);
 	if (ret)
-		goto error;
+		return ret;
=20
 	bus =3D bridge->bus;
=20
@@ -605,7 +609,4 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie=
)
 	pci_bus_add_devices(bus);
=20
 	return 0;
-error:
-	pci_free_resource_list(&pcie->resources);
-	return ret;
 }
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.h
index 4825e30030cd..4f17a9837fe9 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -153,7 +153,7 @@ struct mobiveil_pab_ops {
=20
 struct mobiveil_pcie {
 	struct platform_device *pdev;
-	struct list_head resources;
+	struct list_head *resources;
 	void __iomem *csr_axi_slave_base;	/* PAB registers base */
 	phys_addr_t pcie_reg_base;	/* Physical PCIe Controller Base */
 	void __iomem *apb_csr_base;	/* MSI register base */
@@ -167,6 +167,7 @@ struct mobiveil_pcie {
 };
=20
 int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie);
+int mobiveil_host_init(struct mobiveil_pcie *pcie, bool reinit);
 bool mobiveil_pcie_link_up(struct mobiveil_pcie *pcie);
 int mobiveil_bringup_link(struct mobiveil_pcie *pcie);
 void program_ob_windows(struct mobiveil_pcie *pcie, int win_num, u64 cpu_a=
ddr,
--=20
2.17.1
