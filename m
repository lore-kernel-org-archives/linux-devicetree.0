Return-Path: <SRS0=8u50=4L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9433C35671
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 18:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C72C220836
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 18:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgBWSDf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Feb 2020 13:03:35 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:42919 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWSDf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Feb 2020 13:03:35 -0500
Received: from localhost.localdomain ([37.4.249.121]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8EdM-1jRo3d2MZk-014Eed; Sun, 23 Feb 2020 19:03:29 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] ARM: dts: bcm283x: Add missing properties to the PWR LED
Date:   Sun, 23 Feb 2020 19:03:05 +0100
Message-Id: <1582480985-6773-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:XcNS9Ic/XYxQMTQVRGfFHMyCdVwa7jnl5/ZEYauO68lvf+tRpdP
 RG4lDH6u8NZ95HK7hjeqZscQmy/bYszpKWfZ/uHyy+neEAvAFQN4Oi7M8YuRrFFsWnwe4Qj
 IIsnv03fNNuVecjADqaz36u1EWxM8PF5rFFqTUsCXd3HjaLFOA29KRIFoPNoFgDdlILA210
 fUTVkGAFhc0eWswM5BeWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FUS2MfPpk1Q=:Y8tGNSjK/6mAPT2ud3hm5B
 NvB1PT+wrqRcQETrjkr8Rkr1iSdJBdSmHvxqrpkl6MK6mkCa9On9DOvKrvpzjdoMf4Cl1+uL6
 imEugl63jZLPiDk3YCeLXhxSxhhHWdrgRrd8a9mGGTPgtDMczTlGJJbPVov1B1XigGT5gHNo6
 b0meEfJeDMdbTYJQRf5uaATuJNh1m99/YE0jxN3O7yvtMW27cznFtSL2K3+tQrietupGTB4lv
 ARF51pd6lVOGaC+N/HyGXufUUcQmnzuecC1OV5hz7MoKtBfGd+l4mdfOa2lf1MVL17a3e3as2
 gTNeuneOoPamVDXfo4et7HTw7xvRxchCftvE+Xq/92VuSgFNwtcyKOEJsLCq9lrpytBMNbb5F
 nkSzKRvg8WLDsSnAs+7yLADS18MKAS5TGCZllOvMldv3D5Re8f8Kh9d5cA0dRpVwfP5NHtDMY
 JxDhj8nZf1e3iFgvW76m5lbzSOtO9bWpueuy+68DBjAounpF2NHK2KmtFT3lNzu8QRf68SXu5
 t6dAuU2QGWnKyh4RLcoKB276Mwiy8cJOVgi2b+urOktt6EYBaYF19rmfDDzREweaybgAeHViP
 qlIDPDs4tuqaxStm1nIKbrYILPNS1JQHXjKG2n7WIt3f+bMP3LrAQtfQk/V7hvzBV0/Rr26hN
 DESJA6quAgDIba04/IRHSoTrYMm+z7er/5B/4+rWoIhA1PUNr1bpYdVjIWhnkOD4TZGoUoCIP
 2jFy/QH7DqrkVJeYz0NfVyxrDoLF2vIVWYZZS7vWH6JjBQrW/HxuUqpboXGze9RZbgOoKVoX6
 ylYECUTbjknv5T5/jI/8oU35z2e+B4B12l85NYr99Sz9t3nvfjtmWreZcgu9O5CTLgDNz7a
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds the missing properties to the PWR LED for the RPi 3 & 4 boards,
which are already set for the other boards. Without them we will lose
the LED state after suspend.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts      | 2 ++
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts | 2 ++
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index cb33852..f242834 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -31,6 +31,8 @@
 		pwr {
 			label = "PWR";
 			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "default-on";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
index 66ab35e..28be033 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
@@ -26,6 +26,8 @@
 		pwr {
 			label = "PWR";
 			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "default-on";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
index 74ed6d0..3734314 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
@@ -27,6 +27,8 @@
 		pwr {
 			label = "PWR";
 			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "default-on";
 		};
 	};
 
-- 
2.7.4

