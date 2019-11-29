Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CCFC432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 00:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CC73215F1
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 00:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSi7tOOR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfK2AIh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 19:08:37 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:46667 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK2AIh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 19:08:37 -0500
Received: by mail-pj1-f68.google.com with SMTP id z21so905788pjq.13
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 16:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PzWN4cL1wf43O1PtpUjZOF/nWFYMcUCUfWytZsUUyVM=;
        b=dSi7tOORl2Yu58MKpmTJaZq8PC6pMrxWZlc3OrbfzabvskelxTZoHB06vlTrnU9Bfn
         vObC6N6DPm0iY1OwThGpe2g5fXDvIecJOoZaTQC8IlmTASyCiTH/O8lS1PpvWI61zTx8
         O6cEiOKKdWoUV6IAl7fmO4uFrYKs9WYuktiGMTtBQ2j9g9q4/fjcV3cA3BHgy2jnzJuh
         fk4H+hPQgfX6VWg5VCPLTZx8UJPyLdy6pOq2eaCffPuUSnDDuxGTTG4QwSyxp7ln8hnD
         zPTOiPliJH1UVmPFPsLrVz3IwL94xHiQXmuroN0SawURcRF6ImWYphHDbjo/u0QuEa7/
         ngYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=PzWN4cL1wf43O1PtpUjZOF/nWFYMcUCUfWytZsUUyVM=;
        b=RelmE+tiOOovmcIC2RJkf1BCbnMfsk0mT8TpI5p3OE41W4nSpAUArgPlp0ZZiqqTtz
         svPlxeVzzqhS/HDePxFxkfnhfQmLH/tJyiDDVc/ynokque9QSE4T4WRCVOheyzrfc5cD
         O0VWysZEZ9m1fHqtmthAEr8Yi/co0KPTLOAI5UOTI1ahFjOu1qbfvp/lqaYTjO6NQPnB
         lxwFSTnrP9noRHiDMWruoSGP9EOTutDJAoxPgtOALDojFwT7WdBL/YYz4EtbHd1bUdxW
         trIHQgS46Tc+RJedD5LvE5PSxxR78SY4lTrPuZuw36EkS5cTehY1mBHznKUTUOF5Ot88
         bAog==
X-Gm-Message-State: APjAAAW1ZQ66cqy1KCoFV9dtD3EXmxDHUh1Kl1IVGMFNywe0mnMHcqm2
        F78Z/DLGSEPY1RDlRLIpVv0=
X-Google-Smtp-Source: APXvYqypDkqlvQWSySZaKfJe9FNPi29JX9+IyoO2gKYaFImONyEaQ2/LCAsDEoHGbHnhMZNnjhuHtg==
X-Received: by 2002:a17:90a:cc18:: with SMTP id b24mr14709846pju.141.1574986116875;
        Thu, 28 Nov 2019 16:08:36 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id d188sm21302075pfa.157.2019.11.28.16.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 16:08:35 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 0/2] reset: Add ast2600 support
Date:   Fri, 29 Nov 2019 10:38:25 +1030
Message-Id: <20191129000827.650566-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds ast2600 support to the reset-simple driver, and updates
the device tree documentation for the LPC bindings.

v2 fixes a typo in the bindings that Andrew found.

Brad Bishop (1):
  reset: simple: Add AST2600 compatibility string

Joel Stanley (1):
  dt-bindings: mfd: Add ast2600 to ASPEED LPC

 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 drivers/reset/reset-simple.c                         |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.24.0

