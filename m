Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF9BC5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 13:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EF6E2075C
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573132411;
	bh=YvaEw7f+Pi2zsv4virbZKuzEazfd/I/UAKKlVWuOnZc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=Bu7/nNgAL9eadUWAd6LRMcOSB1c5WpLqb0kFNj4tSlaMY4xuDLRJOWAIitBtC/eYF
	 /1n/IlRYmzbaOsip6CZQOx3V/WXclelXe0vl9YT+UJgRB7PdzyQaYn0xxdT49+VE0u
	 +Dc4VUdd2drGqj7KcIxmuoGJjurd32tyvvErhDoA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfKGNNa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 08:13:30 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38950 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKGNNa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 08:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=2ZXzsRWVNgVDHC1TW5lPvBuXZEozJzMVEssgd44PovQ=; b=EC7Iv0wio0P+
        q4IL4TBR8jSnnaxaDrqmud1pJmv3gO4+D6K/JksXOuai6DNQJeowLxBR+DNS75Jb4kPjqp4Z80Jwe
        mQGGAjFq3i97xc9rZzmpAgtTv7m/u4PsO6ygZGUO4p+l/NTWVd+SnS18BIJnzGvLcSO5bsAi/S4yN
        HRSf0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iShbJ-0004ND-VR; Thu, 07 Nov 2019 13:13:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 3895127431AF; Thu,  7 Nov 2019 13:13:25 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "ASoC: fsi: switch to yaml base Documentation" to the asoc tree
In-Reply-To: <878sp4jaqy.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191107131325.3895127431AF@ypsilon.sirena.org.uk>
Date:   Thu,  7 Nov 2019 13:13:25 +0000 (GMT)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The patch

   ASoC: fsi: switch to yaml base Documentation

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

From 2f52475bac7e1572cdc1f045bbd69205f828ed68 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 29 Oct 2019 16:01:41 +0900
Subject: [PATCH] ASoC: fsi: switch to yaml base Documentation

This patch switches from .txt base to .yaml base Document for FSI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/878sp4jaqy.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/renesas,fsi.txt | 31 --------
 .../bindings/sound/renesas,fsi.yaml           | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.txt
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.txt b/Documentation/devicetree/bindings/sound/renesas,fsi.txt
deleted file mode 100644
index 0cf0f819b823..000000000000
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Renesas FSI
-
-Required properties:
-- compatible			: "renesas,fsi2-<soctype>",
-				  "renesas,sh_fsi2" or "renesas,sh_fsi" as
-				  fallback.
-				  Examples with soctypes are:
-				    - "renesas,fsi2-r8a7740" (R-Mobile A1)
-				    - "renesas,fsi2-sh73a0" (SH-Mobile AG5)
-- reg				: Should contain the register physical address and length
-- interrupts			: Should contain FSI interrupt
-
-- fsia,spdif-connection		: FSI is connected by S/PDIF
-- fsia,stream-mode-support	: FSI supports 16bit stream mode.
-- fsia,use-internal-clock	: FSI uses internal clock when master mode.
-
-- fsib,spdif-connection		: same as fsia
-- fsib,stream-mode-support	: same as fsia
-- fsib,use-internal-clock	: same as fsia
-
-Example:
-
-sh_fsi2: sh_fsi2@ec230000 {
-	compatible = "renesas,sh_fsi2";
-	reg = <0xec230000 0x400>;
-	interrupts = <0 146 0x4>;
-
-	fsia,spdif-connection;
-	fsia,stream-mode-support;
-	fsia,use-internal-clock;
-};
diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
new file mode 100644
index 000000000000..140a37fc3c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/renesas,fsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas FSI Sound Driver Device Tree Bindings
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+properties:
+  $nodename:
+    pattern: "^sound@.*"
+
+  compatible:
+    oneOf:
+      # for FSI2 SoC
+      - items:
+        - enum:
+          - renesas,fsi2-sh73a0
+          - renesas,fsi2-r8a7740
+        - enum:
+          - renesas,sh_fsi2
+      # for Generic
+      - items:
+        - enum:
+          - renesas,sh_fsi
+          - renesas,sh_fsi2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  fsia,spdif-connection:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: FSI is connected by S/PDIF
+
+  fsia,stream-mode-support:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: FSI supports 16bit stream mode
+
+  fsia,use-internal-clock:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: FSI uses internal clock when master mode
+
+  fsib,spdif-connection:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: same as fsia
+
+  fsib,stream-mode-support:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: same as fsia
+
+  fsib,use-internal-clock:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: same as fsia
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    sh_fsi2: sound@ec230000 {
+            compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
+            reg = <0xec230000 0x400>;
+            interrupts = <0 146 0x4>;
+
+            fsia,spdif-connection;
+            fsia,stream-mode-support;
+            fsia,use-internal-clock;
+    };
-- 
2.20.1

