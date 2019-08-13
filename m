From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv8 7/7] arm64: defconfig: Enable CONFIG_PCIE_LAYERSCAPE_GEN4
Date: Tue, 13 Aug 2019 11:04:40 +0000
Message-ID: <20190813110557.45643-8-Zhiqiang.Hou@nxp.com>
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

Enable the PCIe Gen4 controller driver for Layerscape SoCs.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
V8:
 - No change.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 97c507803210..721a144ef75b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -189,6 +189,7 @@ CONFIG_PCI_HOST_THUNDER_PEM=3Dy
 CONFIG_PCI_HOST_THUNDER_ECAM=3Dy
 CONFIG_PCIE_ROCKCHIP_HOST=3Dm
 CONFIG_PCI_LAYERSCAPE=3Dy
+CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
 CONFIG_PCI_HISI=3Dy
 CONFIG_PCIE_QCOM=3Dy
 CONFIG_PCIE_ARMADA_8K=3Dy
--=20
2.17.1
