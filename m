Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D90C04E30
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A21D2080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HG2T15sh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbfLIOio (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 09:38:44 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45231 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbfLIOin (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 09:38:43 -0500
Received: by mail-wr1-f68.google.com with SMTP id j42so16412814wrj.12
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 06:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XVxY3z3jO25K+7clgiD3fKNA3bHm5aN4+J3uKucqrZ8=;
        b=HG2T15shJSJ54y7RsQuRt9mrYK5WEedIS6rRlx18E8uC8rXb1Y3k2h3iOVkCCumQiP
         /q/YUh2aJdEeJ7+iA9NMBNpe2riWD1AE9yPIAT6IzvopGKZ47zh3lmHmqaG4/FIeYNYS
         VUPGF+Ts1Mb5nkM21YxRdIRUX5Ws4I2q1f+GNz+SGpNhJLTVuaSY8M6CEk8s6+bJtzLU
         I9XIvMVEtyjahCd2WCrRz3mrF399h2tnImT/5d1OYU7FkkQawfI/VSHwOnnEbmVLza7B
         D1vORy1r1KY866KxIb2HccXS/5TfQfFcLDJ4iWGwFW9IOHmBXz2Hb+pbVhlmdZmJcMWY
         b0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XVxY3z3jO25K+7clgiD3fKNA3bHm5aN4+J3uKucqrZ8=;
        b=YnKNyjrOY+XDD1i6/Bmmm4088MzDQWyeUMn6mlEOYLkQIEmIwlJXTB1DIMnzQLfwLw
         efLdwFnXNKUb7p7qIFCIQc1iBw0VM+alyVgXXRvYUNieaMf35lvpEto3l11hrCJ1fMUD
         d1WJ1EYrqE3Pp6LYxlMK7ZIySMQP6cJ1DAEZrX1AZipYs6cfLo7Hu1HBgc7JjdyntyO4
         zgRjaKDJeoWTKTrFXlIy6//Z7Um/5sPz9WozMA95GJlRFoOL4JiH3uGgV04nJjOQU85p
         4g8EiaxRCWvgRen0T/LafbjHL3MLnXV3MuOb8zQmDZVdLSOhmMP0xvHiiOQ78mGGI70J
         9HVg==
X-Gm-Message-State: APjAAAX1NypGdCZ8hkXUQQOL/mJJo/3HWGIMlGMGkR7+4qFSmUhf97xE
        apZ3NAtskVlZPr/dc5Jh8+KP+w==
X-Google-Smtp-Source: APXvYqyIzQHuKh60zkXMrtB1gWGpysiz3Lj3Ozcq7LikDUwc6+3D9PG3cIvaVB6sRShCYkNXyhoVpA==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr2597194wrs.92.1575902322035;
        Mon, 09 Dec 2019 06:38:42 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a1sm1904165wrr.80.2019.12.09.06.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:38:41 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: defconfig: enable FUSB302 as module
Date:   Mon,  9 Dec 2019 15:38:34 +0100
Message-Id: <20191209143836.825990-3-jbrunet@baylibre.com>
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

Enable the type C fusb302 driver as module

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6a83ba2aea3e..33147f54efe6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -603,6 +603,8 @@ CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
 CONFIG_TYPEC=m
+CONFIG_TYPEC_TCPM=m
+CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_HD3SS3220=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
-- 
2.23.0

