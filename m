Return-Path: <SRS0=9JgI=YN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ED2CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 23:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D06B721929
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 23:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HpSfZmtT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfJTXAv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 20 Oct 2019 19:00:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44117 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfJTXAv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 20 Oct 2019 19:00:51 -0400
Received: by mail-lf1-f66.google.com with SMTP id q12so8492276lfc.11
        for <devicetree@vger.kernel.org>; Sun, 20 Oct 2019 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYr9aCDj4PnFzDPIIIY7KJpxkUoLJ3Nn3QAOb6G38+I=;
        b=HpSfZmtTANCZMC/v1YzmmGiA43QviDigJusdPALJuCYSz00i9zTFOWSoPg/jBN5nHL
         Ipr5P771YvUTRXy1TJtWDzU7/erC4mDnz8W8YnSJQP5EhDVOJgQExQ6L2pH1imzU8T0t
         7tan04vCe14WIxFfOfYgjZ7LZaHhEQACvV31sDqS2T/NBWyENeq8VImOZW2C2J0YxiN1
         MDHgvy4hn8OmGUWnCqgvUDLMAJ1PmPI0W8pBqJD6ZGCHKUD7MkThqfIoGFs5ocZ+B1vr
         +NtzjtJTlzxIVkiAwGptXM5NfY+A6xZgUCP2yeGMzuk/EWzXLbrEoofUpSLW95q1vJyj
         Yc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYr9aCDj4PnFzDPIIIY7KJpxkUoLJ3Nn3QAOb6G38+I=;
        b=Czb7GnI6WYPfGJEnef2zIJHo74zHvn3MPnSfIJRX3WtLh3JgptrNfHpnTcPnSdAT/v
         fFVygaScQjwxE/leU1UvVx1694rOnN8kS7WnOpkbAXe+cCJTSCRacwzsjJcsDOpqAU+w
         YuuK+mKQIPtupxoQ9zBlAeZy00+cVN9mHUa/rsjOvXV/QPLmW2twiZZvNKYYY3Ebzf7K
         RTN5uAsUymnD70V7xb9CgklXo0x5IgYitycChH5k2BpJR9h6knAHrMcrhlQ9WAozjkYA
         91QUyyDiRJUyxR++29j5nDpDhckd0Jm0rFeObg9EZ3XAWyTUD82/BALE08qaZIyGFdoY
         35Bw==
X-Gm-Message-State: APjAAAV307blj+TZUKl9lvdOpKuxjtvrPLbKv/vn9o1A0Ur9qhaknmOU
        3OHrNfkLnM4xaCUPvXsyC9ls5A==
X-Google-Smtp-Source: APXvYqzBwh2aw+V1KrR2jzfKHGhhMkxOeOADzXN51+d7Nj8sASEsVsiB9ZrnumS5H9z6k5nG43JiEQ==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr2780699lfa.182.1571612449275;
        Sun, 20 Oct 2019 16:00:49 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id 77sm6011174ljf.85.2019.10.20.16.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 16:00:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-mtd@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2 v4] mtd: add DT bindings for the Intel IXP4xx Flash
Date:   Mon, 21 Oct 2019 01:00:41 +0200
Message-Id: <20191020230042.7364-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds device tree bindings for the Intel IXP4xx
flash controller, a simple physmap which however need a
specific big-endian or mixed-endian access pattern to the
memory.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rebase on v5.4-rc1
- Resend
ChangeLog v2->v3:
- Rebase on v5.1-rc1
- Resend
ChangeLog v1->v2:
- Collect Rob's Review tag.
---
 .../bindings/mtd/intel,ixp4xx-flash.txt       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt b/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
new file mode 100644
index 000000000000..4bdcb92ae381
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
@@ -0,0 +1,22 @@
+Flash device on Intel IXP4xx SoC
+
+This flash is regular CFI compatible (Intel or AMD extended) flash chips with
+specific big-endian or mixed-endian memory access pattern.
+
+Required properties:
+- compatible : must be "intel,ixp4xx-flash", "cfi-flash";
+- reg : memory address for the flash chip
+- bank-width : width in bytes of flash interface, should be <2>
+
+For the rest of the properties, see mtd-physmap.txt.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+flash@50000000 {
+	compatible = "intel,ixp4xx-flash", "cfi-flash";
+	reg = <0x50000000 0x01000000>;
+	bank-width = <2>;
+};
-- 
2.21.0

