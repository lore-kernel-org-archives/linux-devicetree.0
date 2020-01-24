Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07746C32771
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 23:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D945D2072C
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 23:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387517AbgAXXUi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 18:20:38 -0500
Received: from mailoutvs58.siol.net ([185.57.226.249]:37414 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387510AbgAXXUh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 18:20:37 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 62CEA5228CC;
        Sat, 25 Jan 2020 00:20:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id alWAOP-it7zU; Sat, 25 Jan 2020 00:20:35 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 1F66D522899;
        Sat, 25 Jan 2020 00:20:35 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id C0F195228CF;
        Sat, 25 Jan 2020 00:20:32 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 4/8] arm64: dts: allwinner: a64: Fix display clock register range
Date:   Sat, 25 Jan 2020 00:20:10 +0100
Message-Id: <20200124232014.574989-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Register range of display clocks is 0x10000, as it can be seen from
DE2 documentation.

Fix it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
index 862b47dc9dc9..baa6f08dc108 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -264,7 +264,7 @@ bus@1000000 {
=20
 			display_clocks: clock@0 {
 				compatible =3D "allwinner,sun50i-a64-de2-clk";
-				reg =3D <0x0 0x100000>;
+				reg =3D <0x0 0x10000>;
 				clocks =3D <&ccu CLK_BUS_DE>,
 					 <&ccu CLK_DE>;
 				clock-names =3D "bus",
--=20
2.25.0

