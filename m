Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676A9CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 382AF20856
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hazent-com.20150623.gappssmtp.com header.i=@hazent-com.20150623.gappssmtp.com header.b="r2jLmU4b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407918AbfJXLIQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 07:08:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42417 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407804AbfJXLIQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 07:08:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so15790643wrs.9
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hazent-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kNdLDMDvs6jG6S/dKTBgsoykSCcfXzl1oiV7AyYbffQ=;
        b=r2jLmU4b9/KDjOE0xUa5KKrmE71OdJwB4T8uwA6IBwjhHduNgn7u3hEjzMjEj5IHNc
         /L8pql9f/3Zc2iBZiWRkFAnhmo4TFJFABIxS6HftxjSjEZoffcnUUgGY8Ksir3PUMFXq
         W7E5zrYbnwEeFlb60oQLi2Bx4vMLFbudkNv+yYsMIrdL8nH4TFICM6Osqj9w+S/R7yny
         TkRUzJ6fGERiFJrDuXGzOrLUlzNCKoF0GeJ1gTqvfOiVisLVyZb0+Z7vt6hUYD1AYiPj
         0lYm1iO1+X+TWBCEQ9ZptOrzgHmFGUwPfRdX7cfJLOiUgcgUybYf7AKs3qLCl4GYuFl7
         ZU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kNdLDMDvs6jG6S/dKTBgsoykSCcfXzl1oiV7AyYbffQ=;
        b=EhxzPEmn8bu/GTtvH1uM76cTfUI1MgM96HsxZGfd5WAMC7J3ruQ6jq1jBv2V5CMukU
         JrNZ2lxt4w5jNkjcYqEprvpPz2rIcnbtwsDsjamdzX0LHoTOWVDNnUvVrwgzTRqWxG5A
         1XxDRU+nrbxoG6U9ThUitCrFcn8T4g9auhx3SaLTQNtdQUEbasYeGjd6SPX09cjfniOd
         /3aCK4olPuT15QYC419LSLx0WhN7EtS0TAB817RmjYXtDhyKEUKYwizNOw9lhJ6rrGKY
         kVtySrV7JERF4LnTwqHf1C8pyfBoUH+IhNycHmBklbRKjuLQwiAlGAyoCc3OVbMEMUqI
         GCAA==
X-Gm-Message-State: APjAAAWVtq7lp/r3obctpUvYbB9urelHUwA0anET2GAP7U+fbV3yU+6G
        FzuCU7aKZ/aeTi7cYi8SxX3OgA==
X-Google-Smtp-Source: APXvYqzjBo/OCHJnpmJJiSaj4DlevP1G0F4C3ywvg8NSNVPYctcCqiKMHrYJxKi4upgIbDZEFIG3Dg==
X-Received: by 2002:adf:9044:: with SMTP id h62mr1492116wrh.91.1571915294389;
        Thu, 24 Oct 2019 04:08:14 -0700 (PDT)
Received: from salem.gmr.ssr.upm.es (salem.gmr.ssr.upm.es. [138.4.36.7])
        by smtp.gmail.com with ESMTPSA id 26sm2420473wmi.17.2019.10.24.04.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:08:13 -0700 (PDT)
From:   Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Subject: [PATCH] spi: xilinx: Add DT support for selecting transfer word width
Date:   Thu, 24 Oct 2019 13:07:56 +0200
Message-Id: <20191024110757.25820-3-alvaro.gamez@hazent.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024110757.25820-1-alvaro.gamez@hazent.com>
References: <20191024110757.25820-1-alvaro.gamez@hazent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This core supports either 8, 16 or 32 bits as word width. This value is only
settable on instantiation, and thus we need to support any of them by means
of the device tree.

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---
 drivers/spi/spi-xilinx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index 92ea22fedb33..46bb103ef30e 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -380,7 +380,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	struct xilinx_spi *xspi;
 	struct xspi_platform_data *pdata;
 	struct resource *res;
-	int ret, num_cs = 0, bits_per_word = 8;
+	int ret, num_cs = 0, bits_per_word;
 	struct spi_master *master;
 	u32 tmp;
 	u8 i;
@@ -392,6 +392,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	} else {
 		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
 					  &num_cs);
+		ret = of_property_read_u32(pdev->dev.of_node,
+					   "xlnx,num-transfer-bits",
+					   &bits_per_word);
+		if (ret)
+			bits_per_word = 8;
 	}
 
 	if (!num_cs) {
-- 
2.23.0

