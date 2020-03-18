Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F07BC5ACD6
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 17:10:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08DB020757
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 17:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AU7eU4/3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgCRRKZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 13:10:25 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35282 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgCRRKZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 13:10:25 -0400
Received: by mail-pj1-f67.google.com with SMTP id j20so715198pjz.0
        for <devicetree@vger.kernel.org>; Wed, 18 Mar 2020 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kzfdHSO2Eg/pCLBb9aj78kXEmbZ2vEcI/EKrPZigKxI=;
        b=AU7eU4/3E2gmDQx59Lfw1/ryh1dsM3Kf2E6dy+bDEQvBh8/uU7w/X6bF4fznHSSASt
         i9a1E9VmxE4DYH7eZKZ0cxcueWHrdKoa6z4ILBjN9BKMuZXFt/w8pxYRqIvTyG4YVPAA
         9bbZIYZI2dDr7gbfsEXq5e4y4RoyIeJP3JSjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kzfdHSO2Eg/pCLBb9aj78kXEmbZ2vEcI/EKrPZigKxI=;
        b=sf3XB75fCeJqnfUrgFwKv6gs3czd1XEAnnyvXGhp0IKuxYUKSCg9r3ZQgK7/pGmkML
         8Y7vvJMoBO08FQj5MI3zGGTxB92YK7eSq8E29FA9+1QXuZOXZ/7zD83TK490d7m3vzaF
         WpdXHv2E+AAxu3NL2eXh8SVI65IaILVmENKEBWAIaF5kf1BQiyZz1jTIKBiA386MEIm4
         gVt9xoLQGCT6iczReoJWCJW2wmt6XVG4viAdlJXEvehlumMEAHnzXWWy0Vsu9DEIE8yf
         DWoxsX3xnw1OFGOwZyVK5cjEozaAT/JESWKwvNve3wQK2q2xqqocADjNHM3+34UmYRiF
         IN+g==
X-Gm-Message-State: ANhLgQ3nc/PmhF2jg4MbTVW7eRbC5+Uw41jyP/lfXv7laNS/2WjX4kRU
        m9Ukd8B6z4w39omkErPo/p28vA==
X-Google-Smtp-Source: ADFU+vtu5mYYKn1aoaSPcvAoMeeiGoWtv0NZSu62f5Smu2NArdKXK3KRad7e8p6T+qn3WvIFv3X1nA==
X-Received: by 2002:a17:90a:26ed:: with SMTP id m100mr5599112pje.130.1584551424263;
        Wed, 18 Mar 2020 10:10:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:1998:878c:c26e:b8be])
        by smtp.gmail.com with ESMTPSA id e6sm6443869pgu.44.2020.03.18.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:10:23 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 3/3] MAINTAINERS: Update feiyang, st7701 panel bindings converted as YAML
Date:   Wed, 18 Mar 2020 22:40:03 +0530
Message-Id: <20200318171003.5179-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318171003.5179-1-jagan@amarulasolutions.com>
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The feiyang,fy07024di26a30d.txt and sitronix,st7701.txt has been
converted to YAML schemas, update MAINTAINERS to match them again.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ba8b584bf95..b987f2588e6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5273,7 +5273,7 @@ DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
-F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
+F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
 M:	Hans de Goede <hdegoede@redhat.com>
@@ -5416,7 +5416,7 @@ DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
-F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
+F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
-- 
2.17.1

