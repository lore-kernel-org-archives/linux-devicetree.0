Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE603C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3E5124658
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DV9zGDM2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfLFKCp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 05:02:45 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39668 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfLFKC1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Dec 2019 05:02:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id s14so6725267wmh.4
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Epi7x/oJWemZuOWxCyTo3Gx/O5w+7zyyIfKbXs2xGOs=;
        b=DV9zGDM2VDLj+W/PkMtGb+NjgPIRiMskE6QRoZOJxmIwQyWdsitEXC/LSr1go4g3ok
         YpoKe4UQKpUCSat+uuHqgnxzel8kCH2SKly95ke3DJcgXsmOrsGSMmJDrQw57NgCYuNy
         68mY2xYW/Qyc37d6s+fH4YDWFb+fK5eFsttBZrAdKpFjMotG4qE7RbcL5YNmb79bcZ5G
         rpEUzMKAGCUNrgZjL3/iPdbegfyZb0zxEhlYEBrlSu4qmCbYz1liA/IbpdF8gt2eUvP+
         12encTE8seNbMnF8bdCWUJLR6DvFF58Q4GTWAVZcaF30EFFIW9fzX6Zb2MenZdx2gCla
         gDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Epi7x/oJWemZuOWxCyTo3Gx/O5w+7zyyIfKbXs2xGOs=;
        b=K8qsBannDG6R2eJ3S70VvaY++RAMvaF1zKorm74jSM/AasyL0v1YzTL8cnGXIoYXOf
         PVBQeHRYZoBle5kg6b3kA/1ang7cOLBsargDt8Z3+YNIP2id/aFPcMXE+zQIvNWufUxJ
         nl9xnjMo+oJM7Ym9GPt97zyfJ9hy8PBrZfDmnxl/Xl1SseXhz0CM3JB9fuDRXG3vahqU
         IJ2Naew5ikkEY1PY2jw8jQV5veTxX05ELL1H6IzoneAm4jZpjVqUIsB97jipPRqbe6Ty
         jPrYRwY13rbqkdWIcGVQo8J+8sQKEpjSmQg8bTQGpCjZN4KoL5iHprz5vica5jzUxhII
         XsdA==
X-Gm-Message-State: APjAAAUZ3hx+Efci4r4+RfCKp7nXyz0gNcgrd3+pvr8dp1SoWjmLyiCM
        4GYGesn9X6MI+VPxFbomYY1CSQ==
X-Google-Smtp-Source: APXvYqzzzLwRMN6FDfuI4SOiGVwaL+aX+7EOM4lZ5ShHzqAhIFaDiD+fKc4aaLBYPXcyb3Vv6Gy2QA==
X-Received: by 2002:a1c:e007:: with SMTP id x7mr9208291wmg.3.1575626545231;
        Fri, 06 Dec 2019 02:02:25 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d14sm16372314wru.9.2019.12.06.02.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 02:02:24 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: meson: gxl: add i2c C pins
Date:   Fri,  6 Dec 2019 11:02:15 +0100
Message-Id: <20191206100218.480348-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206100218.480348-1-jbrunet@baylibre.com>
References: <20191206100218.480348-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the DV18 and DV19 pinmux setting for the i2c C of the gxl family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ed33d8efaf62..259d86399390 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -533,6 +533,15 @@
 			};
 		};
 
+		i2c_c_dv18_pins: i2c_c_dv18 {
+			mux {
+				groups = "i2c_sck_c_dv19",
+				      "i2c_sda_c_dv18";
+				function = "i2c_c";
+				bias-disable;
+			};
+		};
+
 		eth_pins: eth_c {
 			mux {
 				groups = "eth_mdio",
-- 
2.23.0

