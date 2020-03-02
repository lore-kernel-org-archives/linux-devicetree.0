Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAD3C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D52C921775
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NPzYl0+C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgCBLWE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 06:22:04 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41872 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbgCBLWD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 06:22:03 -0500
Received: by mail-wr1-f66.google.com with SMTP id v4so12060411wrs.8
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eHZJoauDU3YCd4oo6H8UkUj4vcKpuKTOVNgGI3sKcA0=;
        b=NPzYl0+Cj9Bodz62CFuc/7zeYsqpkh13Et0PpWoBeAy0TS2FC5OplEhDkxAYsc7Uvp
         GkkjKKcMZX9GWQNuJ5iT4Dq6TigXqR+mvYZZJpZyWpiCVEjb9PJ9fvCRFFGTnOQ4LZkO
         YzxSjml2OP392/Scf5dO8G7l4Kmh5NyMy/neFvB5mwjAoWkrkHhTs/jdvRjF9gs4KE8M
         kyZFxBfe6c7nR6gxQNu1/BoVNv9QgAajUc8QZpwFJUc4A11WKRDG7YBLYwsOMd2im58i
         CO7l/S5+9YSI9y0Ts7mQtTlB+k0k2jRGaGJRBOLGJ/oGOpWl2+2d566XLfXw+zwRHKS3
         jmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eHZJoauDU3YCd4oo6H8UkUj4vcKpuKTOVNgGI3sKcA0=;
        b=bVBVoZZpGQNuJfmBldavuWOB533d04Yno9mtfDOJgO2G81X8s1UVlZQL/IGA7Jzfsp
         U16XVMlE5SNn9eq4BGCmn3XUbKz8GDDClO8BJx+ue3oGRy87y+SaEteHZTlO3esw4HZ8
         KaS3m8D/3kvjhCUK2U4GmZ0v+n/5bOHly0kmGEnUFxR47c004FOPRg64x213NDazrGWT
         30wqAH+l+kKn0LT7yPj0NMvhXyan0k/6P2bVRgRgQzltpTE75Bg6kMiAjEFjK7NkVEO6
         K4rMs57n/45Nf76Mlp/x6pp5J/tvVkYBQcq2JsR8TRAH5DRP7DptaC7l0iNVpuQ7m7T4
         pYKQ==
X-Gm-Message-State: APjAAAU7Ei/l90LnMT+MenojkQSwQPpAjzstM+/YPfClVtFkD/RZ7/HW
        NkzhPhoje3ue1wx1BSy46gHu3g==
X-Google-Smtp-Source: APXvYqyZlRonNGPN6OZje8r6g98mgNwbkojbpYskc2y6mkeqC9MkKpFwp4Ipsn5QsmRq8gTVXPpHag==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr21397636wrn.209.1583148120855;
        Mon, 02 Mar 2020 03:22:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ecba:5540:6f5c:582a:cc84:32f5])
        by smtp.gmail.com with ESMTPSA id j14sm28398441wrn.32.2020.03.02.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 03:22:00 -0800 (PST)
From:   Fabien Parent <fparent@baylibre.com>
To:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org
Cc:     matthias.bgg@gmail.com, joro@8bytes.org, yong.wu@mediatek.com,
        ck.hu@mediatek.com, Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: iommu: Add binding for MediaTek MT8167 IOMMU
Date:   Mon,  2 Mar 2020 12:21:50 +0100
Message-Id: <20200302112152.2887131-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds IOMMU binding documentation for the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

V2: no change

---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
index ce59a505f5a4..eee9116cf9bb 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
@@ -60,6 +60,7 @@ Required properties:
 	"mediatek,mt2712-m4u" for mt2712 which uses generation two m4u HW.
 	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
 						     generation one m4u HW.
+	"mediatek,mt8167-m4u" for mt8167 which uses generation two m4u HW.
 	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
 	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
 - reg : m4u register base and size.
-- 
2.25.0

