Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8093BC2D0CF
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 13:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52F812073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 13:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NC56cI6/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfLWNSK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 08:18:10 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43250 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfLWNSK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Dec 2019 08:18:10 -0500
Received: by mail-pg1-f194.google.com with SMTP id k197so8809148pga.10
        for <devicetree@vger.kernel.org>; Mon, 23 Dec 2019 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YI1v+z8jxNo/h/j7idm/0EKSnx3iifQZL/1wkb63EVY=;
        b=NC56cI6/Z/H7oTnHAnJ09gyexnPHn4BiJOYPYq5aP1muAWM1ORzqA8pzUEOnRw8nYp
         epKje1I/XIJaj3u6zbTm0w5yn0zlcjh8hsY25dOubLMowIQeW/O4dHnate74cyV/EuHs
         y/9WSbvBsEDXIbs3cLMoD2zHjg1WNY+/hIkXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YI1v+z8jxNo/h/j7idm/0EKSnx3iifQZL/1wkb63EVY=;
        b=rEXpGqiQ/eKH7MLdpiElPcvW/wsL9E6ve6oVZ7GVB+8EYymTFcU//rh6x2D82UTfRa
         ZyP4uHi3jr+9U2ci6CJDMsSO5udeC4NV840CJFL83dPOUnPdm6RtCP7K6LMu7Xikb2FH
         aJiG0PPT+X9/DwF/2/eKzM/vv1Fi/3Iiuw7RHX37ejjMSRHhEkxxx/+im7HtmK6wB9et
         TrOEM/FwrRtxCjgmAQLB/ltaDa+I9S6xnMyDwF10ENiAhG8nlgVuJnJrf6rAdXEUNIUK
         jZXi9WknVOwoz0T5m0d66QiufW6oUWuZ6IC9N0T+0c9Khtrtex6Vo0KdwDJTHwyPlBHi
         V8Bg==
X-Gm-Message-State: APjAAAUcJQYXc8KFbbBN1gdEAVlEcESNVYBUs1UZKWLJd1C28xDfme/7
        Py2t6cObNek+fhVLz/Gz0eXEEA==
X-Google-Smtp-Source: APXvYqyGVdeczBs5yRxyBCpYz4pqjAoDs2yBT7CWuKxBsDQCMyszUoKgfbCh2g1PZKtcKNMYizSH2g==
X-Received: by 2002:a63:3245:: with SMTP id y66mr31152112pgy.234.1577107088874;
        Mon, 23 Dec 2019 05:18:08 -0800 (PST)
Received: from localhost.localdomain ([49.206.201.226])
        by smtp.gmail.com with ESMTPSA id h16sm24731770pfn.85.2019.12.23.05.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 05:18:07 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH] ARM: dts: imx6q-icore-mipi: Use 1.5 version of i.Core MX6DL
Date:   Mon, 23 Dec 2019 18:47:50 +0530
Message-Id: <20191223131750.2589-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The EDIMM STARTER KIT i.Core 1.5 MIPI Evaluation is based on
the 1.5 version of the i.Core MX6 cpu module. The 1.5 version
differs from the original one for a few details, including the
ethernet PHY interface clock provider.

With this commit, the ethernet interface works properly:
SMSC LAN8710/LAN8720 2188000.ethernet-1:00: attached PHY driver

While before using the 1.5 version, ethernet failed to startup
do to un-clocked PHY interface:
fec 2188000.ethernet eth0: could not attach to PHY

Similar fix has merged for i.Core MX6Q but missed to update for DL.

Fixes: a8039f2dd089 ("ARM: dts: imx6dl: Add Engicam i.CoreM6 1.5 Quad/Dual MIPI starter kit support")
Cc: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/imx6dl-icore-mipi.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl-icore-mipi.dts b/arch/arm/boot/dts/imx6dl-icore-mipi.dts
index e43bccb78ab2..d8f3821a0ffd 100644
--- a/arch/arm/boot/dts/imx6dl-icore-mipi.dts
+++ b/arch/arm/boot/dts/imx6dl-icore-mipi.dts
@@ -8,7 +8,7 @@
 /dts-v1/;
 
 #include "imx6dl.dtsi"
-#include "imx6qdl-icore.dtsi"
+#include "imx6qdl-icore-1.5.dtsi"
 
 / {
 	model = "Engicam i.CoreM6 DualLite/Solo MIPI Starter Kit";
-- 
2.18.0.321.gffc6fa0e3

