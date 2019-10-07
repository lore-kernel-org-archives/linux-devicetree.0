From: Hanna Hawa <hhhawa@amazon.com>
Subject: [PATCH v6 2/3] of: EXPORT_SYMBOL_GPL of_find_next_cache_node
Date: Mon, 7 Oct 2019 16:17:29 +0100
Message-ID: <20191007151730.7705-3-hhhawa@amazon.com>
References: <20191007151730.7705-1-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007151730.7705-1-hhhawa@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, mark.rutland@arm.com, james.morse@arm.com, robh+dt@kernel.org, frowand.list@gmail.com, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, daniel@iogearbox.net, paulmck@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, hhhawa@amazon.com
List-Id: devicetree@vger.kernel.org

Make of_find_next_cache_node() available for modules.

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20e0e7ee4edf..fe22c7428958 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2172,6 +2172,7 @@ struct device_node *of_find_next_cache_node(const struct device_node *np)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(of_find_next_cache_node);
 
 /**
  * of_find_last_cache_level - Find the level at which the last cache is
-- 
2.17.1
