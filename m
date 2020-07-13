Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C9DC433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 07:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8B1720720
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 07:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="nmVyA76h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgGMHrE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 03:47:04 -0400
Received: from gproxy2-pub.mail.unifiedlayer.com ([69.89.18.3]:44020 "EHLO
        gproxy2-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729174AbgGMHrD (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 03:47:03 -0400
X-Greylist: delayed 1383 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Jul 2020 03:47:03 EDT
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
        by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 55FA81E0A8B
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 01:23:57 -0600 (MDT)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id usobjQbaJWYdhusodjFfXs; Mon, 13 Jul 2020 01:23:57 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=FvcrAVjq c=1 sm=1 tr=0
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=oz0wMknONp8A:10:endurance_base64_authed_username_1 a=vU9dKmh3AAAA:8
 a=JQgJguoMx5vhFMeBTaQA:9 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Wtgv+PX9fiZtuMbzwvjH1EMmtWQARKfxtUNj1n2nazU=; b=nmVyA76hn9LjwKAriLP09L2etr
        ElmwurJglwObA8GYEFV1diQHDMuVYd2S5LbC4/KzRiYaAjSBJFB7aWd44ei7PUjYW/MDJjnu+i3iV
        19HFQbXfV855akV3ase4NZ2UQZwAGJ1T1dKZmuMRhYDfjbOJueQQYgopcieieFc6pzwLW/qQwjMRG
        qTMhkQDJL4fDFI97CurEYGeYkk7xQ21UJ66HLocPIpO/EYwpxOIMUmfKdhdZZAIaaJfYAMsYLIews
        J2tpHi2Les4HavOd0i6fYBjQVD/6QIrYCVfkrgapbKjVTDoAR+icoIHx8gBxWz1iQhlu+zFAb6F4M
        /0MGSvng==;
Received: from dslb-002-205-076-031.002.205.pools.vodafone-ip.de ([2.205.76.31]:59038 helo=arch.fritz.box)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <parthiban@linumiz.com>)
        id 1jusoZ-0031Qy-GF; Mon, 13 Jul 2020 07:23:51 +0000
From:   Parthiban Nallathambi <parthiban@linumiz.com>
To:     shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Parthiban Nallathambi <parthiban@linumiz.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: Add MYiR Tech boards
Date:   Mon, 13 Jul 2020 09:23:19 +0200
Message-Id: <20200713072320.5567-1-parthiban@linumiz.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 2.205.76.31
X-Source-L: No
X-Exim-ID: 1jusoZ-0031Qy-GF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: dslb-002-205-076-031.002.205.pools.vodafone-ip.de (arch.fritz.box) [2.205.76.31]:59038
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 2
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add entries for MYiR Tech imx6ULL eval boards.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---

Notes:
    Changelog v4:
    - none
    
    Changelog v3:
    - use only 'eval' as compatability. remove inclusion of
    memory type (nand/emmc) from compatability

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 05906e291e38..15f510492e88 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -268,6 +268,7 @@ properties:
               - armadeus,imx6ull-opos6uldev # OPOS6UL (i.MX6ULL) SoM on OPOS6ULDev board
               - fsl,imx6ull-14x14-evk     # i.MX6 UltraLiteLite 14x14 EVK Board
               - kontron,imx6ull-n6411-som # Kontron N6411 SOM
+              - myir,imx6ull-mys-6ulx-eval # MYiR Tech iMX6ULL Evaluation Board
               - toradex,colibri-imx6ull-eval            # Colibri iMX6ULL Module on Colibri Evaluation Board
               - toradex,colibri-imx6ull-wifi-eval       # Colibri iMX6ULL Wi-Fi / Bluetooth Module on Colibri Evaluation Board
           - const: fsl,imx6ull
-- 
2.27.0

