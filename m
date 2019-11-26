Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FFAC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 02:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22BEB20684
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 02:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSE0u60g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfKZCXB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 21:23:01 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37976 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfKZCXB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 21:23:01 -0500
Received: by mail-pg1-f196.google.com with SMTP id t3so7731059pgl.5
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 18:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=unlpuGn7nivFmtiJp3WUnntkjXJ1id5sopgjYo1qU0U=;
        b=VSE0u60gyPELRZ7JTOR5++7SEE4+hwPzwj8nOy6OaBgAzsOLBGclKbilyUk3B5pC9k
         IEzwPawCG7UUP568XdzUhj8ybOQV9v3iej2HLaCJfDF8JNx3N8bcejQEZdS9q2c2gBNn
         uUrpNZMrooqkIfjyHZwgSMnv4hiAjjs7xgZCy5SuNAz7IxdflkCfEu2JzFJe1FI6TFfs
         ZDnAnaWQMH8DyWf+HaHhWJsgThUXbfpMy1lqCFJWaxK0hRWLzA45PK84/A702SAQUPlT
         rJy8+lZu7joBEVB9ksp6OQLpSTedhctHgTDMGFw4EK0j0PcF9MChPO9EQTX9cUNRvRDf
         Z96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=unlpuGn7nivFmtiJp3WUnntkjXJ1id5sopgjYo1qU0U=;
        b=kL2znHHZTJAUBYA7gQMWrShxYHDCVDdY/n27gx013KXOV3mFp90YaPvlUxhfPH5cwK
         LIxJcXEa83yvPR2uM0iyWBi2q1bKbKNf0RGe4rqMHRnOnHYzjFWQwb9o2Uu5rebkTpVU
         57ifMl89Gf8ZsBQJwMf1DKq0nG6vS+e67aYD9Vi5Ug+4YxFhKiTfxs2JSyQuFSDaN8oO
         ympk63HArnOfyUPaEbLakUH3bg+aMUH0ni5r57Vjh6+bMrhFRn5qHxhsNjzCKx3GYCK1
         aQZfJfRcGzGQSCSIi7IDF60btV2AfhmaTcuTF1Sou6uI3Qqi/TS6AYlYF8XGcGySILeJ
         HPug==
X-Gm-Message-State: APjAAAW84bAW7H2lfWm9lDiMHbK1J4rgevrDLtp1SsNoMKx8Vj1Eja6J
        kdAIbKxQcKPL59xIS0PCRb0=
X-Google-Smtp-Source: APXvYqxhb551eaPvYW3aHcS2Y2jrA1e7OdTeqm5liDBTjQRChx9CJ8uw7qBXhW4MO/M8m/PZNLTKqA==
X-Received: by 2002:aa7:9abb:: with SMTP id x27mr37012105pfi.150.1574734980360;
        Mon, 25 Nov 2019 18:23:00 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id q70sm666568pjq.26.2019.11.25.18.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 18:22:59 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/2] reset: Add ast2600 support
Date:   Tue, 26 Nov 2019 12:52:41 +1030
Message-Id: <20191126022243.215261-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds ast2600 support to the reset-simple driver, and updates
the device tree documentation for the LPC bindings.

Brad Bishop (1):
  reset: simple: Add AST2600 compatibility string

Joel Stanley (1):
  dt-bindings: mfd: Add ast2600 to ASPEED LPC

 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 drivers/reset/reset-simple.c                         |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.24.0

