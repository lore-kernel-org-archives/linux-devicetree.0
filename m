Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E5ACA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:08:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAEFA20684
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:08:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hazent-com.20150623.gappssmtp.com header.i=@hazent-com.20150623.gappssmtp.com header.b="q6R1IYFm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407979AbfJXLIT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 07:08:19 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42422 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407804AbfJXLIT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 07:08:19 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so15790790wrs.9
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hazent-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0g0gCs8B4ctO3mEDC1r9JFPGQsTmec9MZxSlQMJySuI=;
        b=q6R1IYFmN/ds2zlqqez18/pHwy/xbiQ8xOSdgsm+z80kzmWgpKtFvMa63dX331/ygb
         Hg6iXRsiP0Ty2sIGTSDQ1CbIh6h2bFhdpuAbkvLrZ23yzbcfdXc71YdMgoavnZ40+1n8
         DsKL78sc3enLuHRO48cRZHupSR1NBeEmbS9HDSiVfh8HASsJQ7/Ydl4hbe+3j2/jYub0
         sDfxaNyyJJiUB1CueXm7vO3Hg7psGn7HONQunBLMWs5q2jEgbmFEYddO8lp3aRsJMYy2
         I3jCaOYS8xV9v0qhnzzKrx2hWFbwDE6deAp7yUQFKAQT32TXs3cexKj4kjrHXvvV+l9m
         JkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0g0gCs8B4ctO3mEDC1r9JFPGQsTmec9MZxSlQMJySuI=;
        b=LtrY7Se8sWxO4+mbwwJsTyCwc53rGkyBdTy5koB31V2ZzUYw4C0wt5bouxhwn5fSeT
         xMDDJEVSmByCeyo2QGt6vfs4psdTFXkyE+8U8aokwShuFR1VnwTltXlyRgOl7/I2+VSl
         S6kzQeoZXvhIrFrYjtILv0IXBUjcKbSn7SUVLsGWYbtrwg3wKYOGwREirgDJFOnla+i9
         FWzo1OPygQq3ImLm4ca1B2aJHsU6IoqJ+bvVUi/ppdfQwtiXc3kuSfvBjjVoOu/mxfXa
         pg3ow6NLbrvVRmCx5a9jAHMId9eutRBUnsF670PQOVAuHGoEAkxA5c/V9CzqdQPopu0B
         Vqeg==
X-Gm-Message-State: APjAAAWFW/72eZZccsiyCCMuGHPfGJWIiliiH8xmPt8mOBZEnWUsGVzY
        UfUk5lUctJ419JjAWRC5C2OXHg==
X-Google-Smtp-Source: APXvYqy6r1/sFGykdET/5TS2/1rs/lXJ4rNqwhvc8V+6YO8twZAfZ0tTFcsqZtAqeEGHnButg6a4oQ==
X-Received: by 2002:adf:e7c9:: with SMTP id e9mr3267191wrn.261.1571915297016;
        Thu, 24 Oct 2019 04:08:17 -0700 (PDT)
Received: from salem.gmr.ssr.upm.es (salem.gmr.ssr.upm.es. [138.4.36.7])
        by smtp.gmail.com with ESMTPSA id 26sm2420473wmi.17.2019.10.24.04.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:08:16 -0700 (PDT)
From:   Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Subject: [PATCH] spi: set bits_per_word based on controller's bits_per_word_mask
Date:   Thu, 24 Oct 2019 13:07:57 +0200
Message-Id: <20191024110757.25820-4-alvaro.gamez@hazent.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024110757.25820-1-alvaro.gamez@hazent.com>
References: <20191024110757.25820-1-alvaro.gamez@hazent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

By leaving this value unset, a default value of 8 was being set later on.

If it happens that the SPI master driver doesn't support this value of 8,
there will be an initial inconsistency between the SPI master and the device
itself. This isn't a problem for most devices because kernel drivers
associated to any device set the correct value themselves, but
for device drivers that do not change this value (such as spidev that
provides a userspace accesible device, which doesn't and can't know the
value it has to use), an error is raised:

xilinx_spi 44a10000.spi: can't setup spi1.0, status -22
spi_master spi1: spi_device register error /amba_pl/spi@44a10000/spidev@0
spi_master spi1: Failed to create SPI device for /amba_pl/spi@44a10000/spidev@0

When this happens, the expected /dev/spidevX.Y device isn't created,
and thus the user can't use the SPI_IOC_WR_BITS_PER_WORD ioctl to set the
desired value.

This change sets the initial value of bits_per to the smallest word that the
controller allows, so of_spi_parse_dt sets a value that is usable by the
controller.

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---
 drivers/spi/spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index f9502dbbb5c1..794e20e54237 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1792,6 +1792,8 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 	}
 	spi->max_speed_hz = value;
 
+	spi->bits_per_word = ffs(ctlr->bits_per_word_mask);
+
 	return 0;
 }
 
-- 
2.23.0

