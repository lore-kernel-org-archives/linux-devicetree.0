From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv4 06/28] PCI: mobiveil: replace the resource list iteration
 function
Date: Mon, 11 Mar 2019 09:30:44 +0000
Message-ID: <20190311093130.7209-7-Zhiqiang.Hou@nxp.com>
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

As it won't delete any node in this iteration, replaced
the function resource_list_for_each_entry_safe() with
the resource_list_for_each_entry().

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V4:
 - no change

 drivers/pci/controller/pcie-mobiveil.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controlle=
r/pcie-mobiveil.c
index 8ff873023b5f..b2cc9c097fc9 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -569,7 +569,7 @@ static int mobiveil_host_init(struct mobiveil_pcie *pci=
e)
 {
 	u32 value, pab_ctrl, type;
 	int err;
-	struct resource_entry *win, *tmp;
+	struct resource_entry *win;
=20
 	err =3D mobiveil_bringup_link(pcie);
 	if (err) {
@@ -620,7 +620,7 @@ static int mobiveil_host_init(struct mobiveil_pcie *pci=
e)
 	program_ib_windows(pcie, WIN_NUM_1, 0, MEM_WINDOW_TYPE, IB_WIN_SIZE);
=20
 	/* Get the I/O and memory ranges from DT */
-	resource_list_for_each_entry_safe(win, tmp, &pcie->resources) {
+	resource_list_for_each_entry(win, &pcie->resources) {
 		if (resource_type(win->res) =3D=3D IORESOURCE_MEM)
 			type =3D MEM_WINDOW_TYPE;
 		else if (resource_type(win->res) =3D=3D IORESOURCE_IO)
--=20
2.17.1
