Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81A9C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83E6F20838
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRKxy5s3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731907AbgGaIVD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 04:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731510AbgGaIVC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 04:21:02 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B50C061574
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:21:02 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mt12so6702119pjb.4
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7vrHd79Z+pB65Q/lSdE36wEYsbddr7yLB5xs7W22qOY=;
        b=bRKxy5s3lMKDLKQz57qJPQY1ZTwGHFhyvb1WR4ryQzwfvprSKXH6u4pQ/R8gG3iFyb
         CaehQfSMN+ZikN0sSHGC2+SJ4FimjjiEIEexQprnEeHT/FqCaTaM1Ctb/WMGsV9cHbiv
         bD8laxxI4UcGBqYeRkOX0s8/8EJFeiE5aj4COiwxFkZ/bLwqMb8IIr19HpvZN3D2kfZS
         D4d4BLXt/Tv23VCq9kskT4aQ2GsZcglWhuPT6k+NsM4Z5mJ4QukIHrIn5YvvTLIYXaH8
         TUUwQDP1+RiE7sTXFtiawHD91Q97pc0RbQCT18fjAokCu1y2AF7zIpwqwzp6P64Gm6bT
         csFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vrHd79Z+pB65Q/lSdE36wEYsbddr7yLB5xs7W22qOY=;
        b=po/kQOZlhePbsdyjS1gja7IufmqVa07YkyvKF2hY3+J33IUyalfBPRaSN5yfy8uclQ
         khkPmPTADNVC3ICgpCDgjrwKrUrOqrHJo4acY4hKd1uXXSTlPTSwBtDxJ/st51XyvKEl
         RHMTPm4j8WXDb8WvN879Que5R5qNJf3IDDGbcGCLXPYz/OpT0Ee3eUkwj631xIEH5NlR
         M9qLKjZ8RvK9cuIdh/ZpxgI1osKsRaWHu/YyudKqQUQC+3pgpF4HBJTITBGKms4mDOcY
         Sl9+Ciab+pPtD5GCPMkF0Dr66OvxVrBUUQSgitLwr3urnBKBkIXv7mufr7U9jifFAEgr
         VvEw==
X-Gm-Message-State: AOAM533giZp8lFOd/NonDgLZFais+uoxdGQCD9NonudI/McfDbH3oBDg
        9mXHprRDBn9UtjKt5nhcwwhprmle
X-Google-Smtp-Source: ABdhPJzjpXk8dwQTiI/C3EeWHzDALfK6uKLrVhxXumTFfJ+TQNcW9N1dwa3Z4nSCD7Jr2LvuL+GmlA==
X-Received: by 2002:aa7:8a0d:: with SMTP id m13mr2612584pfa.13.1596183662062;
        Fri, 31 Jul 2020 01:21:02 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 01:21:01 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
Date:   Fri, 31 Jul 2020 08:20:43 +0000
Message-Id: <20200731082043.1682-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731082043.1682-1-linux.amoon@gmail.com>
References: <20200731082043.1682-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
----
Changes V2:
-Rebased on linux-next-2020730
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1e83ec5b8c91..63d19fbe8899 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -224,6 +224,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 
 			mdio0: mdio {
-- 
2.28.0

