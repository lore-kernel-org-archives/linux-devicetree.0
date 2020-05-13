Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E87CA90AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35EC8204EF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="JimAHOWA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RmkUne46"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388395AbgEMOHe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 10:07:34 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:34499 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731192AbgEMOHd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 10:07:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BA4485802AE;
        Wed, 13 May 2020 10:07:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 13 May 2020 10:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=b/ssnOsTjUq2R
        zP/XjI8iXE51bGs8OKIIZRLrDvrIL4=; b=JimAHOWAf8Zvovx+Me9X3M6GHlEk8
        o2doqTBycrlQj6hRRLkVD1H2VEzCGRpIeW8m9GaJmZ2rgFMUrkwPvEl7miIK6QKr
        M4T/hZ/Alov7ipTRt0hsNoW6TAVFBBaABsWkaw2rxiyl9Cpy+vIG813y7WK8bDJn
        fVWTGB6NFbFQM5S1IpH1GvlgP7BpRt8efuID+3t0fLcnVG0vBFe8Dlr4IzWLI634
        5rHEJAPRgFjAckb7r9o0Qnskl4o0gaJopb10ndSCgP+uRoFLNeUMA7O7j9n2Bo/o
        gb/YLHe4rfloCkC7PiQkOSJLsFEoZer+4eTTsmtkyAT09djew7WOshMxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=b/ssnOsTjUq2RzP/XjI8iXE51bGs8OKIIZRLrDvrIL4=; b=RmkUne46
        PZZBfpur1zHaRZzp2Kl/I8F7p6FLCr/ENc/Dob0Td7HkIvi4G1Vr6luEde1K6V1I
        kqjeDwq++Xo9eGY1bmPqa9f7yrJ/VAbT+mxEEmPgLIR7qRDRCO/+0Bl2jGQfzalD
        EYsUgQzxyB5mFnsYV6OJlA8EdD1Y9A7Vad95aVvaHZuwEbd78lt/mNN5s/7DkfTI
        bByWlH+os5Dcoi+JodWp0e/r5pWtfMh/XhtNStu53fcRCtSLm/NfUEIQTRamsuoZ
        PZ4LXqpC8NCdlfHAOA8NEtDowAwxSK2gHDK8TlJ5deVurp00aQmajnybs4xMKV6S
        T83yeFjELqcJng==
X-ME-Sender: <xms:JP-7XuuQn-PDaGEJFoRwNen8quhkea4xU68KVJxJahq4HuqL3DMT3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JP-7XjfyvfF__tsugRhtoVMIE6ncCHOgJHiOJZiWquFwJXnrNXGtAQ>
    <xmx:JP-7XpzjkYls_53y6mCA0vZhnFOYIM8q3_VtJAkQ7p0enZhW4mxH3w>
    <xmx:JP-7XpN9TwZL6ldZnp8vm4lyh9JfEyAU-4VxqmMdmNQpARbsq1WzDA>
    <xmx:JP-7XjN4dDAdypIxEhoHMAK8kf9exfHuSUFirRtKY1YfvBqP123cZg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1A2533280060;
        Wed, 13 May 2020 10:07:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/5] dt-bindings: display: sun8i-mixer: Allow for an iommu property
Date:   Wed, 13 May 2020 16:07:21 +0200
Message-Id: <7941e0c02794e6336da75fcac950ecd43be7fd97.1589378833.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
References: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The H6 mixer is attached to an IOMMU, so let's allow that property to be
set in the bindings.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index 1dee641e3ea1..c040eef56518 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -36,6 +36,9 @@ properties:
       - const: bus
       - const: mod
 
+  iommus:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
-- 
git-series 0.9.1
