Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909F2C00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59C602067D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxeFKl1K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgAHEUr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 23:20:47 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39610 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgAHEUq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 23:20:46 -0500
Received: by mail-pg1-f196.google.com with SMTP id b137so906003pga.6
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 20:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R6pjEykRf/M8VLql5CxvJKoh3iCEvbT8uEFDsuWLP24=;
        b=sxeFKl1KZffKaCvCNbFW1PCiFNWl/lPjmBn/yiaEbVyjJdHwXdlUPCM4WOG6LUmg2I
         Z5R88VjBdn5l23faiyAlSECRsHW6T+Q0zeWOUFJwn2SDzKpwKU1BOj7MxKROVffOX2rP
         7zMBb21aFgt0HVJOYcxFE+2aXNDtzUfR3BJpMOmi2EDRLejdydrYwpA2Ajygg/dp8J7f
         WF1f98RRseokJSMl+RVD2c4it+8Xv7Ur5AfL/wXJlAShO2papwGg37B/K25S6t/4HFiI
         d9vaQPCwKlbJXEgJOeJgBjMHwjS4WJIf9buxRJkv+nYyaP/mnvzRGvRnCagLlLAccwKb
         AkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R6pjEykRf/M8VLql5CxvJKoh3iCEvbT8uEFDsuWLP24=;
        b=B50svf/jjNAyQddU8QIpfIDvNpHveMmLmsretG2vPESGJjXEJTSaYsN9UhbA/YwWA+
         +sHbHUBytq5jSFRSXqMbl7uzMSlyxqarsCUKeHi5NITxjbTBhBtdr+iY72rPsS8IUKtC
         2+WtvbJ3TPCHhl/CPc98pxTIDkyemJ9MFH1LYaSUbmOl//ZJGmITGlea2/tnMONlH/2/
         j7IBs4q/x57xVDpzCqormyt1JN3v0okbEh1JMTT1K6cHzRplCdOeEsMTExMtICoXyN8/
         srzmkj8WU0i3CEOpEt2hYI7UATbQcKGmBcXc8GnttyDEm0Kr6JOAo6JjV8OtqijOP2FP
         kqLw==
X-Gm-Message-State: APjAAAXGEXTPdJNZTBY+XjWdlo6hep3j3vbQP5mg85iSUWb1dTyMg6sk
        LbmhNEX1WcpBAZQzg0y4rw8=
X-Google-Smtp-Source: APXvYqz6GiaKZplValKk2M5TCA01KEHjZ/JzrVxvjD/jCcq96NDyr3JNRH4/crq80Mg0AXPYcDPpxQ==
X-Received: by 2002:a63:1f0c:: with SMTP id f12mr3288501pgf.247.1578457246159;
        Tue, 07 Jan 2020 20:20:46 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id p12sm1133478pjo.5.2020.01.07.20.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 20:20:45 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 0/4] arm64: allwinner: a64: Enable DVFS on A64
Date:   Tue,  7 Jan 2020 20:20:14 -0800
Message-Id: <20200108042018.571251-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series introduces new DTSI with operating points for A64,
adds cooling maps and thermal tripping points and enables DVFS
on all the supported A64-based boards

v2: - drop two commits that were merged
    - mention where tripping points and OPP were taken from
    - add new line after each node in OPP table
    - split adding CPU clock and OPP into separate commits
    - put operating points into their own dtsi

Vasily Khoruzhick (4):
  arm64: dts: allwinner: a64: add CPU clock to CPU0-3 nodes
  arm64: dts: allwinner: a64: add cooling maps and thermal tripping
    points
  arm64: dts: allwinner: a64: add dtsi with CPU operating points
  arm64: dts: allwinner: a64: enable DVFS

 .../allwinner/sun50i-a64-amarula-relic.dts    | 17 +++++
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 17 +++++
 .../dts/allwinner/sun50i-a64-cpu-opp.dtsi     | 75 +++++++++++++++++++
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 17 +++++
 .../dts/allwinner/sun50i-a64-olinuxino.dts    | 17 +++++
 .../dts/allwinner/sun50i-a64-orangepi-win.dts | 17 +++++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 17 +++++
 .../dts/allwinner/sun50i-a64-pinebook.dts     | 17 +++++
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi | 17 +++++
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts | 17 +++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 52 +++++++++++++
 11 files changed, 280 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi

-- 
2.24.1

