Return-Path: <SRS0=YuQm=5V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292C2C2BA15
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 17:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8DD020678
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 17:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="F8GJLnTf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgDEReA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Apr 2020 13:34:00 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:32522 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgDEReA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Apr 2020 13:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586108038;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=QogDZOCus9nqNdEZ1wBxwV54eVkXLair7HgM4gYWe0c=;
        b=F8GJLnTfZXPgGQy5ek0If3doa9hGcgCoHPymSfaYN+yQIUmNVD17INaeJmkqxUzhIG
        ol6JZ4SO2hrW2OH+8wtRpqDeQus3f3q9QQquoq2i1QfB1Mvn30b0/MI85FVjfb9BnN7T
        PPL62sA3Dzl7EDRqkyrY2LoZ8/tRcQ5dgKV+0d97TcgJl+wDUEz1RjDJtcy9t2Op5NTs
        rd/VgiF5QLyyx5CSI9AQvF74gcPAfImGO1aVAgnzW2CIhKHtFJ2g1LsafQYKBhZG1sk/
        Pv0bD0FeHPpWzNmxWL7HH1AstFBnU9SxuVMjav6FflMxMh7j3I1SjfVGOGDFcv9h5Dzs
        H6Kw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NfqU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w35HXrxmg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 5 Apr 2020 19:33:53 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] ARM: defconfig: u8500: Enable CONFIG_GP2AP002
Date:   Sun,  5 Apr 2020 19:32:52 +0200
Message-Id: <20200405173252.67614-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405173252.67614-1-stephan@gerhold.net>
References: <20200405173252.67614-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

sharp,gp2ap002s00f is used as a proximity sensor in
samsung-golden and samsung-skomer.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm/configs/u8500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 0fd2726cf1c1..9387481f93a5 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -125,6 +125,7 @@ CONFIG_IIO_ST_ACCEL_3AXIS=y
 CONFIG_IIO_ST_GYRO_3AXIS=y
 CONFIG_INV_MPU6050_I2C=y
 CONFIG_BH1780=y
+CONFIG_GP2AP002=y
 CONFIG_AK8974=y
 CONFIG_IIO_ST_MAGN_3AXIS=y
 CONFIG_IIO_HRTIMER_TRIGGER=y
-- 
2.26.0

