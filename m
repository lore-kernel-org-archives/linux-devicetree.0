From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 1/4] dt-bindings: pci: layerscape-pci: add compatible
 strings "fsl,ls1043a-pcie"
Date: Wed, 7 Nov 2018 05:35:17 +0000
Message-ID: <20181107053500.13575-2-Zhiqiang.Hou@nxp.com>
References: <20181107053500.13575-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107053500.13575-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The PCIe compatible string for LS1043A was lost, so add it.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V3:
 - no change

 Documentation/devicetree/bindings/pci/layerscape-pci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Doc=
umentation/devicetree/bindings/pci/layerscape-pci.txt
index 66df1e81e0b8..5eb1c202932f 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -18,6 +18,7 @@ Required properties:
         "fsl,ls2088a-pcie"
         "fsl,ls1088a-pcie"
         "fsl,ls1046a-pcie"
+        "fsl,ls1043a-pcie"
         "fsl,ls1012a-pcie"
 - reg: base addresses and lengths of the PCIe controller register blocks.
 - interrupts: A list of interrupt outputs of the controller. Must contain =
an
--=20
2.17.1
