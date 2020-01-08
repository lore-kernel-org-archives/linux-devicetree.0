Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CC7C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 17:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A6C3206F0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 17:29:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T/HyNHaq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgAHR3i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 12:29:38 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43202 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgAHR3i (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 12:29:38 -0500
Received: by mail-pf1-f194.google.com with SMTP id x6so1949479pfo.10
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 09:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mMwd4GY7WpoUd+q3WHc05cOMnEtzmKmuiR4/lw/Ya3g=;
        b=T/HyNHaq9e8cbQVUreQfu5gRUOxAEtP7KBnGPK4VG1izDsBIXfErCDkAzoODEWAKfT
         KmVRs7if9s79Hw4/IRFF7llVxAHbrvpIH1e5fKl5V0cerMK08L5hixYimJYXzQig4pB4
         ihttQxAnVdGv3/7gXuOM7it2XnqHJCQwIkoIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mMwd4GY7WpoUd+q3WHc05cOMnEtzmKmuiR4/lw/Ya3g=;
        b=DublmyUrwspfnprgwj/4dtl//X7cNyVu77X6coBLIUCABW9qKi+5RSJN6aMpiayl8s
         UmAZZZDLkmjcC+KKJFMhupdF2NUYzwAlXo1SsXBMfKwX6nVTV0CFHkwqNC+li1bLZ+F3
         lGVsTKSTki0sQb4qxPUNFaWUH8OX6KR90N8Y9Qlf4/eHOalu2LutCTvhsuTzOvRm8ZyT
         noY/8yE93ghIsPPnXwR9hdPbVAnTDaxQlvCJr52Q9qSKJml/6FiMGkM98JHYqSz15d0c
         2cM0TgmLCMx2oO2CECbOL6LHgRcoo9Zh22SfJy2kIohrHLHqPvxEKAgkju0wuJH6eRCr
         5sZA==
X-Gm-Message-State: APjAAAUw/AnyyYgTeaOWW5aayy5j3+lA4Q2lCIDPSF09MNl9lxmw+Ec4
        rmQAslVeRvG8KW0rMgrMub5Lpg==
X-Google-Smtp-Source: APXvYqw0OvKMBstXlwLxuisnD8Yf1k/xKZ1PL3f/l7d7MkDcdEYGfVApur48bGpdfK8DooEJJ6BlMw==
X-Received: by 2002:a62:7c58:: with SMTP id x85mr6263307pfc.76.1578504577924;
        Wed, 08 Jan 2020 09:29:37 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id i4sm4464144pgc.51.2020.01.08.09.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 09:29:37 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-rockchip@lists.infradead.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] ARM: dts: rockchip: Use ABI name for recovery mode pin on veyron fievel/tiger
Date:   Wed,  8 Jan 2020 09:29:33 -0800
Message-Id: <20200108092908.1.I3afd3535b65460e79f3976e9ebfa392a0dd75e01@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The recovery mode pin is currently named 'REC_MODE_L', which is
how the signal is called in the schematics. The Chrome OS ABI
requires the pin to be named 'RECOVERY_SW_L', which is also how
it is called on all other veyron devices. Rename the pin to match
the ABI.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Another misnamed pin, I should have noticed when fixing the
name of the write protect pin ...

 arch/arm/boot/dts/rk3288-veyron-fievel.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-fievel.dts b/arch/arm/boot/dts/rk3288-veyron-fievel.dts
index 2d6f32b77821b8..9f4bb5d2e7d8dd 100644
--- a/arch/arm/boot/dts/rk3288-veyron-fievel.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-fievel.dts
@@ -234,7 +234,11 @@
 			  "PHY_PMEB",
 
 			  "PHY_INT",
-			  "REC_MODE_L",
+			  /*
+			   * RECOVERY_SW_L is Chrome OS ABI.  Schematics call
+			   * it REC_MODE_L.
+			   */
+			  "RECOVERY_SW_L",
 			  "OTP_OUT",
 			  "",
 			  "USB_OTG_POWER_EN",
-- 
2.24.1.735.g03f4e72817-goog

