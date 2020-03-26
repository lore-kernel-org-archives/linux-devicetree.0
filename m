Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EADC2D0E5
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 13:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAEC220787
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 13:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WFIzC18k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgCZNpi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 09:45:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37023 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgCZNpb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 09:45:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id d1so7061383wmb.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FYmBKvDX2uegk8HiuHznpAIvR/lIVMa/DD0ivvJWoKc=;
        b=WFIzC18kvsFjgIJ4FAaGh/U0e0VcyLOupRhUbB4tyLL65yxfgasTs/rTmfpo/K+C8r
         PfCapoDbaqg61p+hAHE7MW7uwGmcPNN0d3wQ/3UWumCMIsY4I5Gu0s4TQqOEeflO4HDm
         Ttxvoii4MFFwJXu1wNm5hk7cnRzqx10VF998dfGBf81edsilQuIw7ybIwSV1XlVG32Wx
         rp9uaoLg/EeTOZni35QERf+9CqXseJQnfGe8h5UtBa65ktyqDSGuejQiF+iGS9Vdm4Ve
         GSEu8/QXFsKWm4phRr9YycLomXzQvo9aVbJTThCeKu3Hvs+yExIEH5hDMK0Tvf21dSaZ
         O4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FYmBKvDX2uegk8HiuHznpAIvR/lIVMa/DD0ivvJWoKc=;
        b=b+qeZyqidS/o5QqxKoPd75W6KAO3uOFpDe0v/WUl+FQ+qQbQ0sSj82aFGkFhCxGu/3
         lNTjkpcQ+DmWYI6GoqlDQuc0ugSkHpUrS+nHbqcjbKiFjqMX9bw0F60lfutMDSLUIeCr
         Y5collSXgKpKp8yC3TjrJnHTmzuvDYMo8Y7DUYlSUx4PGGlV6JvX+ZG/2wSYdGH0PXgL
         cnMcPg5zs30ld3sIydud31nhqIhuHo1zkYW4xEgGvMr43FRzEjfagkktBW7F/OLTObaI
         8O6rkRojLyIqtQTXcMIkCf1TB4IWlqJVkniMC0ZOeSNPOQkzyzSXHIagMHbp14XSzFN6
         0l0Q==
X-Gm-Message-State: ANhLgQ0ssK/CWWfVCl1Xj0Bzxgn3WIEpTGHdjjwXr850/G2icQ3d3SH/
        RZvAbKkUG3z/DNC5ZPKxggrK+g==
X-Google-Smtp-Source: ADFU+vtDec2EyGWkeh0RHipBALtSpkGygZ/tofT3qFJR5rH8aahV1B9w9HjqJoFyqKyUoc7AtWokQg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr70540wmj.12.1585230328275;
        Thu, 26 Mar 2020 06:45:28 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:27 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/14] doc: dt: bindings: usb: dwc3: remove amlogic compatible entries
Date:   Thu, 26 Mar 2020 14:45:05 +0100
Message-Id: <20200326134507.4808-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..2ef0bcc30648 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -14,8 +14,6 @@ Required properties:
 Exception for clocks:
   clocks are optional if the parent node (i.e. glue-layer) is compatible to
   one of the following:
-    "amlogic,meson-axg-dwc3"
-    "amlogic,meson-gxl-dwc3"
     "cavium,octeon-7130-usb-uctl"
     "qcom,dwc3"
     "samsung,exynos5250-dwusb3"
-- 
2.22.0

