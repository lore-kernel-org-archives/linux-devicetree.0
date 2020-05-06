Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71017C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 17:49:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BA0821582
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 17:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2C97RMA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgEFRtG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 13:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbgEFRtG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 13:49:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1932C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 10:49:04 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s8so3234521wrt.9
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=srtH8bskiQrF0mpCWsWnCxht+uD1HNatLGnWm/k2SmY=;
        b=I2C97RMATzMD8KLXLxy2rBCkuviQnKAhn6fSB5//HbcMzxaD2e96LoiXeaJMbjd4Ze
         z3WcT3MOAG0FWtphVfkRUz4MDwS4w8jZk/K8eiGZYojVuasbWBc8vXv9OxMaCppZWP9l
         aWrB+a240sIDDHYIVj1I9q3PMCKXYFrWKm60r4bL3HLGVOacpQr+qyWnvtA3Xe7rAs2j
         XPq3PAkTrdfxBw10Lnjd7DusLULQgghR+ZFTzzdSg/6CiQNXdBf8a/SbCMLaI5k7AIA5
         GgQjByqUdwYyt4u4huOJAkSsZLu+mCcXzbPgALmqAMqK/TZiOeub5XrUCImv67rN0CaB
         Cnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=srtH8bskiQrF0mpCWsWnCxht+uD1HNatLGnWm/k2SmY=;
        b=dgRgh6qRqIG9iWuzwPdsxnZZo5OPcbMQ4UYU8PfdNGFiUTwWHECWNVBFz0dwLQ6Lu1
         HZGzIY65sxN5hpVjT4JWPpP8cE9eRl+eeYzBVFiifdOHgcR2B2cyqIeI84Mpshw0jiUd
         R1sF5Uiv6PfepbD2XgNMgQ5YhjZHT8LFiueczew0IGoSh/n3fEN9j4IQ1M7FlsRm6whL
         rTsWxS9CdVG3VncbDv6EL5XW1C25EWeHSqFemI11cND2XEZsVuVVNlXa4K8DQQ2hLHuC
         q4Iyemw10ZVQbSusvlbZ675RnxDF6qWjuQuc4eVd4xAhdk7synNxwYtvCDEsxUpmcpuT
         TTMA==
X-Gm-Message-State: AGi0PubQBYsUntd3pu23USCcCvqQM1//MKRKHAeHA5yvcLXW5KuhU8km
        +JMBHTJB1zGwyvsn/haWi8xf5Q==
X-Google-Smtp-Source: APiQypJzrOxOnaeMZj2hShOBa2tNuW6vZBCQSqhwPsIO3GIRxw5ow3FX2cybrUz8TcJ9VkWpKvsviQ==
X-Received: by 2002:a5d:498b:: with SMTP id r11mr10685245wrq.368.1588787343455;
        Wed, 06 May 2020 10:49:03 -0700 (PDT)
Received: from lmecxl0524.home (2a01cb058702ff00bc4b798f4f30d41e.ipv6.abo.wanadoo.fr. [2a01:cb05:8702:ff00:bc4b:798f:4f30:d41e])
        by smtp.gmail.com with ESMTPSA id n6sm1997992wrt.58.2020.05.06.10.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 10:49:02 -0700 (PDT)
From:   Etienne Carriere <etienne.carriere@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org, alexandre.torgue@st.com,
        mcoquelin.stm32@gmail.com, robh+dt@kernel.org,
        Etienne Carriere <etienne.carriere@st.com>
Subject: [PATCH] ARM: dts: stm32: bump PSCI to version 1.0 on stm32mp15x
Date:   Wed,  6 May 2020 19:48:40 +0200
Message-Id: <20200506174840.19856-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Declare PSCI v1.0 support instead of v0.1 as the former is supported
by the PSCI firmware stacks stm32mp15x relies on.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3ea05ba48215..ebceead1b120 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -24,10 +24,8 @@
 	};
 
 	psci {
-		compatible = "arm,psci";
+		compatible = "arm,psci-1.0";
 		method = "smc";
-		cpu_off = <0x84000002>;
-		cpu_on = <0x84000003>;
 	};
 
 	intc: interrupt-controller@a0021000 {
-- 
2.17.1

