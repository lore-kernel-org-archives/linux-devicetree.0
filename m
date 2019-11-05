Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EC0C010A3
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 11:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFC6A21D6C
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 11:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="WCHdBe6z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="irV41/zB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730757AbfKELGS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 06:06:18 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:46295 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbfKELGS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 06:06:18 -0500
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Nov 2019 06:06:17 EST
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2BA575BEF;
        Tue,  5 Nov 2019 05:56:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 05 Nov 2019 05:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm1; bh=A2GLNiSRYncUQfGy/8eawJsIIf
        W4xhhoTSPQkJ+iyzE=; b=WCHdBe6zwXnJe0lTS3koQfY0aAlGhoLLntHtZtSRsS
        iElCeWtsEz42MYDq9Yru3AcLHZ+5hLe78L+adZ5r/EP8SBwW8x189t85Ju6glo+X
        eegMvZ7FX9B8pe+a6UdlgUE71h37KuVzb0KVHxUZpQhkhBgqQvw082aSXdHcFOgn
        exZWkFGWKEkmyNKp4brmbYVlKGQe5enAykq9xYZVGmXCqnOFhn12DrbZBj3b0w4V
        RhAAI/FaozN0VclV5qaIGssCfAFgEE18lQf0Q8I7T06TNOID2+I0U13G9h3Hu4jZ
        lpGdjOxsOZOMV9qWJFIRfVqzxAKVpwRm7+QR/r6MYK3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=A2GLNi
        SRYncUQfGy/8eawJsIIfW4xhhoTSPQkJ+iyzE=; b=irV41/zB37Bip0m3fqgFgQ
        KRAYmTInfFMCx/9mvqY8QrLS3nK5ABtpCuKRXI78riwUY5HQdoYoie8Q1FeJ1wjP
        fayBoL3uUV2Q20tIxgjpcsPmxW9HefOoifnvjin8YzXMVPbKEclTvYXhpfOQg+pC
        p8q+Ab/dQHGIFM11eoIGjqWZCqS6sbShbC8MsKktkmPzdzlhIwCRH+4UciEOUeci
        p/rnwwWkL5NlLPW4ZfS1oAB+oDbXG/yUaXRiehUoYUGPF90/bJxEzo/w5A19Q+Fv
        4yqe7M/W2eeZztz0tpcmwASta4be5PhwSVUS4VmcL5UKfy72Ev1bwrPvU3iD9Y7g
        ==
X-ME-Sender: <xms:UlXBXV65nUTPq27rm1Xw0xxZMhUjU59MguRABLP9jAx_gkI7X2LCYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudduhedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghr
    nhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:UlXBXfVWULtq82rtCNHPZrgHyQTF5A8I7Dhq10PenpQF4L5lDp4jWA>
    <xmx:UlXBXYc4dO51Az-M2kGlMx3pSVMGU46q9LJmFh7AyxJt31zzWvUEbw>
    <xmx:UlXBXfkGQhMDSMcMEEJP49xjZcipdKR_bXcxXgQonpiUoVfsCpQTBQ>
    <xmx:VFXBXdZABKSfbe-nN3slar21t22v8PVAQHzMda4WZOSE91Brq5GJzw>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9890F306005B;
        Tue,  5 Nov 2019 05:56:18 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2] dt-bindings: sound: adau7118: Fix example warning
Date:   Tue,  5 Nov 2019 11:56:15 +0100
Message-Id: <20191105105615.21391-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The ADAU7118 has an example where the codec has an i2c address of 14, and
the unit address set to 14 as well.

However, while the address is expressed in decimal, the unit-address is
supposed to be in hexadecimal, which ends up with two different addresses
that trigger a DTC warning. Fix this by setting the address to 0x14.

Cc: Nuno Sá <nuno.sa@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Fixes: 969d49b2cdc8 ("dt-bindings: asoc: Add ADAU7118 documentation")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Fix the address instead of the unit-address.
---
 Documentation/devicetree/bindings/sound/adi,adau7118.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
index c3f10afbdd6f..75e0cbe6be70 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
@@ -67,7 +67,7 @@ examples:
         #size-cells = <0>;
         adau7118_codec: audio-codec@14 {
                 compatible = "adi,adau7118";
-                reg = <14>;
+                reg = <0x14>;
                 #sound-dai-cells = <0>;
                 iovdd-supply = <&supply>;
                 dvdd-supply = <&supply>;
-- 
2.23.0

