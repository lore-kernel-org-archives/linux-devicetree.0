Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6649DC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 14:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2892820722
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574866035;
	bh=79XvYHMIKCF1v9/aXtFMTviGPAJFroW9KlznpKwAGMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dskc1iOO/rSSlZImN3kejwwGxrjasbRzUQz0u0A8FT/JtfqXwJXZTXnkrHAG479N4
	 TXE7Ez28J5ychiQ+l1iQvsI2R/65YJ3WdeKK8W/EOEY6KtoimZHSauW9po/xPTedrt
	 Oti//KTF+NrCrd3/XMSROoj6Dk0581uMpJa8XFZU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfK0OrO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 09:47:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:58246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbfK0OrO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Nov 2019 09:47:14 -0500
Received: from localhost.localdomain.com (unknown [77.139.212.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7F3E206F0;
        Wed, 27 Nov 2019 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574866034;
        bh=79XvYHMIKCF1v9/aXtFMTviGPAJFroW9KlznpKwAGMw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OgZidrlCy9pO3B7T4VgXY3Vn5uSkS/1nn7BB1AJJCFhh7Aedk1xnH1lOYr60gSMoZ
         IQ7t0Lflbmqn9GB/e2WplWAcquJdB6wKoFBgMDhJIC4o0Jh1g6JaRdd2fW9uKcTV3l
         GAmG5vL9gsQe7Abch9JOHvf3gCQysKaWecjaDoLA=
From:   Lorenzo Bianconi <lorenzo@kernel.org>
To:     nbd@nbd.name
Cc:     linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        lorenzo.bianconi@redhat.com
Subject: [PATCH v2 2/2] dt-bindings: net: wireless: mt76: introduce big-endian property
Date:   Wed, 27 Nov 2019 16:46:34 +0200
Message-Id: <1b46b03f6c60c08d29d4c3cc4e2ae0a50af5eb30.1574865558.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1574865558.git.lorenzo@kernel.org>
References: <cover.1574865558.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Introduce big-endian property to specify mtd radio partition endianness

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.txt         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
index 7e675dafc256..d4d982f7ab37 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
@@ -15,6 +15,8 @@ Optional properties:
 
 - ieee80211-freq-limit: See ieee80211.txt
 - mediatek,mtd-eeprom: Specify a MTD partition + offset containing EEPROM data
+- big-endian: if the radio eeprom partition is written in big-endian, specify
+  this property
 
 The MAC address can as well be set with corresponding optional properties
 defined in net/ethernet.txt.
@@ -31,6 +33,7 @@ Optional nodes:
 			reg = <0x0000 0 0 0 0>;
 			ieee80211-freq-limit = <5000000 6000000>;
 			mediatek,mtd-eeprom = <&factory 0x8000>;
+			big-endian;
 
 			led {
 				led-sources = <2>;
-- 
2.21.0

