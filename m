Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB958C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86D442080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bgdYUnoM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbfLIOip (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 09:38:45 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44397 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbfLIOim (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 09:38:42 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so16457490wrm.11
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 06:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Epi7x/oJWemZuOWxCyTo3Gx/O5w+7zyyIfKbXs2xGOs=;
        b=bgdYUnoMPZDXdsjX/9vcHHh4AhMHDgfVrrvAupKUML77jRaoxL9/NvhdiA3ZMmipmy
         Jh6GBd+LNpkSvVCmEGegBET1wLZw0BGK9Tf8TS2FLVhkGSfHNLIpn26W6/OgYaOdurJG
         VkysX2RbVaBkWnuKrsZRUov3ZPgLSqo/GUQpC+Afb8P8yVRSwt/JYF0wlRT4H13fsMGz
         u4Bp8VjvzY5uiWzn2ryHEgBegOObNFvbvp+qgxK+tgosahySidgoDmY/xsNQYoq3UbnH
         XSrKiT6mYb6DVgB3Ia4ihZO3B8DtrFosvLvyu6HhvyOepkwabmgVVvYivjmVmGvr7tkC
         3GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Epi7x/oJWemZuOWxCyTo3Gx/O5w+7zyyIfKbXs2xGOs=;
        b=ryKEU4UYC6IfaYGZhR/RwOQyqVX9dyuYgRSsLZoOGmOFPijRYiQl/ASUJ80wSmJyk8
         QbQ1Hj9Jl0ZU2i5iU9L+NRsjPVZsISxzNddBjN1zPH3QaN+uStRFf5PsuOqjFDO5Ebzu
         9OriGDMb516NkcCKCfBb+Cyzjhl9D91XOUP2WIPruQhf0fC5zBgzdUTL3oHkTw+Yhpcs
         dTxz7BrCFAxQjshqaGQFXUScLyepG1N4DJ+YU/sCTkXo14HSW/h522fZKPBcQL8it/O+
         yMHRM6cqbpXPpvjzFrWghhkA+Cz198cWtYdx5yzkv7BNxEYMaOFZ+ZGI0CZhDAdWZGnm
         rr0Q==
X-Gm-Message-State: APjAAAVwiZrT/KGbxtOI9MpEzb7hkV3ynuxGjrFNxzLRzG/cJBry2tvS
        Y/fvMbK8TJ0a1Dd2TUnRn/a+Cg==
X-Google-Smtp-Source: APXvYqwEPo7H2TrDvEZ8PxznGxvq+VF5LH9ZGRBvL7oA+alaSnWJwD3BYypna4Isdo45BDTa98Z6GA==
X-Received: by 2002:adf:c145:: with SMTP id w5mr2529815wre.205.1575902320859;
        Mon, 09 Dec 2019 06:38:40 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a1sm1904165wrr.80.2019.12.09.06.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:38:40 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: meson: gxl: add i2c C pins
Date:   Mon,  9 Dec 2019 15:38:33 +0100
Message-Id: <20191209143836.825990-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
References: <20191209143836.825990-1-jbrunet@baylibre.com>
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

