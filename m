Return-Path: <SRS0=PeIc=AQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DFCC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jul 2020 13:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9D0A2070B
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jul 2020 13:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="RD5x2pUc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgGENBm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jul 2020 09:01:42 -0400
Received: from gproxy3-pub.mail.unifiedlayer.com ([69.89.30.42]:35738 "EHLO
        gproxy3-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726792AbgGENBm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Jul 2020 09:01:42 -0400
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
        by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id B0FB540107
        for <devicetree@vger.kernel.org>; Sun,  5 Jul 2020 07:01:40 -0600 (MDT)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id s4H4jOF9qWYdhs4H5jETzc; Sun, 05 Jul 2020 07:01:40 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=IOgs9DnG c=1 sm=1 tr=0
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
        bh=zyyScYQMpX++LrIBkYXyS0miNS9TM2j1bZX0LJJG5A4=; b=RD5x2pUcfFDDJDYV3hOJDCmk72
        2YvrxeGJBFHEDMCmmDLV5ORr6rKSFuNuQT8X3aEucElZXsuG1RH3y2ZbDDJLUCYd/l6D11wCrlcvL
        flwPeYb7L9GrwtWkh/uzcSNzo0tv4vf0bzWHoTQko6VTkJJV2JvBiEUJISeu/CGt5D+uyzUACtSfA
        rhDcTWRuH+y004AfIbbv9ZB9KQgV5KnQ8SHfnPT8PjQEgndFKaBD7X0157L54tfY5YiJBpxEHi0TM
        mdoGgk2ixA3Fq/8F84GUA6t0g2nRG5dH5cN9Mo7emjwf9AFusxgSnU+qceAzdsKhji2B4OlisWQsy
        V7eD0odg==;
Received: from dslb-002-205-076-031.002.205.pools.vodafone-ip.de ([2.205.76.31]:38936 helo=arch.fritz.box)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <parthiban@linumiz.com>)
        id 1js4H3-002K3K-7s; Sun, 05 Jul 2020 13:01:37 +0000
From:   Parthiban Nallathambi <parthiban@linumiz.com>
To:     robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Parthiban Nallathambi <parthiban@linumiz.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: Add MYiR Tech boards
Date:   Sun,  5 Jul 2020 15:01:25 +0200
Message-Id: <20200705130126.64285-1-parthiban@linumiz.com>
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
X-Exim-ID: 1js4H3-002K3K-7s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: dslb-002-205-076-031.002.205.pools.vodafone-ip.de (arch.fritz.box) [2.205.76.31]:38936
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 2
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
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

