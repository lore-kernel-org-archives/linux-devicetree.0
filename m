Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D102C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58AA22078A
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pN1BhJbk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgHQKVr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 06:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHQKVp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 06:21:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD51EC061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:45 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x25so8012451pff.4
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lty6facXqNiOm5uMHf69/sWVwYZMbpQy+5RWM2GRtIg=;
        b=pN1BhJbko63bRfN8Sp914IbopiUiqNfP1BodnjxKtgh42cd6Jc/A5kf+Ufy0DoSrSS
         QOur7EcqvNqO2Wxv/J6GcMUy5L3ZyWFkmrWeeEnAK0LT3+9ALAI01Uuzvz9NMTZehZ2s
         zBTwUWg+XxKctwLb6qIlXcFRqQJJ+YXbnP6fqXH2ONOTqS9dXRLmMqarNgJXjKc0SvRl
         awxc1ZCw5AvuYPpNNhy0Tp6OXNarmSN77P9Z3Bz6e7P7YHSw46vTDRsq5UnPaoYb6cC1
         a3Ta1okPIBj1WlczEqBJMomIM6Kpiwk+qxKDy3sOF9PsQV61RPzQtzCTLDZ5PnP2klPM
         wnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lty6facXqNiOm5uMHf69/sWVwYZMbpQy+5RWM2GRtIg=;
        b=HlcF9di5m7t+jSm+ZTtnq0RhQmfq7FtZgg9+NfaeoV1DNoi7rI7iWjAyaUZHg2EVbj
         f7iFW0E3Nts9OOJZ8ImgILxQ9UDizeNZ4npSLjsbIbzoV3SuMpHq5VsP6reAaBP9WZqd
         SRMfXNBSIRyfXJ4Uy0B1Tjdk+zvJ7wq4x65+/L00qKLVx1EF02c27gPGEwxb79MgAz8N
         cytOXnY7ar26EKGy85nLmgTCtQunU/B/Y8QWkJ5r37bsDA1oApSguoWCysXYVTHiRhPX
         mWCq3JCfHocqc6jgjXjIMtMCRVjxLX68L//eWdxChjMUBbOjtJTBSi08bfZd0Zep5IP9
         QIcQ==
X-Gm-Message-State: AOAM530N/rXBp+up4gJMugLUHmFURr0Rd1ALw+F/F+Hf+L4+XQm7bT8n
        3S2dgst0XjPcxs+G+NdtgQ4CQXQCrdA=
X-Google-Smtp-Source: ABdhPJylJwiE+zRYuMkQNccV7+uAK/8roRhHGyenffyM530Ozi5JeiojHOGJNXKpQacb+PD6qixZxg==
X-Received: by 2002:a65:40c1:: with SMTP id u1mr9110103pgp.379.1597659705173;
        Mon, 17 Aug 2020 03:21:45 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
        by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 03:21:44 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 3/3] arm64: defconfig: Enable RTC devices for Amlogic boards
Date:   Mon, 17 Aug 2020 10:21:22 +0000
Message-Id: <20200817102122.434-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817102122.434-1-linux.amoon@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enables the RTC PCF8563 driver used on Amlogic Libretech-pc
and Odroid-N2 boards supported in mainline kernel.

Cc: Kevin Hilman <khilman@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes v2
Added Neil's ACK.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e0f33826819f..3d9756833e0e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -773,6 +773,7 @@ CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_RV8803=m
 CONFIG_RTC_DRV_S5M=y
-- 
2.28.0

