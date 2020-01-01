Return-Path: <SRS0=z07g=2W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54859C2D0DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jan 2020 11:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 284E5206E6
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jan 2020 11:25:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bRoDYVtQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgAALZW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jan 2020 06:25:22 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:32794 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgAALZW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jan 2020 06:25:22 -0500
Received: by mail-pl1-f196.google.com with SMTP id c13so16726120pls.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jan 2020 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kGyS2va2MM5LlItUz13S22TtfwiSSFhRb47vRs7rcSA=;
        b=bRoDYVtQ1NYUFDceNj0TvN7AgLnYHCKEZc9F2ihByaESmLqX4XnrdAyOdO4dIcdRNd
         BPIkUn4kHcXhQ90ZIpwuCpprRMAd9REj4spU0ZHxdb7GuFfpFARUird/OWwD74k/7O9q
         6R61h1eJJ/m91+hWicSXyQHEFX4LaY2hg7YyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGyS2va2MM5LlItUz13S22TtfwiSSFhRb47vRs7rcSA=;
        b=lyEJwoaK3WV7Yn1rs3JhOq2dOB8wiDRBfSn+vRZ6LSpRU+Sgx6hdP44HmJtLvWPkVc
         avm32Nm5FjeFIv9uZrHLsXSXKgBsxbkyCi45Z2TPyVa0OlD3o0rJNl/2rJU9710feDio
         PHceC9T9yypEMjMSVOQuLWjVcCAGQz2dbqh9g9L0UMEdcEIF9vu5droHwj0tPBdYxJ+m
         nveq+1I4MgpKvDYlVOYbleU9vJOYXrYTEp9r/Fk3osMOhlVqC2HT+L0TMHx+JNAqyTLa
         UmL+XYVUabZLaDZGJ6jresNDytpkanZ6LOv2IieYXjdYYDJWk0TUe9m0jAO8Y+eFick1
         rSyA==
X-Gm-Message-State: APjAAAVIrikLF4FzjsZTnS7Gnj1h5cn5paCz82en/EzBjaHJ22LCqxYL
        ElHcDtYVJJKFxiIZ/uQcauYNKg==
X-Google-Smtp-Source: APXvYqx1w7BI3kSg5znfx18d2dqgKYCH7WWv2q9ctxYTFGBJxvjbzmixsUdL7wGN2fv0ZiGpf8bK6g==
X-Received: by 2002:a17:902:6b8a:: with SMTP id p10mr64853544plk.47.1577877921397;
        Wed, 01 Jan 2020 03:25:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
        by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 03:25:20 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 3/6] MAINTAINERS: Update feiyang, st7701 panel bindings converted as YAML
Date:   Wed,  1 Jan 2020 16:54:41 +0530
Message-Id: <20200101112444.16250-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20200101112444.16250-1-jagan@amarulasolutions.com>
References: <20200101112444.16250-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The feiyang,fy07024di26a30d.txt and sitronix,st7701.txt has been
converted to YAML schemas, update MAINTAINERS to match them again.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b2e6c68832d..4d6e4febd170 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5169,7 +5169,7 @@ DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
-F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
+F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
 M:	Hans de Goede <hdegoede@redhat.com>
@@ -5298,7 +5298,7 @@ DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
-F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
+F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
-- 
2.18.0.321.gffc6fa0e3

