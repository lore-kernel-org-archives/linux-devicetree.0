Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C06CA9EC7
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BB5A2083E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wC+E7pnd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfJ3MYg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 08:24:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37276 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfJ3MYg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 08:24:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id e11so2080659wrv.4
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bHjRV+yplRefJlnocFGPLm9WDOa+jJqsx2Sr2LtJ1vY=;
        b=wC+E7pndDd0Nu4Djtb8R4PV7qUVnvwzShce4FxVWXcyhub4y8UOBGEIaIYZUoGDfTp
         3HtWrIbS2bh+ywtcbeiFJ1clDBXQVmTO2tCkOUDp34PnjyvMp8IKSxQO8wvPyJaaUGT+
         X83hE1GgIwSnuKLMxwwlPS3wyg3R4faPTiI8PzsAdY2UzsgjmeHmiL8W+3IWAMQ6oVpQ
         ozAo7ni/foW14HXTUgqep6j4qO3SuorOTch/cY1NwfwAxB4fPrhXXJemHPAAWkuMNfma
         ldEob//Ldv1X0tODn5lAyQV75vwYKjaTu8wzUAzEgKdhYgyx+GV2xX0OSr4BY9crHC+k
         +aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bHjRV+yplRefJlnocFGPLm9WDOa+jJqsx2Sr2LtJ1vY=;
        b=HUQCms4754wiIHUrW+HWFs1DYJQYn9FFd5E56jyr9UYnFJw8+43iAh1tzG7MtmiK/P
         RqwPiP4b3geWbI/bMjfIhfkzi/gf7K1Lz3MQb8axsSPDWP6bNOBcN3BcaHU2hkWrgoyn
         rXJrOwMA9lHIgqjUabKunmeAJ3/NQvbXgP+g9CggPVRM8Qvgji++x6R5T/xawgZqxQzy
         p23TJGw2rV1hr6TELETR6Ox8knfiII6ZYBA25HjFemT/sCQMTi1qavWSMwdIj4H1kLJk
         B5PNfwfjyzsUQ4Pp0GZnsgN8X9dJ2k6lUkgQfuxSVP6KxsXXKq3IQA7+dDusPw64HRc5
         2Ubg==
X-Gm-Message-State: APjAAAW7JmIf7e10yiQ04K9EYr8FDfOrRtbtL6gYJVZFlTxgkNdZko/7
        p4ljGuvBSZLqhOUDk6M/Raeo4Q==
X-Google-Smtp-Source: APXvYqwnK2n5AsuwOMfvbkBWHzsINKxEYn88SMq95kpBPr5ZaZT7aBWqOr49OuFqhi8NohL7D07+BA==
X-Received: by 2002:a05:6000:4c:: with SMTP id k12mr26069063wrx.100.1572438273908;
        Wed, 30 Oct 2019 05:24:33 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id p13sm2075919wma.41.2019.10.30.05.24.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 30 Oct 2019 05:24:33 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org,
        wens@csie.org, jernej.skrabec@siol.net
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 2/3] ARM64: dts: sun50i-h6-pine-h64: add the hdmi_connector label
Date:   Wed, 30 Oct 2019 12:24:14 +0000
Message-Id: <1572438255-26107-3-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572438255-26107-1-git-send-email-clabbe@baylibre.com>
References: <1572438255-26107-1-git-send-email-clabbe@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

For sun50i-h6-pine-h64 model A we will need to modify the connector
node, so let's add a label on it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index f9070d9e6c43..448ccbecf82b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -22,7 +22,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	connector {
+	hdmi_connector: connector {
 		compatible = "hdmi-connector";
 		type = "a";
 
-- 
2.23.0

