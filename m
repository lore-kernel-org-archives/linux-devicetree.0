Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70C4C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 13:20:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BBD620818
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 13:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="gM8MrR8f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfKLNUS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 08:20:18 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43188 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfKLNUR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 08:20:17 -0500
Received: by mail-lf1-f66.google.com with SMTP id q5so6793574lfo.10
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 05:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U/A2f9kHIFOCYbqEWyI5d4hToF+Uq4/YnGy8bo4uWSk=;
        b=gM8MrR8fpyn4D3f/S9EA8B8+euhGtgB+lGz82qjsDCTe1bJ1kiHnsQYFbiW/5akGyH
         0mp2q9cT8A/OkZQgMiiVMsZSMYP7lzx+i0+PscS5YENMZjpxjMRfriZdcUEGItBE4t1y
         tuIfz4VW5ZZL40S/NoLsb+KAqWW86ZFGdIV1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U/A2f9kHIFOCYbqEWyI5d4hToF+Uq4/YnGy8bo4uWSk=;
        b=fX/drt6ZlLHpcPiPVeNzwBsDzyv0p6W5pYg7MrtNgGjvB9a1siySNX/ZFzhvWrmwZC
         aA0B+Wee5P32ytF0+faMnb6f/mMcT86P9BXSYxpn+ByYIMKLzoVgw9ZFxbxn0nvYoVh8
         66sgl4YnV7RFMaxycfM/fz76aLE1BLXjGXIAQlh+v+IQPnyJM9wvbzQiJFpvAhxFAsTX
         hgQbz9WPK+Lf5o7VruG8MgOYIc7xs98/NIig464mT+C0TkWalRuGTwP5NhoHMzZ+vlwt
         XX4A+pS5OelZfGZ/eNK1LAa74vSfj8zw0QyD+SzAU7MpRaQNspZR0pvOQea2h9Tu6aI7
         9RIQ==
X-Gm-Message-State: APjAAAXiiwpk+FyKkTmZkPXQzJnUVuFlNpF6utCAG0eKohSN4VqNJW57
        f307MVVzlJs0lgxH4Tem1nyz4w==
X-Google-Smtp-Source: APXvYqz/sFZqp2pxbjkEJ36q/AU0dl23QXcsNzmg6b9X5nHorefiUNSVmG7PoCczzVrEgRSF7p9rHw==
X-Received: by 2002:a19:c514:: with SMTP id w20mr19905250lfe.143.1573564815900;
        Tue, 12 Nov 2019 05:20:15 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id f20sm869050lfc.75.2019.11.12.05.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 05:20:15 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Vladimir Oltean <olteanv@gmail.com>, Marc Zyngier <maz@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: ls1021a: add node describing external interrupt lines
Date:   Tue, 12 Nov 2019 14:20:09 +0100
Message-Id: <20191112132010.18274-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191112132010.18274-1-linux@rasmusvillemoes.dk>
References: <20191112132010.18274-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a node describing the six external interrupt lines IRQ0-IRQ5
with configurable polarity.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/arm/boot/dts/ls1021a.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 2f6977ada447..0855b1fe98e0 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -216,6 +216,25 @@
 			compatible = "fsl,ls1021a-scfg", "syscon";
 			reg = <0x0 0x1570000 0x0 0x10000>;
 			big-endian;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x1570000 0x10000>;
+
+			extirq: interrupt-controller@1ac {
+				compatible = "fsl,ls1021a-extirq";
+				#interrupt-cells = <2>;
+				#address-cells = <0>;
+				interrupt-controller;
+				reg = <0x1ac 4>;
+				interrupt-map =
+					<0 0 &gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+					<1 0 &gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+					<2 0 &gic GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+					<3 0 &gic GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+					<4 0 &gic GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+					<5 0 &gic GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-map-mask = <0xffffffff 0x0>;
+			};
 		};
 
 		crypto: crypto@1700000 {
-- 
2.23.0

