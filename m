Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9F4C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 20:02:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5493520723
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 20:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h7u6dR4B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgFLUCz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 16:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgFLUCz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 16:02:55 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D3EC03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 13:02:55 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t7so4617505pgt.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 13:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uGSExpyps+wiw7uOwP+l2H0cv+SpFFWTmb8dRKkt6U=;
        b=h7u6dR4B19jQUlPQPyqjXka9J3KhpwDNlIcPUaI2++siCsOQzCELypYC05rGhkBGfK
         g6A0zotR7FceCE016nrOeQktoGXFoxfPsVMkwkGm2ZK8vzxnm9PHYfuf86mrONiRQW2Z
         Zw4dDBZtjL34Gk9sshcTJuMJRBFPMalZqIERo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uGSExpyps+wiw7uOwP+l2H0cv+SpFFWTmb8dRKkt6U=;
        b=Mt8ZaidmbUiHJGmGf9MGA4u6O57q5UfOV66RptrHJ7L0/bcdhwwD5dMnyWSNjf3RgL
         j71fcCC6ONGGp89TTUTLbPHmSt94ViQJhj5JJPqT6LLgYO0AbW5p8qdHhH8kULLFUcTp
         U7awxyNJMZ7Hs/DyIHG+bAB272tNlKaybo9pnAJ2jPzSMntsKLxbZDVhg4H9dfBj+x24
         W0mlJdzLBpjQkWFudp7Ld5ZkPsfBQDav2Ku+NRxfd2jTKo/0baNWEKbuglvaIUxlSKdU
         hHutVLwmzyHWw+27OIk9DwyIOpwVcxQmrusVQjjCSGsB0Nc16mfqzqHNt3Ys/mtYKaGk
         r+eA==
X-Gm-Message-State: AOAM531SE00ylE4jYNJtz4qV3NX1fEPqMlzGj83WjSw6TW10Z8Ja3qzJ
        uYSVzFEFi+vOaNzTTczujVsvsA==
X-Google-Smtp-Source: ABdhPJz0sMFDiDA11ABe5kT1o/km+Y+ock0L+fTuGu64VLLvv2xzyZOb5s8slfiJArkBbrcCb8SSjA==
X-Received: by 2002:a63:1617:: with SMTP id w23mr12597286pgl.248.1591992175014;
        Fri, 12 Jun 2020 13:02:55 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id f7sm6544851pje.1.2020.06.12.13.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 13:02:54 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     heiko@sntech.de, linux-rockchip@lists.infradead.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org, mka@chromium.org,
        dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: dts: rockchip: Add marvell BT irq config
Date:   Fri, 12 Jun 2020 13:02:48 -0700
Message-Id: <20200612130219.v2.1.I66864be898aa835ccb66b6cd5220d0b082338a81@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Veyron Jaq and Mighty both use the Marvel 8897 WiFi+BT chip. Add wakeup
and pinctrl block to devicetree so the btmrvl driver can correctly
configure the wakeup interrupt.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
The Veyron Mighty Chromebook (rk3288 based board) is missing the wake
configuration for Bluetooth. Without this change, the wake irq was not
configurable and wake on Bluetooth was broken.

I verified this change with additional changes in the Bluetooth driver
(the series is at https://patchwork.kernel.org/cover/11599101/). The
driver changes are not necessary for this dts change and shouldn't block
it.


Changes in v2:
- Move sdio0 ahead of sdmmc

 arch/arm/boot/dts/rk3288-veyron-jaq.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
index 171ba6185b6d39..c15d6865f5a390 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
@@ -44,6 +44,21 @@ regulator-state-mem {
 	};
 };
 
+&sdio0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	btmrvl: btmrvl@2 {
+		compatible = "marvell,sd8897-bt";
+		reg = <2>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD7 IRQ_TYPE_LEVEL_LOW>;
+		marvell,wakeup-pin = /bits/ 16 <13>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_l>;
+	};
+};
+
 &sdmmc {
 	disable-wp;
 	pinctrl-names = "default";
-- 
2.27.0.290.gba653c62da-goog

