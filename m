Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD337CA9EA9
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B60022468
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571422024;
	bh=o/bfZop6Q813DAqwzpPSbeHbmkJk2VjyprXc30ZlqLc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=MKWibbs5F6juR5CNoCe3EtLpzr3WIHGL2Il6Zhtudd4HGCRGrtU7FStFF2c2cG92q
	 yByqypE3rs9t0tdSEueQnLpi50Q9GHfSH0rxP1MXX57FHAs1a3CRRcu7l50u9x4ssu
	 KbbuX7FerUfqQ5flZP8X2C2wJDhowXfk2fO6/7r8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505692AbfJRSHE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 14:07:04 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44712 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505688AbfJRSHE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 14:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=5GQOHUytjnNvziv5AdpSLISAIxfQ5LHLzWu62mD/pFA=; b=DVb79npQeARI
        g+gBs2spgIqnOroY5N74yLfQhuk7XR3/c1lFOO8ARDmvDyjvk7iLZmGA8BgeDe8/qa3I7O40OfjEF
        /y7XFYsYvMsyB0n8uzQ9Ryh70noNc0n/BJZQsT2ZOTbCiJikXYnvkVGElIRF8xmnupw98Qe4oahQE
        ZKvLY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iLWeQ-0004Ef-8K; Fri, 18 Oct 2019 18:06:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 5DD202741DEA; Fri, 18 Oct 2019 19:06:57 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     alsa-devel@alsa-project.org, Benson Leung <bleung@chromium.org>,
        bleung@google.com, broonie@kernel.org, cychiang@google.com,
        devicetree@vger.kernel.org, dgreid@google.com, drinkcat@google.com,
        enric.balletbo@collabora.com, gwendal@google.com,
        Mark Brown <broonie@kernel.org>, robh+dt@kernel.org,
        Rob Herring <robh@kernel.org>, tzungbi@google.com
Subject: Applied "ASoC: dt-bindings: cros_ec_codec: add SHM bindings" to the asoc tree
In-Reply-To: <20191017213539.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
X-Patchwork-Hint: ignore
Message-Id: <20191018180657.5DD202741DEA@ypsilon.sirena.org.uk>
Date:   Fri, 18 Oct 2019 19:06:57 +0100 (BST)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The patch

   ASoC: dt-bindings: cros_ec_codec: add SHM bindings

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

From 3fe5a963c63119f2d762327fba8e8b3fdd731fb4 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 17 Oct 2019 22:00:11 +0800
Subject: [PATCH] ASoC: dt-bindings: cros_ec_codec: add SHM bindings

- Add "reg" for binding to shared memory exposed by EC.
- Add "memory-region" for binding to memory region shared by AP.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191017213539.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/google,cros-ec-codec.txt   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
index 0ce9fafc78e2..8ca52dcc5572 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
@@ -10,8 +10,26 @@ Required properties:
 - compatible: Must contain "google,cros-ec-codec"
 - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
 
+Optional properties:
+- reg: Pysical base address and length of shared memory region from EC.
+       It contains 3 unsigned 32-bit integer.  The first 2 integers
+       combine to become an unsigned 64-bit physical address.  The last
+       one integer is length of the shared memory.
+- memory-region: Shared memory region to EC.  A "shared-dma-pool".  See
+                 ../reserved-memory/reserved-memory.txt for details.
+
 Example:
 
+{
+	...
+
+	reserved_mem: reserved_mem {
+		compatible = "shared-dma-pool";
+		reg = <0 0x52800000 0 0x100000>;
+		no-map;
+	};
+}
+
 cros-ec@0 {
 	compatible = "google,cros-ec-spi";
 
@@ -20,5 +38,7 @@ cros-ec@0 {
 	cros_ec_codec: ec-codec {
 		compatible = "google,cros-ec-codec";
 		#sound-dai-cells = <1>;
+		reg = <0x0 0x10500000 0x80000>;
+		memory-region = <&reserved_mem>;
 	};
 };
-- 
2.20.1

