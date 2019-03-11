From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv4 17/28] PCI: mobiveil: fix the checking of valid device
Date: Mon, 11 Mar 2019 09:32:11 +0000
Message-ID: <20190311093130.7209-18-Zhiqiang.Hou@nxp.com>
References: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Allow CFG transactions to all functions of Endpoint implemented
multiple functions.

Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host
Bridge IP driver")
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
V4:
 - Split the link up check to the 18th patch

 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers=
/pci/controller/mobiveil/pcie-mobiveil-host.c
index dc5324d94466..74a14f05115e 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -37,7 +37,7 @@ static bool mobiveil_pcie_valid_device(struct pci_bus *bu=
s, unsigned int devfn)
 	 * Do not read more than one device on the bus directly
 	 * attached to RC
 	 */
-	if ((bus->primary =3D=3D pcie->rp.root_bus_nr) && (devfn > 0))
+	if ((bus->primary =3D=3D pcie->rp.root_bus_nr) && (PCI_SLOT(devfn) > 0))
 		return false;
=20
 	return true;
--=20
2.17.1
