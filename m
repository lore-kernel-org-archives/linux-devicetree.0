From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 1/6] misc: sram: fix error path in sram_probe
Date: Tue, 25 Jun 2013 10:46:38 +0200
Message-ID: <201306251046.38993.heiko@sntech.de>
References: <201306251046.04873.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251046.04873.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

The pool is created thru devm_gen_pool_create, so the call to
gen_pool_destroy is not necessary.
Instead the sram-clock must be turned off again if it exists.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/misc/sram.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index d87cc91..afe66571 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -68,7 +68,8 @@ static int sram_probe(struct platform_device *pdev)
 	ret = gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
 				res->start, size, -1);
 	if (ret < 0) {
-		gen_pool_destroy(sram->pool);
+		if (sram->clk)
+			clk_disable_unprepare(sram->clk);
 		return ret;
 	}
 
-- 
1.7.10.4
