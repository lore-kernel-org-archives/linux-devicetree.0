From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv8 4/7] PCI: mobiveil: Add 8-bit and 16-bit CSR register
 accessors
Date: Tue, 13 Aug 2019 11:04:18 +0000
Message-ID: <20190813110557.45643-5-Zhiqiang.Hou@nxp.com>
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

There are some 8-bit and 16-bit registers in PCIe configuration
space, so add these accessors accordingly.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V8:
 - No change.

 .../pci/controller/mobiveil/pcie-mobiveil.h   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.h
index 4f17a9837fe9..8c07f69e0330 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -182,9 +182,29 @@ static inline u32 csr_readl(struct mobiveil_pcie *pcie=
, u32 off)
 	return csr_read(pcie, off, 0x4);
 }
=20
+static inline u32 csr_readw(struct mobiveil_pcie *pcie, u32 off)
+{
+	return csr_read(pcie, off, 0x2);
+}
+
+static inline u32 csr_readb(struct mobiveil_pcie *pcie, u32 off)
+{
+	return csr_read(pcie, off, 0x1);
+}
+
 static inline void csr_writel(struct mobiveil_pcie *pcie, u32 val, u32 off=
)
 {
 	csr_write(pcie, val, off, 0x4);
 }
=20
+static inline void csr_writew(struct mobiveil_pcie *pcie, u32 val, u32 off=
)
+{
+	csr_write(pcie, val, off, 0x2);
+}
+
+static inline void csr_writeb(struct mobiveil_pcie *pcie, u32 val, u32 off=
)
+{
+	csr_write(pcie, val, off, 0x1);
+}
+
 #endif /* _PCIE_MOBIVEIL_H */
--=20
2.17.1
