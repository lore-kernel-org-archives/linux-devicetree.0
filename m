From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCH 2/4] PCI: dwc: Return directly when num-lanes is not found
Date: Mon, 12 Aug 2019 04:22:22 +0000
Message-ID: <20190812042435.25102-3-Zhiqiang.Hou@nxp.com>
References: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>
Cc: "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The num-lanes is optional, so probably it isn't added
on some platforms. The subsequent programming is base
on the num-lanes, hence return when it is not found.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/con=
troller/dwc/pcie-designware.c
index 7d25102c304c..0a89bfd1636e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -423,8 +423,10 @@ void dw_pcie_setup(struct dw_pcie *pci)
=20
=20
 	ret =3D of_property_read_u32(np, "num-lanes", &lanes);
-	if (ret)
-		lanes =3D 0;
+	if (ret) {
+		dev_dbg(pci->dev, "property num-lanes isn't found\n");
+		return;
+	}
=20
 	/* Set the number of lanes */
 	val =3D dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
--=20
2.17.1
