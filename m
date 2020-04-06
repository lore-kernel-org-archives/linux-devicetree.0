Return-Path: <SRS0=4d9G=5W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C26C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Apr 2020 13:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65BD2233EB
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Apr 2020 13:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="CQRLJeHy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgDFN4t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Apr 2020 09:56:49 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:8871 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgDFN4t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Apr 2020 09:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586181407;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=IITu+NanlcIJX52gLPjRou+laNLOAcxtxp7r92paWjg=;
        b=CQRLJeHyHpbM8QgyqthgEGIMOwGWD+4PyA8NQeYlfaRtLDPXGkoLAjlZKZLXnOO68Z
        6kdjRON9/CZ1keMjenL+hRDCcEwyBCFsTsoefuzToVGsy4fVrkkcaH7+2YmsKlvuLHzm
        kUXZ5le1HOkjX1vcUCMkG+xhzg3+u6n57ZTR8sAzZXSTELeKRFAUvodLXp/ziczT6qC+
        ccjrT3ox2nZ0LDjemJRLABH3/Fs+DrIv2peCXWYk2eUyArlpvybuSJWOOgfLVGQOOBdS
        4PnfpsZ5gd5feJ/slOUngJRiqYVBR9wPskPd4HJfWEjbjAkITuSaoq1pDEa+sfKWnI17
        5fTQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w36Dug2OM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 6 Apr 2020 15:56:42 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Kenneth Westfield <kwestfie@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Date:   Mon,  6 Apr 2020 15:56:07 +0200
Message-Id: <20200406135608.126171-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The lpass-cpu driver now allows configuring the MI2S SD lines
by defining subnodes for one of the DAIs.

Document this in the device tree bindings.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/sound/qcom,lpass-cpu.txt         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
index 21c648328be9..df53a10502f7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
@@ -30,6 +30,8 @@ Required properties:
 - reg			: Must contain an address for each entry in reg-names.
 - reg-names		: A list which must include the following entries:
 				* "lpass-lpaif"
+- #address-cells	: Must be 1
+- #size-cells		: Must be 0
 
 
 
@@ -37,6 +39,18 @@ Optional properties:
 
 - qcom,adsp		: Phandle for the audio DSP node
 
+By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
+The SD lines to use can be configured by adding subnodes for each of the DAIs.
+
+Required properties for each DAI (represented by a subnode):
+- reg			: Must be one of the DAI IDs
+			  (usually part of dt-bindings header)
+- qcom,playback-sd-lines: List of serial data lines (0-3) to use for playback
+- qcom,capture-sd-lines	: List of serial data lines (0-3) to use for capture
+
+Note that adding a subnode changes the default to "no lines configured",
+so both playback and capture lines should be configured when a subnode is added.
+
 Example:
 
 lpass@28100000 {
@@ -51,4 +65,13 @@ lpass@28100000 {
 	reg = <0x28100000 0x10000>;
 	reg-names = "lpass-lpaif";
 	qcom,adsp = <&adsp>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* Optional to set different MI2S SD lines */
+	mi2s-quaternary@3 {
+		reg = <MI2S_QUATERNARY>;
+		qcom,playback-sd-lines = <0 1>;
+	};
 };
-- 
2.26.0

