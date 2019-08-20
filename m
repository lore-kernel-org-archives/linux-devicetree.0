From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv2 1/4] dt-bindings: PCI: designware: Remove the num-lanes from
 Required properties
Date: Tue, 20 Aug 2019 07:28:43 +0000
Message-ID: <20190820073022.24217-2-Zhiqiang.Hou@nxp.com>
References: <20190820073022.24217-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820073022.24217-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "andrew.murray@arm.com" <andrew.murray@arm.com>
Cc: "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The num-lanes is not a mandatory property, e.g. on FSL
Layerscape SoCs, the PCIe link training is completed
automatically base on the selected SerDes protocol, it
doesn't need the num-lanes to set-up the link width.

It is previously in both Required and Optional properties,
let's remove it from the Required properties.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V2:
 - Reworded the change log and subject.
 - Fixed a typo in subject.

 Documentation/devicetree/bindings/pci/designware-pcie.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Do=
cumentation/devicetree/bindings/pci/designware-pcie.txt
index 5561a1c060d0..bd880df39a79 100644
--- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
@@ -11,7 +11,6 @@ Required properties:
 	     the ATU address space.
     (The old way of getting the configuration address space from "ranges"
     is deprecated and should be avoided.)
-- num-lanes: number of lanes to use
 RC mode:
 - #address-cells: set to <3>
 - #size-cells: set to <2>
--=20
2.17.1
