Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6366BC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 02:47:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E829206D5
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 02:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3+US2mz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDVCrz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 22:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725912AbgDVCrz (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 22:47:55 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD517C0610D6
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 19:47:54 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id ay1so346801plb.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 19:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=D3+US2mzOTCBLb41iSJmZWRpt3koyaYcyF6TG3cXoU06Vh7mub4ObwdASKKIzz//Kj
         nAC4jW7wXEu3qbwS8PV9zJ/yWeUENwtTlEG6zhZeXNbgqK2MMeOoWRlzrGrcc0lBC17y
         JeY6HtAv8yO8Qm3Ao6nL/GNTqBvQ/Jyr+5xRNyYtJH59FTz22uqEvgUAHzN/5+iKM4X+
         5vGMZX/CcKSeE0Scax6Ax2eKN0I+DzolpdSFAoyRFpLVqe3pqgoN6AnFaD3A5+nWDFbJ
         qElREYfHNJ+i06HLqbtSWd9HEOFUZBvDGujJO2/gDjL0v5ZD2g0RV+X9C+t26X62llDS
         oJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=pqB1QTXTm4vLOKBJzisfRXYSYLShHCtw7lcaILlLTG18M1evQS+S/E6cnexYxNfnFC
         vZzrI2NB4zQrd4WCRLUCk7gfpxHwmwBFImzBSIkeIx9+1YxyxKV3eN3/VM8MUQlmSBmn
         LhA3RNevBpVvG0OBC8ySlWD5VHr0PPN0Jg933cRinyvyV40B65Zl6qvpDVpc4Ra5P2QS
         YgH5SzRiwOZILytlfMqj3i9QJ/UdoxQfd2jTqeXJuSCuP2t+xHOYjomPS73j3L56RsxT
         te5pB2kzymAjs93YGk1MZvPZ3kYQJFGUaQk3bWYGU+3CsmjscgIRLxe3Wlc+jhK4Q1Nz
         V7Cw==
X-Gm-Message-State: AGi0PuYQ8cAD6yNYYi/Yc3r6PKXu4uEuFH//hX7CSDFa5BivEWJfopCS
        2Ex4FneeG+uq4GX6kUaIYbrjuQ==
X-Google-Smtp-Source: APiQypICa6d157/uBpIY5hT3LWfrP2zQooLOfujR8IWHwtnRWQObzmUQkyHNw15Na9A22GX9yURBXg==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr24464721plp.44.1587523673472;
        Tue, 21 Apr 2020 19:47:53 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id i9sm3826793pfd.148.2020.04.21.19.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 19:47:53 -0700 (PDT)
Date:   Wed, 22 Apr 2020 11:47:50 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: Add Akebi96 board support
Message-Id: <20200422114750.57fafa027c7fa99f85aa1d7c@linaro.org>
In-Reply-To: <20200422114429.0b1a6f1a3366bae5964f3e10@linaro.org>
References: <20200422114429.0b1a6f1a3366bae5964f3e10@linaro.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add uniphier-ld20-akebi96 compatible string for
Akebi96 board support.

Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
---
 .../bindings/arm/socionext/uniphier.yaml           |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index 65ad6d8a3c99..10a7f0752281 100644
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@ -51,6 +51,7 @@ properties:
       - description: LD20 SoC boards
         items:
           - enum:
+            - socionext,uniphier-ld20-akebi96
             - socionext,uniphier-ld20-global
             - socionext,uniphier-ld20-ref
           - const: socionext,uniphier-ld20

