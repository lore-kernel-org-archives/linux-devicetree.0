Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E5CC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 02:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 054BB20705
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 02:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGXX2od9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfLCCOa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 21:14:30 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42971 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfLCCOa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 21:14:30 -0500
Received: by mail-pl1-f194.google.com with SMTP id x13so974914plr.9
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 18:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9KPgXU3E6Sr8Ubzx44nNFMIGdqQxtI966pQzecUZpvA=;
        b=LGXX2od9Dv4BFtWI7Z2tcOdykO5L4amDzI2vnG+zPiaVeqhsUQEJUh8c6FBGaxMIvO
         hzJMEaO3SPr6VnFlGXxoUh8OQ+SLy0DODfQ5NidpvlZwh07seFU0+688MeV9VJRHb610
         aFWeEG9KV4+nyN3V3Cj83iTd5gSxf35wTmqkE4sED5hiHJHHXw+Kh1L5Nnc7CYjiKA7x
         JxbEHBEreLo/11Xepy2qKdlitBHDayOqUazHUgtbjP7vAqaHIYwg2jiL1TjpxKfUT1nG
         XkwcIwOPbFFD0zE0YgPgX5siYWhxAK2tBJg2PD6XViveBALyMSnN6Z3sgm1cyq0Kurn7
         VWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9KPgXU3E6Sr8Ubzx44nNFMIGdqQxtI966pQzecUZpvA=;
        b=F5RLooh2XI64rPflvoH9X9j5WrZjhIg9+wFBKxDx+79RT2FxG9cnq/lb0A9ent2717
         0LU31q8hSua/6SGzFFQRdvKOcYic2TwGT+7u6Cn1WRadEPBq93yVKsiYqCu4QOhBE8RU
         o8+aNEfDcjM+ra3ikS6yiRmUMjI4ykVgovlo3jR3FlW3BozHZ/ArX25qC0U8be2rXBPB
         2ho/YXNclkHbOg+myDsQMgzXA65avmYLUeBbpL5yofSP/enar4cyHEKTXfkL1aq3LMgC
         W/14jGMu6ukEGShgw49WTAIDnOqMiaDX38GLJfgPQ+pKeTpU/cQOo6TXNFw1ybK/liMM
         5mhQ==
X-Gm-Message-State: APjAAAWJBCJngewR5OWGT0Qu95/myUpoPjfSxJhh44RjaWB3cFDcnD//
        O7r0kLRXMEWSoLyZaNUxL4c=
X-Google-Smtp-Source: APXvYqx5B6sHweZcdl06RHNrv7cwxjlpUX4+DkYw3Pcovt9avfdndMvedC5ziOW3Tw2ueV26ai5QRw==
X-Received: by 2002:a17:902:bf47:: with SMTP id u7mr2551220pls.259.1575339269628;
        Mon, 02 Dec 2019 18:14:29 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id a12sm922528pga.11.2019.12.02.18.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 18:14:29 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: a64: set GPU clock to 432 MHz
Date:   Mon,  2 Dec 2019 18:14:20 -0800
Message-Id: <20191203021420.164129-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

That's what BSP kernel sets it to and it seems to work fine.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 27e48234f1c2..0051f39b3d98 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -976,6 +976,9 @@ mali: gpu@1c40000 {
 			clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
 			clock-names = "bus", "core";
 			resets = <&ccu RST_BUS_GPU>;
+
+			assigned-clocks = <&ccu CLK_GPU>;
+			assigned-clock-rates = <432000000>;
 		};
 
 		gic: interrupt-controller@1c81000 {
-- 
2.24.0

