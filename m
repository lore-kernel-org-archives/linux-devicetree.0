Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C562EC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B4A22075B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="TyJIRtks";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vLU8FDUu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfLIJes (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:34:48 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44215 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727454AbfLIJer (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:34:47 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B87D22283F;
        Mon,  9 Dec 2019 04:34:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=3mO1RRmUnAaSlAkrt54tKHrUx+
        M1Fqww5Jl4YKVu7Qs=; b=TyJIRtksI/5wFa2kv7dEtblFaCxc3nTZh4lROWA1/v
        p9Q9/5JqVRVQJfbex242y8G6y2Md13TiI1fjZm2tDmu3xp/um8munqFDWWDjPoLA
        PFxcW4JOLvZXtaj0XmsdQo7ZVFwgDFdb5ofE+Er+aRDWZKEt0rxQWmCjBYh6mILb
        78z6aLW02K5idgqqlQ1falZmJU/r6gn0aOXtT+Ehll9rSq/Qb64TC0p4dYPyhY02
        29PCZBwW7VG8R7ms3qTf1IvNe/QDgimg+xWXnRkzvRt6rHicMBhKlWQ01l9L9GZN
        s+F+3HaVGgaCwWOgQKIfFM46gcozxDKmxQHRV4zCpuXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3mO1RRmUnAaSlAkrt
        54tKHrUx+M1Fqww5Jl4YKVu7Qs=; b=vLU8FDUudhxbb7kAVrGetuK/+NMr4KwDQ
        fElW2QCkRRXO4zI3JNsuTP55Oqw1GefjKoPvSfchNiFkiUjj8jNqRoWp/7+4xQLp
        ZHGeVsVG+6DZtn4wKlFu6LF4C3wfyjBRNL9YiBDj/Roh9GQZ6JpNMm5a+gWR1DdB
        LRlUHMnUiTxNF7xTO92PRGEVkKaycIakjvgVBCwFC2Bimol4ybz3dx1BxoBL06am
        4pAFQngMjzw1261h67b7G3mX8DK6qMK4L1mzay8PR0as3NSohxIRNTC4C2PymBCM
        p/s5WwUFQtPHRQuQhaxO8tM2BYHk6JIJNuS99zwPgcBqOwYWxMYEg==
X-ME-Sender: <xms:NhXuXTm2LKIoGo1rAzE9Qt3IK0uD8mLdv0W_d7X8HcOnyu7zdUuwAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrke
    elrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
    ohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:NhXuXSsbUH_OulYrJW-KXqcNjklVN9EPCoywjdv4VVXlmTs1wX7bHw>
    <xmx:NhXuXVIaPIzL5w12_HeYvqv3l-4QR_L6PAAligbe3txj8e1MzT3ozQ>
    <xmx:NhXuXfjKR2jzBX26er4x_xDmBA5rrmTYPevLmfcGmTCh6SFJSjTQhw>
    <xmx:NhXuXTwzGyzr6KqALU7336NjDj5O2Ww-POi8MoenDK7PGGX-ArguDw>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4D3408005B;
        Mon,  9 Dec 2019 04:34:46 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        krzk@kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/4] dt-bindings: sram: Allow for the childs nodes to be called sections
Date:   Mon,  9 Dec 2019 10:34:38 +0100
Message-Id: <20191209093441.50694-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The generic SRAM binding currently only allows for child nodes of an SRAM
to be called sram too. However, these are also called sections in a number
of device tree, which seems a bit more accurate.

Let's change the name pattern to allow both.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index ee2287a1b14d..83e3bc64d6fc 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -55,7 +55,7 @@ properties:
     type: boolean
 
 patternProperties:
-  "^([a-z]*-)?sram@[a-f0-9]+$":
+  "^([a-z]*-)?sram(-section)?@[a-f0-9]+$":
     type: object
     description:
       Each child of the sram node specifies a region of reserved memory.
-- 
2.23.0

