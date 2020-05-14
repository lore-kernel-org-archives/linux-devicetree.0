Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27522C433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D6A620575
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Vs7BWdW4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgENIAn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 04:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726848AbgENIA3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 04:00:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BBFC061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:28 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h4so29164741wmb.4
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
        b=Vs7BWdW4qtjuWLul+b3IMZZZnvBlsodINipnQPxtpW/F7ENBD558mOLpTqiiVB3x8t
         hLT1BV2jrTOFkQu3nW4Su+sDY0Y9SjF1qdgjI2avlRSXBWGtoyup1WdDhscdp4FSyz/+
         MqrADU0tNfAhxW4oXxQnnKc65GJ9UdZBzNyHKLJkPr4Z8OGo9w8MMWDUQ4A8XNu8x6Wb
         O0CHpyM30xiSeFh3K4OT3R9Z7oD7u3674d9224CetXPrYmxKG4VOSQVY2jh1vT6SdQCw
         37CfB6SJsMXQU1dZB4OfcABQw8ds7oxxV9nnA6Vhw7l0QsIy+W7PrITFiF70cVow9PKS
         hQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KiLRpfO6b7G+PZFXWrA65hqZV6E46x1U4Qg5U0775pc=;
        b=ITzcQxMqD/gkSyysRIDZB2rhHrriMQvYjqFFvDunJFnErCtbJpP8ZrdFdBmR9UjkPV
         IcpLsrylILpA8/DaiprWOMpoONEbGkOQl7JTPEhG1OLUGYjVBL7oaKCnn0xO4SKwg2tq
         QTIz6/CWNomXrAFbWwDpPg1cOHKTjI/d99iVlmaslg4NSGdkci22gAxk+bpLLAK52dJn
         l3NBwxYQKuUVrU+whFHmJj0FX/EBSU4pJuE8etvkCtC8Z5eUKKc2CR4dVlMWk6wpYo1R
         5mvK8pVNyzWe8k1qlV9oh7ywmJFgxiQWrixdbn/1in3JzVeOmyjR0xl5m03RdM4tliDq
         9KWw==
X-Gm-Message-State: AGi0PuYGlLzY/NKAkliTMrm+QcMknot8vdryUAbUf7MgIMHlCKqbS0Wg
        NpkWYFXoyqWPcgYrD8p75g1MPQ==
X-Google-Smtp-Source: APiQypJbzO8pCBFuVuOAqVYsKQ0PvXVzzMvcQ4KkdS8eawJ/v7ILL6jWzMqCUpbB7Qo0NSK+v2z2MA==
X-Received: by 2002:a7b:c41a:: with SMTP id k26mr41792532wmi.85.1589443227078;
        Thu, 14 May 2020 01:00:27 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 01:00:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v3 14/15] ARM64: dts: mediatek: add ethernet pins for pumpkin boards
Date:   Thu, 14 May 2020 09:59:41 +0200
Message-Id: <20200514075942.10136-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Setup the pin control for the Ethernet MAC.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 97d9b000c37e..4b1d5f69aba6 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -219,4 +219,19 @@ gpio_mux_int_n_pin {
 			bias-pull-up;
 		};
 	};
+
+	ethernet_pins_default: ethernet {
+		pins_ethernet {
+			pinmux = <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
+				 <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
+				 <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
+				 <MT8516_PIN_6_EINT6__FUNC_EXT_RXC>,
+				 <MT8516_PIN_7_EINT7__FUNC_EXT_RXDV>,
+				 <MT8516_PIN_8_EINT8__FUNC_EXT_RXD0>,
+				 <MT8516_PIN_9_EINT9__FUNC_EXT_RXD1>,
+				 <MT8516_PIN_12_EINT12__FUNC_EXT_TXEN>,
+				 <MT8516_PIN_38_MRG_DI__FUNC_EXT_MDIO>,
+				 <MT8516_PIN_39_MRG_DO__FUNC_EXT_MDC>;
+		};
+	};
 };
-- 
2.25.0

