Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B79C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 17:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F6DB20773
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584119210;
	bh=Ijn7N69brEt24ICRf1CiDMFE4lKTINsiSCzLnCFpX7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-ID:From;
	b=DyM1BWkzetmiJZ1LUBzByGoSvlhq/ym1ycgX+zH1pK217ATACPjs40VFIQ6vMJlJP
	 XM+rzbubJI/euOz5/s8D0lDRLo86oCY/dhMApfrkCJxC1MFQwcha0coBOFPjf9EAHX
	 QsZeqGsORRQEp+npJiDOWw7twZzFhDHa8vA6JXbg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgCMRGt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 13:06:49 -0400
Received: from foss.arm.com ([217.140.110.172]:33294 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgCMRGt (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Mar 2020 13:06:49 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CF5B31B;
        Fri, 13 Mar 2020 10:06:49 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86B3F3F534;
        Fri, 13 Mar 2020 10:06:48 -0700 (PDT)
Date:   Fri, 13 Mar 2020 17:06:47 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Applied "spi: dt-bindings: spi-controller: Fix #address-cells for slave mode" to the spi tree
In-Reply-To:  <20200306085038.8111-2-geert+renesas@glider.be>
Message-Id:  <applied-20200306085038.8111-2-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The patch

   spi: dt-bindings: spi-controller: Fix #address-cells for slave mode

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

From a079ff858cc0831f5bbad205016bfd88bf992bb1 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Fri, 6 Mar 2020 09:50:37 +0100
Subject: [PATCH] spi: dt-bindings: spi-controller: Fix #address-cells for
 slave mode

Currently, the DT bindings for an SPI controller specify that
"#address-cells" must be fixed to one.  However, that applies to an SPI
controller in master mode only.  When running in SPI slave mode,
"#address-cells" should not be specified.

Fix this making "#address-cells" mutually-exclusive with "spi-slave".

Fixes: 0a1b929356830257 ("spi: Add YAML schemas for the generic SPI options")
Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20200306085038.8111-2-geert+renesas@glider.be
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/spi-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 1e0ca6ccf64b..0ebaf6677ac4 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -52,6 +52,12 @@ properties:
     description:
       The SPI controller acts as a slave, instead of a master.
 
+oneOf:
+  - required:
+      - "#address-cells"
+  - required:
+      - spi-slave
+
 patternProperties:
   "^slave$":
     type: object
-- 
2.20.1

