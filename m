Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFDAC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48E4220714
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrZ1o/a3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgG1Czg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 22:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgG1Czg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 22:55:36 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606D4C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:36 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 1so10128315pfn.9
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ILz+mJiCd+SlzoC7znunGVoL7Y/ALs76GSAJ9orIrxE=;
        b=BrZ1o/a3MvEIoLcvA0om/KVjrLph1iCAWk/lAkeY3RlL/lGO8sNRgkfQo04N0RJy/d
         QwLbBTWOExg+Sx4C8mfRCj5QHo/PHY6fk3Cy7Fm1Nnennl3cmANH/ac/aZcX0lTeCtRA
         cG3qkoId0cx7zNku3JayscuDF9APKP5Py/LWqvQqK3B2Oa/go+l0JijaF/MDzMC3SD25
         pntysKQPYtcOF6rwf0pciPqx0HhgYF2jEUEvaofVyBbImy93fd0UvlykIVXXG9XCraaW
         PCTLVwjE6SO1iCzL5aMAup1UE7iuHaXWvfZ8QG2t4X/crEVX1JuAN+OneKKQ++ReKPwM
         F3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ILz+mJiCd+SlzoC7znunGVoL7Y/ALs76GSAJ9orIrxE=;
        b=XIi+0LS7HolMhx/JflTwgwPloCpOUVSEUNERLY+NrSXoiyes01TeLuuAaUpcTAyraj
         Js38Ee6pfY5qvVCqS+J7ul7IHNz2DYS2QiTBdh0eE4oSa1GUZ3yhja5+CENnRWzqVawJ
         5PIS77DX+az7RHPM6hp97cBkWbqfUtjmW7smKZSHI4+GA6WgTkwbKSBaHf7w9y8EC+r2
         5ON5G7HLCiotxvMkSj7Mvq1N+2G6Hwa4nzUmGhb8lMtpdpMfQJEo7M3YNy5BGQcj/lmv
         CLTyXy6T88np/ppCAxfQDsit4CO22E++WCzF0PIoleiiD69Wz93kvKr6//j/N87r0sjb
         q3OQ==
X-Gm-Message-State: AOAM533PxNi1Prv+xMHCkWqrkVco1UF5JXWMu6/+NtCYcE9iJ22p1gx6
        NRYhxmrrWyPt1f5seq2UaHahq46iu9o=
X-Google-Smtp-Source: ABdhPJxt4q2FgKr3SeraQ2zE/GhcURhbqG0PpXBalOkPUb1HOKRPXsP6QVmi09FHJASGtUFFJqkmYg==
X-Received: by 2002:a62:6285:: with SMTP id w127mr22203847pfb.12.1595904935758;
        Mon, 27 Jul 2020 19:55:35 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id w9sm15147407pfq.178.2020.07.27.19.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:55:34 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     linux-fsi@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 0/5] fsi: Support extra functions on ASPEED master
Date:   Tue, 28 Jul 2020 12:25:22 +0930
Message-Id: <20200728025527.174503-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These patches are reviewed and tested. I'm after an ack on the bindings
before submitting.

Joel Stanley (5):
  dt-bindings: fsi: Document gpios
  fsi: aspeed: Support cabled FSI
  fsi: aspeed: Run the bus at maximum speed
  fsi: aspeed: Add module param for bus divisor
  fsi: aspeed: Support CFAM reset GPIO

 .../bindings/fsi/fsi-master-aspeed.txt        |  12 ++
 drivers/fsi/fsi-master-aspeed.c               | 110 +++++++++++++++++-
 2 files changed, 119 insertions(+), 3 deletions(-)

-- 
2.27.0

