From: Green Wan <green.wan@sifive.com>
Subject: [PATCH v4 4/4] MAINTAINERS: Add Green as SiFive PDMA driver maintainer
Date: Thu,  3 Oct 2019 17:09:04 +0800
Message-ID: <20191003090945.29210-5-green.wan@sifive.com>
References: <20191003090945.29210-1-green.wan@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003090945.29210-1-green.wan@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-hackers@sifive.com
Cc: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Dan Williams <dan.j.williams@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>, Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update MAINTAINERS for SiFive PDMA driver.

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30a5b4028d2f..6c12da0a324d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14779,6 +14779,12 @@ F:	drivers/media/usb/siano/
 F:	drivers/media/usb/siano/
 F:	drivers/media/mmc/siano/
 
+SIFIVE PDMA DRIVER
+M:	Green Wan <green.wan@sifive.com>
+S:	Maintained
+F:	drivers/dma/sf-pdma/
+F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+
 SIFIVE DRIVERS
 M:	Palmer Dabbelt <palmer@sifive.com>
 M:	Paul Walmsley <paul.walmsley@sifive.com>
-- 
2.17.1
