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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A53C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D103A2078E
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNlBfP3a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgHQKVn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 06:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHQKVm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 06:21:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14984C061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g7so6139980plq.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T27zylxvpG1uKqrUR70eeURZpzCdR3pXDMNQ1pHagbA=;
        b=VNlBfP3aqV9004jXgp3H4ztvNReV0zK1OpUFaeDXTUwiRv0XGfieBxtZW3sItBlv31
         P9vWc2+6AeY880kFFgV+wuiG328ys0LfN1Ef23S4dbRvb2NWFK2vkPaucKuNBbMNDMJL
         0mrXUoAu1i1H1NFX9qtwx8ZxRwJTFIT87CvZUDfsOFsaJaQOiJlsICSyrzddkmoo1UL1
         qvGgK8Q8eZIvmE9UxVq0ncCCdykZVH+nwodWAI/mFfnevNfqzPiLarroHQFaxqk3gePX
         3GEX+OYoiqKYhdnET2s/4+OAzx413hnAahRF6ldwgEMxoThiAwhY3mwUkNFyoxPe8W2R
         +k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T27zylxvpG1uKqrUR70eeURZpzCdR3pXDMNQ1pHagbA=;
        b=lHzW9zA6tdRipu5hKeatrzDNUCR2mpkbleZ2bzrkQqTdBbtgpV+0XRt+/gWwdh2Djq
         KsarCqR6YohvMRxD3c6kQ5qir7pJbooRiB3L9iC9UC3dRo2ERT8HBkiI8jdKYGBEKDn6
         1jFPTOlec5L15YMmKho8YCdwDfCwDmC5W0ejwPyjDMuFoFLwOzxtKqZtHeqn3r+F5/4s
         mTCl9QEBdbdevNAYjNAqdiLuvw/Ls/w0LS6pxZF4msUIG92IsPy+Iuho4A26TyIJ72GK
         xCCVfVAqLQPQQwP98aWgywzn5626vJXsBk0KvQMjIZPmeEhb6iNojGVC1x70PJPaaJAo
         e+8w==
X-Gm-Message-State: AOAM533EEarwzft8wV/DOnil0DSjoU6sF3bOPdOiecDNLI4P5giV6Vxw
        lEO768xHRINzMf74tFLeiZv0+RFeJRQ=
X-Google-Smtp-Source: ABdhPJzjP4kr8mjLNZZY23q6m/Nvpl8Mwl7NLBzr1RoFgFmBmkYWnUSsW/ucuWK+7RapTzSZyLhzOg==
X-Received: by 2002:a17:902:82c1:: with SMTP id u1mr10710196plz.224.1597659701482;
        Mon, 17 Aug 2020 03:21:41 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
        by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 03:21:41 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual RTC driver
Date:   Mon, 17 Aug 2020 10:21:21 +0000
Message-Id: <20200817102122.434-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817102122.434-1-linux.amoon@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Disable virtual RTC node on Odroid N2,
since RTC PCF8563 support rtc wakeup.

[    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
[    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes v2
--Fix the subject and commit message.
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index f08ae1b337ad..7fb952a2a35e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -642,3 +642,7 @@ &usb2_phy1 {
 	/* Enable the hub which is connected to this port */
 	phy-supply = <&hub_5v>;
 };
+
+&vrtc {
+	status = "disabled";
+};
-- 
2.28.0

