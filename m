Return-Path: <SRS0=EFsK=6J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F73BC54FCB
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 18:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0B06206D4
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 18:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="ZrpX6qeu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgDYSsA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Apr 2020 14:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726145AbgDYSr7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 25 Apr 2020 14:47:59 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BAFC09B04D
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2020 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587840475;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=uAG86XGPqen4Dg22kJ3CPVajRoqLcvh1DDi1F0/W7Ek=;
        b=ZrpX6qeu7791vNB+kGBeKp9Tpehl9tIPXIUNrOA7zTvkGMpx1KJ6HiLCvaZN1hOJop
        fv4+DKE1jnoLilIPFJSeX78qIsqLt0aAKr/Epa5VTDS6oNeRlT2tXQVMLGr3DW4beIJk
        CQnonfV5DKQB91mQAubslt8+gryVGYMLMktgZFckkyTkdEVZC4aTs/3pIy8sQMmDNZqD
        X472FtwIwtCP8GmHlWE+5A1x/3fj402eGAstBq9lITLKpGnmojf/lMjJvpmsextJY0AL
        /bSz11we3dZdov9NWfqS2QUwFBjkdL/d/gWrM6hSH9FfKYkgBX/QgjJBK5eNbL0FCBJ8
        HY6g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3PIloKDT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 25 Apr 2020 20:47:50 +0200 (CEST)
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
Subject: [PATCH v2 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Date:   Sat, 25 Apr 2020 20:46:56 +0200
Message-Id: <20200425184657.121991-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
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
Changes in v2:
  - Clarify number of entries for qcom,playback/capture-sd-lines
  - Suggest more generic node names (dai@...) for children DAI device nodes

v1: https://lore.kernel.org/alsa-devel/20200406135608.126171-1-stephan@gerhold.net/
---
 .../bindings/sound/qcom,lpass-cpu.txt         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
index 21c648328be9..32c2cdb3d32f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
@@ -30,6 +30,8 @@ Required properties:
 - reg			: Must contain an address for each entry in reg-names.
 - reg-names		: A list which must include the following entries:
 				* "lpass-lpaif"
+- #address-cells	: Must be 1
+- #size-cells		: Must be 0
 
 
 
@@ -37,6 +39,20 @@ Optional properties:
 
 - qcom,adsp		: Phandle for the audio DSP node
 
+By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
+The SD lines to use can be configured by adding subnodes for each of the DAIs.
+
+Required properties for each DAI (represented by a subnode):
+- reg			: Must be one of the DAI IDs
+			  (usually part of dt-bindings header)
+- qcom,playback-sd-lines: List of serial data lines to use for playback
+			  Each SD line should be represented by a number from 0-3.
+- qcom,capture-sd-lines	: List of serial data lines to use for capture
+			  Each SD line should be represented by a number from 0-3.
+
+Note that adding a subnode changes the default to "no lines configured",
+so both playback and capture lines should be configured when a subnode is added.
+
 Example:
 
 lpass@28100000 {
@@ -51,4 +67,13 @@ lpass@28100000 {
 	reg = <0x28100000 0x10000>;
 	reg-names = "lpass-lpaif";
 	qcom,adsp = <&adsp>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* Optional to set different MI2S SD lines */
+	dai@3 {
+		reg = <MI2S_QUATERNARY>;
+		qcom,playback-sd-lines = <0 1>;
+	};
 };
-- 
2.26.2

