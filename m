Return-Path: <SRS0=2Mri=2U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3588EC3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 16:45:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AA0820718
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 16:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWbR+Aor"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfL3QpN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Dec 2019 11:45:13 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40155 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfL3QpN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Dec 2019 11:45:13 -0500
Received: by mail-wr1-f66.google.com with SMTP id c14so33160183wrn.7
        for <devicetree@vger.kernel.org>; Mon, 30 Dec 2019 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q8etfoWT2jfX9dgh2kmChcjY+MdQxMMNc40Nuy8WnTw=;
        b=xWbR+AordFuc2u2uhpGUpRjkGvXmnY1PrIITONCIHgZu1aOftTzJ7zl4T7qQz1l+4v
         QeMzq5niJI1Zs0/PzH4O33klMIT40WAc8sZptVmLhZwsutb8HIlDiKjMIvpvr9lyOIS5
         VojZNC4T+pFMpT25Sge/EKqbSBiAO8PyWpHc9+/nVx1u43aW0lkEIMUqBTLjuCspdkIU
         3XlwM1rhrGEn4Y9CVrv6pVnK+bO0kRKnb4QqGoXPd/8/FqYfNFPLcLVEG7Tik94p7fEd
         gTnNfu0uv99D7R0dgi6kVJx7/Rs16a8Hp7wHBNnt/Jd4I9EedLGBwASarvVSHqRuOwte
         rdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q8etfoWT2jfX9dgh2kmChcjY+MdQxMMNc40Nuy8WnTw=;
        b=QfpaZoHSfGiLh3Z7l8IzJdhKmfwpRdx9GV6pkxOvU10A05jAaQIuA03MYZjNkn3GU1
         vjD60rrkWh+NFBMH5bCzEfXtCWL52kjmrAFa8Ul0fvrSHsyyhzOmr0D7anakwJaAMcCQ
         5R01b2BcqkNXI1nP54dpYyk92jPuFjsjUx/VxEJwgaXX0+1bFlRFFMheSYYFXa+WzJtZ
         FmX624mOMLOG9jyAl8E6XFPaGt61Z/ZWdAZEZigULwZ8TO9LxuenSFjR+7cQSfxMRXp+
         0VCINdFN4hHaaAiPZdPO9tIBMHV/dHmxzdC9p47wG10Tn5MnbXuCqsPS3i0bFA7gMKS/
         ywvw==
X-Gm-Message-State: APjAAAWk9bCVOY1Z8xAGmAM6+ziC8RjxKOp0Nl1O7TcUhMsXBfJpDUNV
        fOHhvm5tFxx594aU+QvVU0Fs640mjJXkCA==
X-Google-Smtp-Source: APXvYqxkPXqtQkDMbYIZtRNcBiK8Q5WHw6zsX6XE0LPeA8O9OqNaU+QY9hCAC1d8XAL2xbkwRxrilg==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr67217505wrr.98.1577724311480;
        Mon, 30 Dec 2019 08:45:11 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id p18sm21508071wmg.4.2019.12.30.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:45:11 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 15/15] Update MAINTAINERS to add reviewer for CoreSight.
Date:   Mon, 30 Dec 2019 16:45:08 +0000
Message-Id: <20191230164508.28432-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Added myself as a designated reviewer for the CoreSight infrastructure
at the request of Mathieu Poirier.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77f5d28fa84b..3051a3765955 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1642,6 +1642,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

