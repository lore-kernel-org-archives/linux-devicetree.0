From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv2 3/3] Documentation: dt: mtd: add sst25wf040b and en25s64 to the SPI NOR support list
Date: Wed, 30 Aug 2017 18:12:38 +0800
Message-ID: <20170830101238.28378-4-Zhiqiang.Hou@nxp.com>
References: <20170830101238.28378-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170830101238.28378-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org, dwmw2@infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com
Cc: Yuan Yao <yao.yuan@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

The chip sst25wf040b and en25s64 are compatible with SPI NOR flash.

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V2:
 - Corrected the subject.

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 9ce35af8507c..4cab5d85cf6f 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -13,6 +13,7 @@ Required properties:
                  at25df321a
                  at25df641
                  at26df081a
+                 en25s64
                  mr25h256
                  mr25h10
                  mr25h40
@@ -31,6 +32,7 @@ Required properties:
                  s25fl008k
                  s25fl064k
                  sst25vf040b
+                 sst25wf040b
                  m25p40
                  m25p80
                  m25p16
-- 
2.14.1
