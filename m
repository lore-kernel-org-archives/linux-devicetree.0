Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F92C33CA1
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 13:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FFB62077B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 13:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="QJIiAeT3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731220AbgAINjV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 08:39:21 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54351 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbgAINjV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 08:39:21 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so2952617wmj.4
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iSLBbyZMom5Gh2asx6vSf9spPxO1dtGNpvUOI6kKFOE=;
        b=QJIiAeT3487JndkFw1jxkB1fCvzWWv1O/7PNOPDhXs5owXnctuTcuHcb1znb8OtuO9
         Yu4bJeEkL3whooM4CuY9LnTpi+PR2IOFXUY1iqV0UG2KmRoaITgkSSog+eyBrDp1yh9N
         Va/CFMOSakJqAkXehUGqRdpGniZFLlTrYVtGhWmq7YHBBMcsrEJHkXfK0PzXXtY4mEr/
         iQk1hg9dVrsTPRwOAKBoBUQGre82zVyKrNN3a0xplz322eKPr+GuXIlXUUoyFDInhKQI
         5MVkN5kYQJrZC0Z86vsy6hfZC48nhM5DP0DPS0kRcBxmqWUURi0P0ocbfA0N0ZaN4hZ8
         kyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=iSLBbyZMom5Gh2asx6vSf9spPxO1dtGNpvUOI6kKFOE=;
        b=jdFTH9Yu56eGyenbRU/nVngxuVNSMkZ/WHqhmENwoaZDo3EBPOf32UWdsm3zYVfSAn
         JcrdAurDB4xPN4z0kE7AscDP6rBscMBqWcD7nUvYsBPylLdt2zdrAGjxBQ779j9x4q0f
         s8Ilo+UszJy8EtajuxEdIbmFWnN/sidPZ5mqWlsn8VFAP2zrXp8pFQQMIVn/m16YBj5i
         5IoFx1YoO9JMV1lt5u5palKyXZ8Ho9OH/avC1IbnWLtglmZAwYXVG0WZ5POBk51obcI8
         2Cp4T/w/6osYeUU872ICSb365Jsjl3QIFOl6n9IAFlyOo26SMXZpowHVroigjz6jS3lB
         eI7g==
X-Gm-Message-State: APjAAAU5FGrD6ZHjjn5Ul7YEfPWaN0q3xEPslwZQf99QdsIeSqJZuV0Y
        u/pshVaL5l2j8jOGmuwn6Z5f0Q==
X-Google-Smtp-Source: APXvYqwGbw1JXeoKM7gwrs21nIc0OoNINaE7UVW4HZCYixEZBd/0C48GvM2p3JS33LvusyNKo9Tkag==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr5072174wmd.96.1578577159200;
        Thu, 09 Jan 2020 05:39:19 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id q68sm3136809wme.14.2020.01.09.05.39.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 05:39:18 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Harini Katakam <harini.katakam@xilinx.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] arm64: zynqmp: Fix address for tca6416_u97 chip on zcu104
Date:   Thu,  9 Jan 2020 14:39:10 +0100
Message-Id: <c542d6e305010dd08ff1d434de6f9d1996a6b0d6.1578577147.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1578577147.git.michal.simek@xilinx.com>
References: <cover.1578577147.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

I2c address is not 0x21 but 0x20.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index 2d71b4431cce..7a4614e3f5fa 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -118,9 +118,9 @@ i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
-			tca6416_u97: gpio@21 {
+			tca6416_u97: gpio@20 {
 				compatible = "ti,tca6416";
-				reg = <0x21>;
+				reg = <0x20>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				/*
-- 
2.24.0

