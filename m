Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1CDC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 19:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7228521783
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573586264;
	bh=NYahL6VIHMrbC1sk2t6kMtTgGV16EwNwwOuOrqwIOw0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=IrSqeXyqPTIeMKBMazk52+ues/jdJ67igH+59WpjU64AlTU4viZh9K3lcH5zjkMnt
	 2/RofIbnxIcGOyrh9SO0EkBzN36DJV/qy5GUGv6FHknbp2leMDFLe4NUSX2d7ZTVmd
	 9pklvmaVFKzpnZpd+BkTpux/YOcPP/nulDvgDmFg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfKLTRo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 14:17:44 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45978 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfKLTRn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 14:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=jKE+HdM/O060TtCOHemxkHkonhg7iC568/HaSxJiGOY=; b=it+PiydfDGka
        UA3jHkMAxitVC5Py1G5fw8IXG6govPTwkVUY9E2h8ky4kgoWAQb9H8M4ixJfncsoS4rg9iSRqGcEd
        ReBbSlSS0Q2P5f3gK5cJyG5WzU/BkrgSKEGPFkMLo1XIFXrGAVuzksCde9ET7AL2W+cfC0W/c3rZf
        5NvE4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iUbfX-0000Co-He; Tue, 12 Nov 2019 19:17:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 0B9AC274299F; Tue, 12 Nov 2019 19:17:38 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Subject: Applied "dt-bindings: vendor-prefixes: Add 'fsi[ab]' to the list of non-vendor prefixes" to the asoc tree
In-Reply-To: <20191108153538.11970-1-robh@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20191112191739.0B9AC274299F@ypsilon.sirena.org.uk>
Date:   Tue, 12 Nov 2019 19:17:38 +0000 (GMT)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The patch

   dt-bindings: vendor-prefixes: Add 'fsi[ab]' to the list of non-vendor prefixes

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 5cff6fddb8dca9b3a367c190ec043f4f484c0679 Mon Sep 17 00:00:00 2001
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2019 09:35:38 -0600
Subject: [PATCH] dt-bindings: vendor-prefixes: Add 'fsi[ab]' to the list of
 non-vendor prefixes

'fsia' and 'fsib' property prefixes were added as schema in commit
2f52475bac7e ("ASoC: fsi: switch to yaml base Documentation").
Unfortunately to do checks on actual vendor prefixes, we have to track
the handful of prefixes which are not vendors like 'fsia' and 'fsib'.

Fixes: 2f52475bac7e ASoC: fsi: switch to yaml base Documentation
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20191108153538.11970-1-robh@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..67b89db54aa2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -16,7 +16,7 @@ properties: {}
 patternProperties:
   # Prefixes which are not vendors, but followed the pattern
   # DO NOT ADD NEW PROPERTIES TO THIS LIST
-  "^(at25|devbus|dmacap|dsa|exynos|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*": true
+  "^(at25|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*": true
   "^(keypad|m25p|max8952|max8997|max8998|mpmc),.*": true
   "^(pinctrl-single|#pinctrl-single|PowerPC),.*": true
   "^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*": true
-- 
2.20.1

