Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30FCC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 12:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE45320775
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 12:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="gHdSO0x3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jMV835Dt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgFZMLj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 08:11:39 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56087 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727977AbgFZMLj (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Jun 2020 08:11:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 02C7D5C009E;
        Fri, 26 Jun 2020 08:11:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 26 Jun 2020 08:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=00SNO/wD0CWDmhJki0nu6Z9nf1
        ZxH0I2QGAEfWPDokc=; b=gHdSO0x3fpqbUlDf0nm4WaNYPBVThArTFMp3MHKmDl
        SpVVWFtTqdaSDxN7utnS8GKMoJF39WJuAf+g4sCKzRsFI56qG7j54rXbucNs0Kwn
        BvDNj0w6heUMOa9E84zGQuArbgfqoX0lYvfQCToYINersYp0raHsak88yhk4u4wO
        M8s8iWOd8ij6EWvrtwQ1kEwBRn/2qtuZmoYPe7TEixoyPlRxgloKTRMEZolgfH33
        fgDW1mw1kzsDyJcypk2A/yWydWYmX9HMyoLnbuyFWu8pcYgqr5lvEPNdzigdUE/D
        6Z3q3fXG3TWpQ4OoLjCjQ/c8pQNw85T6RKVqTEuUyOsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=00SNO/wD0CWDmhJki
        0nu6Z9nf1ZxH0I2QGAEfWPDokc=; b=jMV835Dt/zrJ17lU0kwT6WcDk36tEKNAk
        Iji5ayH3acPz91jjFQwrCXGp86C6i0MWOzHBm0EA5HDXkCUhnjxqmbjsbRktZlHw
        wa2WYXYsha6rlo1iUlvzy4eBYEuBDgQC30rWYhATtWy4yzLriyWY5auq/vdiOq0O
        Z1eTE7oIfzpOkpSIpeG8nzu/o3eJGGeYL4BNCHfAhX1rFdmI6kevctgO66gXFM2G
        DC8k58oOGetx+xgbSxo5GZFL8WXeVR6Ejx4p6Sa9ZyJbVRIlyEhjQRtjsCePq6dX
        SJGxhHIbfTubkoavoFQC8I+B2NoeOktPGnWzV80CdifgC+2xJA1Ug==
X-ME-Sender: <xms:-eX1Xqdn2NL1yBmXoetqw6d84Bwdbk02gLiOI-a3IDtHuICwf098Tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeluddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-eX1XkNILtv6qeN463fad4ev5rxCm5whK_3wcCloBa4YsLwmnSB8rA>
    <xmx:-eX1XrhOxZYQqAXPYLUZ7WuONWanqzOYJ7HTeKh4rP-Dg18bWz7Sgw>
    <xmx:-eX1Xn9AP92zHPJASyfT4gwiSMmS99RD2zW3u02DIWCGMSJug5CorQ>
    <xmx:-eX1XqgE23waE9dZmnXJMQ-PyP8bzibI2KBMHhkZLhZNJYWmpWbhFA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 09114328005A;
        Fri, 26 Jun 2020 08:11:36 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] dt-bindings: display: vc4: dpi: Fix panel warning
Date:   Fri, 26 Jun 2020 14:11:31 +0200
Message-Id: <20200626121131.127192-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The example used in the DPI binding before the conversion to YAML had a
simple-panel example that got carried over to the YAML binding.

However, that example doesn't match the simple-panel binding and results in
validation errors. Since it's only marginally helpful, let's remove that
part of the example entirely.

Fixes: 094536003e06 ("dt-bindings: display: Convert VC4 bindings to schemas")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/display/brcm,bcm2835-dpi.yaml  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
index 58213c564e03..5c1024bbc1b3 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
@@ -45,16 +45,6 @@ examples:
   - |
     #include <dt-bindings/clock/bcm2835.h>
 
-    panel: panel {
-        compatible = "ontat,yx700wv03", "simple-panel";
-
-        port {
-            panel_in: endpoint {
-                remote-endpoint = <&dpi_out>;
-            };
-        };
-    };
-
     dpi: dpi@7e208000 {
         compatible = "brcm,bcm2835-dpi";
         reg = <0x7e208000 0x8c>;
-- 
2.26.2

