Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF16C32771
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 10:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 152082072A
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 10:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IY5Q0Bgm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbgAIKK4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 05:10:56 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34665 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgAIKK4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 05:10:56 -0500
Received: by mail-pj1-f68.google.com with SMTP id s94so820761pjc.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 02:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dbC21RRgSudcfzr5QWN03HN4co90yPnzp9bvtIPiw6Q=;
        b=IY5Q0BgmHLcQVi+Nd8CTG6T7x9dxAKRluJCeIn5hxSAAv6TjP61drY8WQRs424L3kH
         zmI1kurtlILQd+/5VKR+/k+MIeGWmMHnVqyyu7sHjxu/5fk29/84J7HOtFkRwydI1an5
         kOz5T9+B9Ujzd8FfG72TTneb3qAYzHsoxTauA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dbC21RRgSudcfzr5QWN03HN4co90yPnzp9bvtIPiw6Q=;
        b=XNJVfHp5PW2pmDAp5vD2GfvAkUkcmyRhxmG66zMdOAj215GbK+LdhDk3pDdVJNKpAx
         8GVISyoZcambewz7iXvC1shgwYmoRCr1KNxfqYZeDXicUex+hoADDp0d0s5SoXMjS97G
         9fhrweQ+3ITnZPpuP3otPOCWiw+KVCU0Hd7MH+hsPr0w06BWQbMUj4QE+SMy6P0qDJ1p
         U5J7AY5YQ2Z63YHzeV+soYflGHCoE7KLzJbT56AtuACuhwYJOCavzE+HQm+R/EOPYTF5
         pEDeK5vFwVS9VMJ+nx2o9yLdmY3idTSbiII59r2RZs5TduCItKeeNBd0m7zywTPCbYHZ
         LfDA==
X-Gm-Message-State: APjAAAX7QVHOEvGnC3b9i6yDHMVG0vujJDdrgfc7dSvaEGh3bt0AWPQ1
        +bFOetr5jSiivC5vFuvN9WlcaA==
X-Google-Smtp-Source: APXvYqxuqSBYL6QU134n5GYda6RQAwk6cDgFPhQEWnVc9y4WnlfO7L8zj5BmXQnZhoNaDp7P+SdRYQ==
X-Received: by 2002:a17:90a:3742:: with SMTP id u60mr4446045pjb.29.1578564655024;
        Thu, 09 Jan 2020 02:10:55 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id s11sm6518713pgp.1.2020.01.09.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 02:10:54 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
Date:   Thu,  9 Jan 2020 18:10:41 +0800
Message-Id: <20200109101042.201500-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200109101042.201500-1-hsinyi@chromium.org>
References: <20200109101042.201500-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
SoC.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4043c5046441..a27b22f264a2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -86,6 +86,24 @@ properties:
           - const: mediatek,mt8135
       - items:
           - enum:
+              - google,elm
+              - google,elm-rev1
+              - google,elm-rev2
+              - google,elm-rev3
+              - google,elm-rev4
+              - google,elm-rev5
+              - google,elm-rev6
+              - google,elm-rev7
+              - google,elm-rev8
+              - google,hana
+              - google,hana-rev0
+              - google,hana-rev1
+              - google,hana-rev2
+              - google,hana-rev3
+              - google,hana-rev4
+              - google,hana-rev5
+              - google,hana-rev6
+              - google,hana-rev7
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - items:
-- 
2.25.0.rc1.283.g88dfdc4193-goog

