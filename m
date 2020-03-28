Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8081AC43331
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 09:16:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5205120716
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 09:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMpe31hx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgC1JQ4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 05:16:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38633 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgC1JQ4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 05:16:56 -0400
Received: by mail-pg1-f196.google.com with SMTP id x7so5893630pgh.5
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2020 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dbt64BOHdGBEqZICW7xFrVv85mRzXdLFYOBZsB2adHc=;
        b=QMpe31hxR6ssU1HeoeZaHjFlpVz/ckdZelGkF46XlV3hdtUy/KMe3YJ9X0jbMwy5CX
         ru49qZasvJXvMFQvVty1rttigU5qxAZFFaykPJEu8BsDFfL63yuF431z0Lx2tyUTSpcC
         TPOesZM3CBISd8Hvco3LSRT3bedlBvxwUeJMl1LllOEbahabbk6n8yMPxqp5EJVR2U/j
         6JTTEYBEQdBIgzUeUX75PwuH9TpKPQS+emDDGbhWgQQR0YHW0auhcyhFVW1gusXmpITR
         GbIsnt5CMH8dVs+frtgx7VKoWMrSkN0RgtwJEkndw/nrK/OpHvGqLQJxpANuN7NDQvsQ
         OF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dbt64BOHdGBEqZICW7xFrVv85mRzXdLFYOBZsB2adHc=;
        b=OwbxZFHdFpfoU9l8Tu4bt8CnLYiHwpzw/3GIU6EfzMC9OHtDEspUyPPpTn3FAPH/c/
         a15nI0esfb0NQj4NXfHZiuiDsmy75ME5/nYeYqG0wxivFMnT+hK0s/E5FVGeAkjuT+AE
         n3rXDmR9AyU1qmKLixEWnyUIkHs/pmv+TU+LFjxN2S4t1ENDKaXXL4kPRf92YaW2x+p1
         j4KXq6e2Er7gMWNG5pvfEGJm1nVtAdTS2Tua/Iv6a/9UA0aJVk8ZnwbrOMLnhEHKSIiP
         sbd+lwlMquTiKifr1bDqkuYycjcRPM7HB68LbC3HVxUqK3CGXOwAFcm8AkvjePKUilZ6
         5bHg==
X-Gm-Message-State: ANhLgQ0Eqtc3BVJz/ytNYpiWU4kyNxgMNJRNjL/jfo86b3UeeT32SUYg
        XwxZgH9Io1riTKTEdkJHKcUBmYP0y4nfOQ==
X-Google-Smtp-Source: ADFU+vv47AMVwTFPLDTJTzrIVuokO5+kgV9NngI7TCqKN2EMx0eiYE7QkqrmD4xpiBL9zEJPDInnkw==
X-Received: by 2002:a63:1c4d:: with SMTP id c13mr3447030pgm.4.1585387014579;
        Sat, 28 Mar 2020 02:16:54 -0700 (PDT)
Received: from localhost.localdomain (li2017-195.members.linode.com. [172.105.124.195])
        by smtp.gmail.com with ESMTPSA id f129sm5796176pfb.190.2020.03.28.02.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 02:16:53 -0700 (PDT)
From:   Qiang Yu <yuq825@gmail.com>
To:     devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, lima@lists.freedesktop.org,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, Qiang Yu <yuq825@gmail.com>
Subject: [PATCH] ARM: dts: sun8i-h3: add opp table for mali gpu
Date:   Sat, 28 Mar 2020 17:16:32 +0800
Message-Id: <20200328091632.12837-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

OPP table vaule is get from orangepi lichee linux-3.4
kernel driver.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 20217e2ca4d3..53ef9a18e953 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -128,6 +128,23 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-120000000 {
+			opp-hz = /bits/ 64 <120000000>;
+		};
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+		};
+		opp-432000000 {
+			opp-hz = /bits/ 64 <432000000>;
+		};
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+		};
+	};
+
 	soc {
 		deinterlace: deinterlace@1400000 {
 			compatible = "allwinner,sun8i-h3-deinterlace";
@@ -205,8 +222,7 @@
 			clock-names = "bus", "core";
 			resets = <&ccu RST_BUS_GPU>;
 
-			assigned-clocks = <&ccu CLK_GPU>;
-			assigned-clock-rates = <384000000>;
+			operating-points-v2 = <&gpu_opp_table>;
 		};
 
 		ths: thermal-sensor@1c25000 {
-- 
2.17.1

