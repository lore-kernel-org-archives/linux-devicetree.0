Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699ACC352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42CD221739
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVAHUdjU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgBJJ10 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:27:26 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35318 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgBJJ10 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 04:27:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id z18so3672902lfe.2
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 01:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RAQUA12B8fw61LvmbPVXA4Z+BIR0fWuOuilM7HoszrE=;
        b=VVAHUdjUGOnhNSSOTwO8j8iNwA8OvvwXz0HNaG7Z4v7KdXZEC9tZABemYa3hh1LtLx
         ND90NS9rpW4koGVStj6d/23RX8gMUD1meNrKBOer/0ZFwfbIbvv9r3MKojNgxzwIyqwD
         pOkd3gf1bnfDlNthtxURSoLOmMiy6aFkN6K2CwxxQTchydoy8vJoj1uV/c73a2YI0hei
         O6zwEchtmBMANO145rD1iSLknThL3aJxkTqDQ10icgrPfMGzsEL8U/bWaFBAwrbt+hab
         EcbqHPv9dTUE7Rcv/WP7yuzPusS31Vgswsd0CUowBqJ3ionGsxwZCEnt1O/VDGw1yWBQ
         dsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RAQUA12B8fw61LvmbPVXA4Z+BIR0fWuOuilM7HoszrE=;
        b=nLFKgKVpnEvsBsJzXzPcew+YiHaIDAvOkCVEjVktxMkLeqDMVIBY9KTtg4dYzSCXbk
         ACt5Ft96HNExpRDSXm9jdXvN6S2w6ztetPKYbnqYmM3LyoLOX4jSHWK2+Ns/q26oR4GX
         6t/4KsX4lL6KIJjhb3qhsrNHNu+LXDdXq66yKQgU8TOB6pcrPa6UOVMP79f0TJ7jEkPO
         MUpx1/4XAwGctRDjaWR8MNFs6HjX0q7lmgFKlMZVSFf0mMHG49mYnpcdNQvidzFfP2yu
         eVNBZ0ErdDarLhHuraHt3B2amQ4zDADcEviF4N36U8P0BUvs+rOThN4dz4oEk3G/cyqe
         wuOw==
X-Gm-Message-State: APjAAAWKOo2kKk2VWVNwNVVUuybPm3o1mEZVeyyEZ9LiGU7xYo0QhQ1F
        WuMAEQB8a7lrdVXwLQgDHGF0dIESwss=
X-Google-Smtp-Source: APXvYqxk9fdmZSurzHFLqkRZoeIFcEx44ID1iOZ53/3SGlp3Mue3CfnavApkhrRwMAMIk3wHf4b9Aw==
X-Received: by 2002:a19:4f57:: with SMTP id a23mr257463lfk.145.1581326844610;
        Mon, 10 Feb 2020 01:27:24 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d9sm5989882lja.73.2020.02.10.01.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:27:24 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/7] ARM: dts: Versatile: Use syscon as node name for IB2
Date:   Mon, 10 Feb 2020 10:27:07 +0100
Message-Id: <20200210092713.279105-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200210092713.279105-1-linus.walleij@linaro.org>
References: <20200210092713.279105-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The IB2 syscon should not have any funny names, just call
it syscon@ as per the convention so the schema will apply
properly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/versatile-ab-ib2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/versatile-ab-ib2.dts b/arch/arm/boot/dts/versatile-ab-ib2.dts
index 5890cb974f78..c577ff4bb4be 100644
--- a/arch/arm/boot/dts/versatile-ab-ib2.dts
+++ b/arch/arm/boot/dts/versatile-ab-ib2.dts
@@ -10,7 +10,7 @@
 	model = "ARM Versatile AB + IB2 board";
 
 	/* Special IB2 control register */
-	ib2_syscon@27000000 {
+	syscon@27000000 {
 		compatible = "arm,versatile-ib2-syscon", "syscon", "simple-mfd";
 		reg = <0x27000000 0x4>;
 
-- 
2.23.0

