Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254C8C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 19:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3FFD2072F
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 19:41:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Afuo/4MC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389391AbgFITlr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 15:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389384AbgFITlo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 15:41:44 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE721C08C5C2
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 12:41:44 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id h185so26719pfg.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKjncVZ4QOe9AtcEsOqfdOIJlppfhRTgsX8dqfWz9G0=;
        b=Afuo/4MCKsk638UL6cRXXyK+mDgOSMyHLpn5vOBhRNoKPQCDgl+M0Uj8XzX0bJWuYJ
         c/dDLw4BBIXnUu15Zb/cIcm5HDugcu5iHISy7IZqTwmYRFxyOcZQT6BoJrmjcLh5VInZ
         tj5sOtNvkGdeIqHAMqFiw//ciBmU59qGwtctY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKjncVZ4QOe9AtcEsOqfdOIJlppfhRTgsX8dqfWz9G0=;
        b=ctahEGl249NZzTVWzq4Nwcnm0OKqGgf+Sze32FpmbaT7PZOKXcIFaxDcXL9YsNyj8m
         pxEjZSleZl63uvOsHSHbpmVAi0DKXjjTtaxVDMlahM6Tl/piuh+FoUHQd5+x/b8u1jGb
         0YqtbXtPqOj7oyVNjF3O6jntKVTFqIZ3Tos8qGK298uFSvYk7u7TdNBS2LmIvVy57qT7
         VoEhejPjpFRRn/O5dcPHWfR1aNZDk+g9emahAhr8RnHzoYDYBCAwsYqCxCGDpQI0/naV
         E4e29pGvECUFBBkY4z7181ZqryjBzAtu58SA2NKMJxBGh2g9KdAflWWIUJBcpM/2mGXj
         xoLw==
X-Gm-Message-State: AOAM532EBOipRNNO3ICym1l2NHY+LdF9ksALrQKAp6eu3t+z9RKsQ+RW
        NWOza7pcgC3N+AZ3WHMi3QSNqv9LwkVYWg==
X-Google-Smtp-Source: ABdhPJxsY59wlAe7u96jNUc1NqgqgXcXvHG5lQxGtLmG4W1wZtRJWLQrD/JmjZCM1sSUUi23YzvSSg==
X-Received: by 2002:a62:ee0b:: with SMTP id e11mr8584104pfi.185.1591731704151;
        Tue, 09 Jun 2020 12:41:44 -0700 (PDT)
Received: from ubuntu.Home (anon-42-81.vpn.ipredator.se. [46.246.42.81])
        by smtp.gmail.com with ESMTPSA id z85sm10563627pfc.66.2020.06.09.12.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:41:43 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org
Cc:     linux-iio@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: iio: chemical: add O2 EZO module documentation
Date:   Tue,  9 Jun 2020 12:41:16 -0700
Message-Id: <20200609194117.5837-3-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609194117.5837-1-matt.ranostay@konsulko.com>
References: <20200609194117.5837-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../devicetree/bindings/iio/chemical/atlas,sensor.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
index 69e8931e0ae8..46496dc250f2 100644
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
@@ -19,6 +19,7 @@ description: |
     http://www.atlas-scientific.com/_files/_datasheets/_oem/pH_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/RTD_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_probe/EZO_CO2_Datasheet.pdf
+    https://www.atlas-scientific.com/files/EZO_O2_datasheet.pdf
 
 properties:
   compatible:
@@ -29,6 +30,7 @@ properties:
       - atlas,ph-sm
       - atlas,rtd-sm
       - atlas,co2-ezo
+      - atlas,o2-ezo
 
   reg:
      maxItems: 1
-- 
2.25.1

