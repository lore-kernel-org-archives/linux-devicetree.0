Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B278C43141
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 05:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 699672072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 05:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574402152;
	bh=TH3g2xK0o/g45rMbWe6XW4bUEmbjAzv2YZ7x/00C14s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=T8mlYjb33qwtPGz4Yfh+BxJhp/YEYjIEDscJQCz2Dtd1paQ8zMy09sqCzpbDVTlJ1
	 GbLrIqyzrBJYKkxJsZX5F7zHoGw+xpqqVVCU4STaGy3lWRB6NffC9nYJdmuLtdRgOf
	 dQN0DfrUpaEFhzyc8RHwOCNW4Z/0ShA6skN1Tunc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbfKVFzu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 00:55:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:33456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728939AbfKVFzu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 22 Nov 2019 00:55:50 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D90282068F;
        Fri, 22 Nov 2019 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574402149;
        bh=TH3g2xK0o/g45rMbWe6XW4bUEmbjAzv2YZ7x/00C14s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SI8zToOpgJYZwX6j4sKIhDpaXmvjWBLNRvgljt97jFU+fTmGzzbkrIhBsjMBwJuEL
         MDeYbEaBT2USJJE4nCYOgIDljffz+UufNQFArzsUxY7A7WgMYiqqKyrfSespV5Ag+7
         TDoTVpHn15LSJBLFdGtgvPbPBaYSfdTzFDbU4MiQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>,
        Marco Franchi <marco.franchi@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 005/127] ARM: dts: imx53-voipac-dmm-668: Fix memory node duplication
Date:   Fri, 22 Nov 2019 00:53:43 -0500
Message-Id: <20191122055544.3299-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122055544.3299-1-sashal@kernel.org>
References: <20191122055544.3299-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

[ Upstream commit 998a84c27a7f3f9133d32af64e19c05cec161a1a ]

imx53-voipac-dmm-668 has two memory nodes, but the correct representation
would be to use a single one with two reg entries - one for each RAM chip
select, so fix it accordingly.

Reported-by: Marco Franchi <marco.franchi@nxp.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
index df8dafe2564dd..2297ed90ee895 100644
--- a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
+++ b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
@@ -17,12 +17,8 @@
 
 	memory@70000000 {
 		device_type = "memory";
-		reg = <0x70000000 0x20000000>;
-	};
-
-	memory@b0000000 {
-		device_type = "memory";
-		reg = <0xb0000000 0x20000000>;
+		reg = <0x70000000 0x20000000>,
+		      <0xb0000000 0x20000000>;
 	};
 
 	regulators {
-- 
2.20.1

