Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CACC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFC4020758
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="DCTR0x8T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETLZy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 07:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgETLZu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 07:25:50 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACA6C08C5C0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:49 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f13so2184864wmc.5
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
        b=DCTR0x8TJBa8+opcAvlYBjrh/vCYQMQoQ3RQ14CYFtSRQpZI/qhI4oIh4w0OI3jZxY
         lUOXz7W+Pz6EP2XZ9uKzLEWgEH6gMU4ZNlDHEeOk5LmpYDOTtu19/ow+Uwlh5LBJZlgA
         vze8VuncLa9NqJBxeRh9BoF6r/IyN/fJQ7/eytgThQv2cbdvbG0e6Rr9ZZMfGKx2P+zQ
         yUmZmjfLffCCnwhOJ2L9/fDLMJtsbDO0OehqMKyXxypBkg7w5SuC58HzlZzSp3c1g15c
         qkyU+xehJAV9meR5oFN4BX2lxYb1JrUCkes4m9UtJFVNZwHqMFRNHnCgzNKwrqTzj0lL
         B6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nZF4M1Ryr6CWnpRgUMWuRsLTKn/UHmWXZ3+MZTEjA0A=;
        b=UCk8mjSyncD9H634Sv7NQDlS1R2i9VarQL/MfFOWk4ehd0wXLZCOLr2K8Ln+aWrMcJ
         PybV6i3Z9Fv5Io1aDq+b4KRRORPHFAWErn72iaAIvNNlXaqDjcUfSWd6/+bkVpbaT9Ag
         htu6l6m03i0zRdejjUm5yhgEZRXc4vxIbklyCYo2uWhPxbZI5fEu03kNP0hRG90SvPWN
         wfm0JfSRKMPJQqkS1Fe4SoJf5Iy7pCPNhgV2PgS8yaBnk4sU4iS/k3yL7T5e9LItrsiN
         r6j/xzdneu8I0HP7Ig6KirZoACbVUp+jv85HRxPNr9KlWSr5tFGbdMpFP+CJNbygJg/1
         eRHw==
X-Gm-Message-State: AOAM532QfpCHS//FyRKMMiFlEDJ6mSxL+w4pW3/kJRGGFrBXwr0FPfzI
        iYYwRcUGDrs4MA1k3gI8AjiBFQ==
X-Google-Smtp-Source: ABdhPJyxQ3juEFptHcCtPg6At1kWItPyvN042bhzhG99WFO1SSzV77tG4mYBDeWML0N22iIOVzKg5g==
X-Received: by 2002:a1c:6706:: with SMTP id b6mr4265142wmc.54.1589973948657;
        Wed, 20 May 2020 04:25:48 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 04:25:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 11/11] ARM64: dts: mediatek: enable ethernet on pumpkin boards
Date:   Wed, 20 May 2020 13:25:23 +0200
Message-Id: <20200520112523.30995-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add remaining properties to the ethernet node and enable it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 4b1d5f69aba6..dfceffe6950a 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -167,6 +167,24 @@ &uart0 {
 	status = "okay";
 };
 
+&ethernet {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet_pins_default>;
+	phy-handle = <&eth_phy>;
+	phy-mode = "rmii";
+	mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &usb0 {
 	status = "okay";
 	dr_mode = "peripheral";
-- 
2.25.0

