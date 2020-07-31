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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE64AC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBF2520838
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK7jE8jh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731897AbgGaIU7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 04:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731510AbgGaIU6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 04:20:58 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC079C061574
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:20:58 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w19so3735786plq.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YTWKAn3+2FJLU6pvEHBBRL1vMfMKNpM5AF+rpxplthM=;
        b=OK7jE8jhsDzB3Zk+Dhp1+73UDIg/RQ9fSdRENbMxrXIS1jPzaEVwrpnVpUvnFFNRiM
         aHTesh1aohQoNJMxesBTd4eBo0aKJQmIHCP42HCPWRX2wGmlNhqiA2zRrxJHDF0KKomJ
         zdAoK+rx/dSMfjeD9O8r7XnwLf2WUOg5q9DJPS+38rHC5ObaBm9HUL3xvY0xNhaRCAOQ
         8SZ3OkvzPQ7Dv6CJX6hnZPJwG36u4eEw7tMzOugR1Lf7+BcX3fxRJ+b71X4qQj2lV/LK
         wPadv9PN8Fmrp4wz4ewyzR+NTFKl0DfsCxJ5nEJVx+zvQbBaNcLsQHnaffVqweiqPdqU
         P6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YTWKAn3+2FJLU6pvEHBBRL1vMfMKNpM5AF+rpxplthM=;
        b=Z1bC6ljPw6PMsViOfdEMKIeG0MNb2eG9/x8qmqBQSjNATPSvHA891Lp+i30v9G89KH
         xfCvnAI7QIi3QwvEQOe4LnKXBlz0lLxCzApoVkLJVgtM6dhf1VXS3JxT4Trq3mqUBBR+
         +XSWf0IWDrpPKeFoMRJbiUfja4LjhbqgBi4Oz2j/zoYLAEXoHe2/OcPGsmaNLmUk1tBL
         ihz0yb+5SkApA7R7Fk9qEjzTo4nL/n05wAAQ2vcboYlt3tjz5wEGshgJFqTf/atAXeSi
         Zx216LGCqAL6nDWxUZmylGX0d57rZnPi7d5B/1L/EMlfqAvm0e8OvWCFDRXu/x76/Ouo
         w6PQ==
X-Gm-Message-State: AOAM531X2sm+riBNp9feaMhRr80mHQ2EuyrOQwJp0MbjTnvpQOtF47LD
        1YGxgqB86pc2cW1rXZzeNqkzyBQK
X-Google-Smtp-Source: ABdhPJznzaliEY53DnCVMcPVQnzQIh7a4ERWAc2r8pTCt1Kl7Fsz0IHLW3+EVOVE+3u+E15t5KG7Eg==
X-Received: by 2002:aa7:9357:: with SMTP id 23mr2683678pfn.278.1596183658173;
        Fri, 31 Jul 2020 01:20:58 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 01:20:57 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
Date:   Fri, 31 Jul 2020 08:20:42 +0000
Message-Id: <20200731082043.1682-3-linux.amoon@gmail.com>
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
---
Changes V2
-Rebased on linux-next-20200730
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b9efc8469265..8e134cb470d3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -187,6 +187,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
-- 
2.28.0

