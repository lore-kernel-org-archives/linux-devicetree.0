Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82D3C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 15:08:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADA3A2083B
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 15:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Q5NcUbxb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgG2PIB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 11:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgG2PIA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 11:08:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C2EC0619D2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 08:08:00 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k18so5843789pfp.7
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fLWyfEUhKxXNKJFrSYCE0dME2LhnACi7EQ1AP/MIj5Q=;
        b=Q5NcUbxbJL2tzk4NSOjxEP86/y7iXE/BKfpf4R8r781lbtlWBGEPj8Go7eRSvqg/tX
         668V1XwkzjMmAAZ4KArwoDV4Emv0KSCP+FL/fJtMnxwBt2fl+340li9mMpuCJqTlkZua
         gE5Jy4w4JyB5B207TNc9VX+pBmHiiysKdiy2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fLWyfEUhKxXNKJFrSYCE0dME2LhnACi7EQ1AP/MIj5Q=;
        b=XRCx8rcCQSghotdlvZcmydqcqwX/wdEJxkehnqS/FPYf+WVxvkMTjpIEDAEsrIDfqq
         cVmiXEzYoQozMxbDccu5EHB7kIa/PW5HMc9EbnzEXwhSyK/uPqi34rlz/VcP/Au4BogS
         eI3MB2V9RoD5hFN3N0BUS9SDGPgL12tVCn63FOIxggPbl8AK90CFE/JOI865RJgQ2dSS
         +0z2xyQwQaXvxKf/xMSpcVIZVJBdOh7ARXqhNLm+XOIU0oOA/KXCeI3EM+kLCLKLNOiH
         Y8s/Q+SS959wadRhL36PN4BJP3tMpOHywoKIJPR4RKJqGVLaORjlOMZgHaL0wkqRfMxx
         9p0w==
X-Gm-Message-State: AOAM530Cw8nJTa1IylRb9iJEIkNrQHQIggHORq/hEpyGpn6R99Lv4KUv
        wciH8CoVPyyAUPovw6IqzUb4ug==
X-Google-Smtp-Source: ABdhPJz/66JXRSWGtpeKrp5Yo0ZHqUK71S6otyWtJitmYVlxgEiPcuU9A7VikImtfuUpkv5uI2XYMA==
X-Received: by 2002:aa7:810c:: with SMTP id b12mr30728293pfi.69.1596035279685;
        Wed, 29 Jul 2020 08:07:59 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id q11sm2688058pgr.69.2020.07.29.08.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 08:07:58 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/3] dt-bindings: mfd: syscon: add compatible string for mstar,msc313-pmsleep
Date:   Thu, 30 Jul 2020 00:07:46 +0900
Message-Id: <20200729150748.1945589-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729150748.1945589-1-daniel@0x0f.com>
References: <20200729150748.1945589-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a compatible string for the pmsleep register region in the
MStar MSC313 SoC.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index f3fba860d3cc..614e58bb5d7d 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -39,6 +39,7 @@ properties:
               - allwinner,sun8i-v3s-system-controller
               - allwinner,sun50i-a64-system-controller
               - microchip,sparx5-cpu-syscon
+              - mstar,msc313-pmsleep
 
           - const: syscon
 
-- 
2.27.0

