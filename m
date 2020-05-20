Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691A3C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3956520758
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="hPUb+38Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgETLZt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 07:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgETLZs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 07:25:48 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15206C061A0E
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:47 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r3so853115wrn.11
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
        b=hPUb+38ZdEA5j+6g5LHfDwWL5eh8efRY1B/ixdvGsNR4XuXCt7sgEl2KeRlJ01EfHE
         EwHOGNPCwWkPsPu0H2xE7XhCrvUD+VrSuLITBNLMrGEkQ7QcY0s+80+VPg1swVLHURWP
         xHwAimb0cSrRccyWhXbCLPH8OB51GJEHSGjSJ1ZGPPkIvhUxXcjhQQCPpR2FZ6iw+FDE
         pMyarLDzJYC1+xU12NnxQm+UFb9ClIV1caF73rLdPiOEs14KFs7zfNQ/MYOBYO6BxrGw
         sw8ZuuR4q30AfOxECvB4qm/LO3wwL5t1niEhB547XDw+i4/coyqEUjEheZS3hEKIEu87
         psOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
        b=Bh+wmN15MDLcXwQO10m1x0A6vzs6nh1GCy2hmtS/4jJunun4/6+n4PBKF6iUmYHci5
         3rGQPut7LrUb5NT+Jv7U58T5Qy3Pf0nDdenreOwCfCVq7eyqbzZGd0hPrqrqPD2B//da
         WFFcRoktrFruj9R0oYC1IWmtUunjH3KqB9uab2V6SP6yk65JeIhjgB4aFQ1CMpFyt8Ui
         eqMKeIJyybJ1/MlGAHYwl5JV+FCMQqr8VwXIqSap0MUHazUQ+wsejyZ8SZfcazpswTVW
         tlVcpo8yIFvU3UDdwJkRV9rT8cBnGgdcVSsPkOgNaZ3xpwHVF/8aQZ3AnKgHGw/RjkP3
         F59A==
X-Gm-Message-State: AOAM532GdpRhlISeOYHdox8RlPHMvq0I76cP2TT16QIpOJL2XZf1GAPF
        DSYyoFIDUpTRNGG2NzBeuVCi7w==
X-Google-Smtp-Source: ABdhPJz8mA5+qKq8TXk4kO+lD9LIsszxlWW/zHrrIHr4SjCq6c8Fk/Cwl+qGKKL/YPBN3XFy4kA7Tg==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr3877082wru.308.1589973945873;
        Wed, 20 May 2020 04:25:45 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 04:25:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 09/11] ARM64: dts: mediatek: add an alias for ethernet0 for pumpkin boards
Date:   Wed, 20 May 2020 13:25:21 +0200
Message-Id: <20200520112523.30995-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add the ethernet0 alias for ethernet so that u-boot can find this node
and fill in the MAC address.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index a31093d7142b..97d9b000c37e 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -9,6 +9,7 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &ethernet;
 	};
 
 	chosen {
-- 
2.25.0

