Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C020C3B195
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2344120873
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNSNL+rL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgBNI6S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 03:58:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43162 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgBNI6S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 03:58:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so9933589wrq.10;
        Fri, 14 Feb 2020 00:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
        b=QNSNL+rLNykFchgRV/DrFjK9t/JCB785ApX8p4Y/EGA9ZdzyAG43eEMjRRUbl8CjS0
         6ko18LXph/gvjvCTB7rK68zOVC90F0ImDfg0IPYczHY9uK8ziaMk5HbQUpLRCqZXaUDi
         +LFi3gX5GFlmNT2izBO8sv38IKIP7SC1miwxTx/cTsnxi6mZ+Ie587QvaNiVqNHz6TyF
         8WW62dCS1Y06F6duOLIH8kriXsgF7ISpEvkHSBDtGQQfTGggDbq5f8/iFhg9W91Rq1iI
         a2C/W4rLyzGPCCB/K7LWyiXfyKkdXVqEztozeU3Qai/wTub03/szHq5rwykoVrfuJrq4
         7Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
        b=k1PYY/ioONlByio/Ql721zxN9pmGeWdEpk2UCixNMp2lNCQt7Jj8V+imS3H5YSapmE
         +R/6fRA/ytvhP2DT9vJUm73w6IwcOB1UGLkmPYhWzRs1XkH5s8GHfxt3Cyf29ciAdTie
         z+jizBlSaZDeZQeMKvuDYsbK6iCQ7btuse390neN/p7zSxbnhYlG4YYdkb7KzYUZtAbX
         1X6QbzA9qEOil7yoJfJYhLBzvsze3hz5Gjas9bBOiJ5QTHA9gntaXO90fFWlyNiU/VBH
         JnO1zqbk+/V3q3Py9kNSX6U2sG1bcMzuVCR6RIsOOfisS3OaXqK7W3oIwcX/qwGZzA8F
         EjGg==
X-Gm-Message-State: APjAAAXXS9Yewmh2lGGnOHn+BYoG+n9/ys5Xn8LTL+QENFnT6YCLKB0P
        bZ5xktQjpfpr/gFd72N1cKQzTnIC
X-Google-Smtp-Source: APXvYqwcae7yq515E6DyyuqdQxOHKOJomhuVpxmU5znQpy5j/SDuy3fPMOh9j/xQoLAGJpdL5fteOg==
X-Received: by 2002:adf:ed0c:: with SMTP id a12mr2854532wro.368.1581670695393;
        Fri, 14 Feb 2020 00:58:15 -0800 (PST)
Received: from localhost ([37.237.208.38])
        by smtp.gmail.com with ESMTPSA id x6sm6211708wrr.6.2020.02.14.00.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 00:58:14 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: amlogic: add rc-videostrong-kii-pro keymap
Date:   Fri, 14 Feb 2020 11:58:02 +0300
Message-Id: <20200214085802.28742-4-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

videostrong kii pro comes with a nec rc, add the keymap to the dts

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 2f1f829450a2..6c9cc45fb417 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -76,3 +76,7 @@ eth_phy0: ethernet-phy@0 {
 		};
 	};
 };
+
+&ir {
+	linux,rc-map-name = "rc-videostrong-kii-pro";
+};
--
2.25.0

