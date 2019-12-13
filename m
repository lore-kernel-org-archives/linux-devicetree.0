Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F06C34983
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE89B2474E
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fAowkLwb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbfLMNaL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 08:30:11 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35300 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfLMNaC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 08:30:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so6673186wro.2
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 05:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RihAxbyPf1sWOBRmJF5IKCF0zpUINaJgm3m7kfkEZZY=;
        b=fAowkLwbvcaMDwhICxvEuVnjEW+/HgTUaD7s4A/Xn36fZT0rVKZ4y7m1k0IE2WY4yG
         HpLmm5baYQ5QfDQDu1l10QecPEfxHOTfdJPIpLnZ51SFJQ4h0v/1XCERjTz+Lewf5W0S
         RoqxDd5K94lovPJJYQIzqqsWkO4Qd8QDymklzOooZuJrb9LpQFXyXk5+KLfphgJeKNY/
         rmGC7TI6Wv2mdHg7NC3Q0x6uxP4dOZEwaNz7COjP6srZrTQrT36UqZt2d1GSZdsWDte9
         eJDuz/WkglAvJY9CbMC40XjUUkcqgFwuOeInr59Xp2kvFvbrbOsB5eGqYlqUMV+MDr2Z
         HD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RihAxbyPf1sWOBRmJF5IKCF0zpUINaJgm3m7kfkEZZY=;
        b=XwGsZh/3sT5GCJ+7oCYkHbWjB4ezVDj01sQYxaTNao1FUpet3O1q5FlmCXNuMPecNF
         lIyNK4HlVdvPzMA8GfBihRVG4DoU12zBIhfPJcW1mg5QoeFz/hq3W5ceQn4PbDiK7cqT
         bTn5SfwcXC2AYRI9mXvH0ugAoMzJ6bSMQvYvIaiegM5rclU7fulIulXxLwakPbOOZ0eC
         5AsXwttRddafLA2TI64tdZW53Y54eAf4pVfl8oo4329/lsbvwFcSz/tCSlZ1m6hwnW4h
         v4fbbmO1uEU4kIO+nwj/9iF6b/HAACMcCvJSRgzhNM4wtSD0JG4AsoyRvfYA1FKKDGru
         YZlQ==
X-Gm-Message-State: APjAAAWTVHEB/qdsBDRTbh5u2W2J94Tilh/I0+zD9xy0jXYKQsSlWs40
        5LZuSGkjNZtYs1WIaV1UVz5v8bU6fXQ=
X-Google-Smtp-Source: APXvYqwNnx7cmRRsx41+o7uRC5/UJmd0OtDKCdpnC8FmFH+IVjL9ZtYfSJJwPHF91ntNAr9l0PWr/w==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr12978031wrm.284.1576243800998;
        Fri, 13 Dec 2019 05:30:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id n3sm10540543wmc.27.2019.12.13.05.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:30:00 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: meson-g12g12: add syscon phandle in cec node
Date:   Fri, 13 Dec 2019 14:29:55 +0100
Message-Id: <20191213132956.11074-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213132956.11074-1-glaroque@baylibre.com>
References: <20191213132956.11074-1-glaroque@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

add syscon phandle in cec node to activate wakeup support

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 7fabc8d9654a..98c6a1d1d035 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1899,6 +1899,7 @@
 				interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_AO CLKID_AO_CTS_OSCIN>;
 				clock-names = "oscin";
+				amlogic,ao-sysctrl = <&rti>;
 				status = "disabled";
 			};
 
-- 
2.17.1

