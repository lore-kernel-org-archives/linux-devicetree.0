Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79E3C83007
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 05:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84666206D9
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 05:42:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XnIlImZ9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgD1Fm0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 01:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726276AbgD1FmZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 01:42:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C8AC03C1AA
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2020 22:42:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w145so15842095lff.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2020 22:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WH8zS66RY8W04XUM1pecSUY+m/Om2TcnzwoU0cWSKDI=;
        b=XnIlImZ9/xkX7DsWY8zdOxpKw2U1aTWXUrvm8jthg6TMo2HPCp6ZWOVwwsSi1dS7in
         Gcdql6FpjL02Nw442uVVHRa2R+qV9BH9I6E1y+QUh5Go7+ZZZKbDY7N1SQ/f0v+l6wQF
         9+r2vaeR6bRqxRZYd/dFxoqOnq78UsZFyHZT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WH8zS66RY8W04XUM1pecSUY+m/Om2TcnzwoU0cWSKDI=;
        b=RMBSAB8tLF9gFjxrnujIa4VNn+PSBwM0tmjm7xut4a/6RHz83EXlD4vo+01/s6oDE8
         Vy+Iifmqqg0y62HnSy/F+L6+Hr9X8I0YF32DGkIG4holi7IAwreim1UQ5IhCMGklHWVh
         V5zsRvHE4k9xWoc29rCZFkbsh48NAFwmr3ljRkuSkJBlS9lHmw8dII5oGMprBtH7dC5h
         efEFKxvFer+UNHEFoQxwtI9B2OcATCt01R+Zau5bQgSvdF+wOc7zxY73vFs5PE4uxbpD
         HLHpftpCbgrqZNIxG15uOP3CMxQwlrB4nbg+S82S+Vy7PZm3ZP8PxUCf8Mc8rGKZekeY
         p1eQ==
X-Gm-Message-State: AGi0PuZzgpVl/910ccIhyp3+yI4TZflak+ooJojQfPZQ0sH2d49Cm3Pi
        CQgGY3NcJc11sa6dlFI+4bfM9g==
X-Google-Smtp-Source: APiQypJCy3nrMtVbCUUuaI12o+IbsIPl4P1i68ayeLR+kFMj/gSQRL3AkJEQ+dBtd3D3u2dHwjgfWw==
X-Received: by 2002:a05:6512:3f4:: with SMTP id n20mr18037194lfq.100.1588052541929;
        Mon, 27 Apr 2020 22:42:21 -0700 (PDT)
Received: from taos-chr.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id c4sm13240035lfg.82.2020.04.27.22.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 22:42:21 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org
Cc:     linux-iio@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: chemical: add CO2 EZO module documentation
Date:   Tue, 28 Apr 2020 08:41:06 +0300
Message-Id: <20200428054107.16061-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428054107.16061-1-matt.ranostay@konsulko.com>
References: <20200428054107.16061-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../devicetree/bindings/iio/chemical/atlas,sensor.yaml      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
index edcd2904d50e..0d109e1b34ee 100644
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/iio/chemical/atlas,sensor.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Atlas Scientific OEM sensors
+title: Atlas Scientific OEM + EZO sensors
 
 maintainers:
   - Matt Ranostay <matt.ranostay@konsulko.com>
 
 description: |
-  Atlas Scientific OEM sensors connected via I2C
+  Atlas Scientific OEM + EZO sensors connected via I2C
 
   Datasheets:
     http://www.atlas-scientific.com/_files/_datasheets/_oem/DO_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/EC_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/ORP_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/pH_oem_datasheet.pdf
+    http://www.atlas-scientific.com/_files/_datasheets/_probe/EZO_CO2_Datasheet.pdf
 
 properties:
   compatible:
@@ -25,6 +26,7 @@ properties:
       - atlas,ec-sm
       - atlas,orp-sm
       - atlas,ph-sm
+      - atlas,co2-ezo
 
   reg:
      maxItems: 1
-- 
2.20.1

