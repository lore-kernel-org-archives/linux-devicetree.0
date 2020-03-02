Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440EFC3F2D2
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B1A021775
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aXkSI2bB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCBLW1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 06:22:27 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51596 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727744AbgCBLW0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 06:22:26 -0500
Received: by mail-wm1-f65.google.com with SMTP id a132so714048wme.1
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 03:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pXFVNDmvd1Q57O9A14StFD9o/pCLl1WZ1LXT9jyY7wg=;
        b=aXkSI2bBqKF1Vn9HUmliqysTYyVduIDV+GQticrpQgMBTuEwdyXOU/yJMasY+tU5Bh
         hp9mdNGiZWQRZY43djxJU5Te2hjCeYOJpZE7Kf3yMhWMtbjr/YfeBWsTUYMli0o6aneL
         hjQxlCGaHxw5B4mqGQuBdfFY64NBTbqKcFbD9Q9B+reFNDjYSirVv+uhEuEH2mPjEYye
         DHGWR6uPEVThhBh32hv4RMSCHXtXBfMxNBgCzr3MAjMAcXu9Vuz4o2qszUfTlZaWAC/q
         a5CF7XzPxLXyWRXiFRJ0m1biCtXgBj/ia3i8conaAv6hKKaW6UZZ1bQ38AcQvB9ihgIL
         o5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pXFVNDmvd1Q57O9A14StFD9o/pCLl1WZ1LXT9jyY7wg=;
        b=WDe+Rn92/WcSMv7U3tJm1kdhDKSh0zaenfKZ3hG/zEMi3tmgDQUbycmJtSibUunt0G
         77Z4xx573YgAuv5jOrkQSJDsXFeiq0EzjI4/Mq1bxCMFlbsgIXg2k7ErnyFdjvmFM2wB
         U8fB4qm4JwesRZh24aPxNJ6V3Qyj0pY/O756xhUnD3gXZHmkbH6MQyAWYuFt5uFUJNJR
         fGL+zk3pqSwjx6wzECSmFROe4YQV87z7o93/qC6cfHrSmWoq1YGJyXq+1yM1A5T5dWll
         iMfrmP0q8XSY0AwRrkvdhOvhcfDz/40JRQS9bZmX5rVngw1zJalBWP8WphN6ipI/44q6
         9jRA==
X-Gm-Message-State: APjAAAUHb8G/peskeutgEErMKuHrD45KmMCtFWl/z4ihRs1xnuTdpjR8
        0Lg7oydSb0kDGbm7jq6hVS4rBw==
X-Google-Smtp-Source: APXvYqz+e/Cqch5x656k3Vz2SnBMUPxNp29Vb0LYw28FU3uDN1mzrpA/IdGcwPsttcC9lnuYBg3tgQ==
X-Received: by 2002:a05:600c:2942:: with SMTP id n2mr18840374wmd.87.1583148143534;
        Mon, 02 Mar 2020 03:22:23 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ecba:5540:6f5c:582a:cc84:32f5])
        by smtp.gmail.com with ESMTPSA id j14sm28398441wrn.32.2020.03.02.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 03:22:23 -0800 (PST)
From:   Fabien Parent <fparent@baylibre.com>
To:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org
Cc:     matthias.bgg@gmail.com, joro@8bytes.org, yong.wu@mediatek.com,
        ck.hu@mediatek.com, Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v2 3/3] iommu/mediatek: add support for MT8167
Date:   Mon,  2 Mar 2020 12:21:52 +0100
Message-Id: <20200302112152.2887131-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302112152.2887131-1-fparent@baylibre.com>
References: <20200302112152.2887131-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the IOMMU on MT8167

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V2:
	* removed if based on m4u_plat, and using instead the new
	has_legacy_ivrp_paddr member that was introduced in patch 2.

---
 drivers/iommu/mtk_iommu.c | 9 +++++++++
 drivers/iommu/mtk_iommu.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 78cb14ab7dd0..25b7ad1647ba 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -782,6 +782,14 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 };
 
+static const struct mtk_iommu_plat_data mt8167_data = {
+	.m4u_plat     = M4U_MT8167,
+	.has_4gb_mode = true,
+	.has_legacy_ivrp_paddr = true;
+	.reset_axi    = true,
+	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+};
+
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.has_4gb_mode = true,
@@ -799,6 +807,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
+	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{}
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 4696ba027a71..72f874ec9e9c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -30,6 +30,7 @@ struct mtk_iommu_suspend_reg {
 enum mtk_iommu_plat {
 	M4U_MT2701,
 	M4U_MT2712,
+	M4U_MT8167,
 	M4U_MT8173,
 	M4U_MT8183,
 };
-- 
2.25.0

