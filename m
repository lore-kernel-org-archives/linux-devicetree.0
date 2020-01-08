Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BE9C00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57E932067D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/a717vh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgAHEUt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 23:20:49 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170]:39141 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgAHEUt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 23:20:49 -0500
Received: by mail-pl1-f170.google.com with SMTP id g6so573841plp.6
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 20:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8i3jv2NcKPJav5JSnI7n2xF76BQZT2zWeKXSSkvhBZs=;
        b=H/a717vhcYdvgT5UJJEdaEDhfGrJ1j0HoL7+znfKXxb1Y70kiaalEnKwTOftppJqSI
         1rMpWLSrGf+L+vwFltOJAWRQQ8V19AAuQS/hA1XYU/M6qHJC44Xu0X/km4PC8/gFrt4m
         Q/d4OV1lPPcYQnf/mT/nhAU2ATiZy4PuxeMBrmsb9r8NVto8YVHZr1l1KKnLpIR0K5Qi
         LXGTXmomlp2NTiyLWQ7JhRKhQ2iVdAi8i/NFE8ezioC0cVS14BvG/FDurgl4cAu+s/Qk
         QMnA/efNS1Zwt1rW+ZbiOw2iP94KQOPzk1ETbHRF4LYvziTEAIwXRzdC2VKi2j1VTdoH
         yDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8i3jv2NcKPJav5JSnI7n2xF76BQZT2zWeKXSSkvhBZs=;
        b=own2Mc3IoWoLNq0WjewF9LmnPzQSkbRLpapOKoANfjM0qgFeAO3e9eQmj6reQ8VH7+
         6kG4q3BnGhETkvgbAG9qYkyIkUiVdM+ibUW8UPWq3HBrGrtsIKt5ykfXKbE/lESRcnbA
         AAPGsI0p1d+oyTdxXpnDZxUGHH70XrN6DicVshmzL8Poy4zb4Udpihzny8vTFWuM3pE6
         NEKEcTs9F/dItW8DI8esO+ZGoXEeqz+zmDgiSqTsN57EFsmQU7UiPLqgjYXHFpMmevyO
         fXJniBZuT8Zaxe0iu8n+itDzzMmeZzeaUMG/Pa1xDO4w3aw7f9HQy4rD12DJhRKWQ65r
         Q7MA==
X-Gm-Message-State: APjAAAUICyE0JZdf48VJIoFRqIdLUVfEL2eZchQDu7KeALnWjXOlaoLA
        u9W6Dk4OvZG2hkFje4E7imQ=
X-Google-Smtp-Source: APXvYqx/IAJeMafAjvWogVFDy3hU75s9q/3GXL6uTncLxHrzyp5S8XMfkOSmZjkMJCjL7Zk+tPqS4Q==
X-Received: by 2002:a17:902:6501:: with SMTP id b1mr3415381plk.121.1578457248856;
        Tue, 07 Jan 2020 20:20:48 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id p12sm1133478pjo.5.2020.01.07.20.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 20:20:48 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: a64: add dtsi with CPU operating points
Date:   Tue,  7 Jan 2020 20:20:17 -0800
Message-Id: <20200108042018.571251-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108042018.571251-1-anarsoul@gmail.com>
References: <20200108042018.571251-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add operating points for A64. These are taken from FEX file from BSP
for A64.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../dts/allwinner/sun50i-a64-cpu-opp.dtsi     | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi
new file mode 100644
index 000000000000..578c37490d90
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vasily khoruzhick <anarsoul@gmail.com>
+ */
+
+/ {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-648000000 {
+			opp-hz = /bits/ 64 <648000000>;
+			opp-microvolt = <1040000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1100000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-912000000 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-microvolt = <1120000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-microvolt = <1160000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1200000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <1240000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1104000000 {
+			opp-hz = /bits/ 64 <1104000000>;
+			opp-microvolt = <1260000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-microvolt = <1300000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
-- 
2.24.1

