Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE16C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 16:33:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEFCA2072F
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 16:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCco+UPr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730538AbgFHQdw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 12:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730568AbgFHQdu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 12:33:50 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC9EC08C5C2
        for <devicetree@vger.kernel.org>; Mon,  8 Jun 2020 09:33:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so21308523ljc.8
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2020 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+2vmCPmV1GsBmZa4YiHUJXp9kcoqHgm5vAPz2Z41dc=;
        b=dCco+UPr+Qdqyxew4yI7E/N/GFI4x1x5iAWBvad3otlo2w6Mz/ATPfCXrVBYyd0fmp
         sPGCvbx0279Nyc4cAJpMD4bmWLfTalhfPcF9xgQjbppHeOKL/ihn4sRUXyz+/LBcNbN3
         CBbcve97jjtiQXPsa99SqJjZa7J/nND4Ky+qYTZzd2E5Ne6LR+sAJEJ/6zRDvLrUFK2C
         C31nJ6SvZRIsytK2bDqotUluqHWbWPj3/sqPddM229t1XvhzoMmumyCRvK4trXb3ZXOD
         eM+ZaT15kI3Fb/+hgj9hoX5byyWuPDpz7mA1ya6owI8HVRt5Rw+yzGbbZWAg2mlkYxqr
         YkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+2vmCPmV1GsBmZa4YiHUJXp9kcoqHgm5vAPz2Z41dc=;
        b=sRzKBaA1MpPX4jIWEDn7AnKwX0tqkmoyv5wjn+jUDU/sN5sCvL/iOz1as4ct6n+K1k
         6+31GlahjPPY93hJmeRVsc9aOMIrOuvTUxTDBQEYGetv3Ax0sAgyLOfxx3DfUevFFo+D
         JWkhZzB3IqRQYuANsc6omKaritOZopf/rQdxWMWPwcBAazRxH2e9NhNBsomf8iyZcW4r
         4iTX8ggcmqHnIKlSlk3WUmJSast5pJaOEloqCnLUrgSwXeRJuy6+QJ6rabYnkej1ZaXx
         baFNUKkhOy5V+Pe2EkLVcfGSo0371snbnI8z3oOX6PzgBocpnNh8R7ew33SiuWmCpTD7
         puKg==
X-Gm-Message-State: AOAM530BuEhQp/3oiNqc8Z8gH2h+ljgOQ8ZyDjjUVbkiIfhuaCQEQHQV
        NJunlwThj/DwEMcZbN4Pmr4=
X-Google-Smtp-Source: ABdhPJxWz6PWDu5d+EBngNCpxb3yDuZrnsOhXN53kUvD14Jhj/X1w3zjmm7O83fxLy0M2bIlygz48A==
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr12667749ljj.367.1591634027398;
        Mon, 08 Jun 2020 09:33:47 -0700 (PDT)
Received: from elitebook.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id y199sm4439179lff.6.2020.06.08.09.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 09:33:46 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] ARM: dts: BCM5301X: Add missing memory "device_type" for Luxul XWC-2000
Date:   Mon,  8 Jun 2020 18:33:41 +0200
Message-Id: <20200608163341.1743-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This property is needed since commit abe60a3a7afb ("ARM: dts: Kill off
skeleton{64}.dtsi"). Without it booting silently hangs at:
[    0.000000] Memory policy: Data cache writealloc

Fixes: 984829e2d39b ("ARM: dts: BCM5301X: Add DT for Luxul XWC-2000")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
index 67a5982af9c9..9ae815ddbb4b 100644
--- a/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
@@ -17,6 +17,7 @@ chosen {
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x00000000 0x08000000
 		       0x88000000 0x18000000>;
 	};
-- 
2.26.1

