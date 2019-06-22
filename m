Return-Path: <SRS0=a8hg=UV=huawei.com=wangkefeng.wang@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH] dt-bindings: 83xx-512x-pci: Drop cell-index property
Date: Sat, 22 Jun 2019 11:45:57 +0800
Message-ID: <20190622034557.196097-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Kumar Gala <galak@kernel.crashing.org>
List-ID: <devicetree@vger.kernel.org>

28eac2b74cc7 ("powerpc/fsl: Remove cell-index from PCI nodes"),
and for now it is still not used, drop it from doc.

Cc: Kumar Gala <galak@kernel.crashing.org>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 Documentation/devicetree/bindings/pci/83xx-512x-pci.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/83xx-512x-pci.txt b/Documentation/devicetree/bindings/pci/83xx-512x-pci.txt
index b9165b72473c..3abeecf4983f 100644
--- a/Documentation/devicetree/bindings/pci/83xx-512x-pci.txt
+++ b/Documentation/devicetree/bindings/pci/83xx-512x-pci.txt
@@ -9,7 +9,6 @@ Freescale 83xx and 512x SOCs include the same PCI bridge core.
 
 Example (MPC8313ERDB)
 	pci0: pci@e0008500 {
-		cell-index = <1>;
 		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
 		interrupt-map = <
 				/* IDSEL 0x0E -mini PCI */
-- 
2.20.1
