Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52305C433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2682F2223E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594710800;
	bh=cQTMltfyROz1QWjB6Hka3WMC53cNIRPxQ4Bp5e5b6nI=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=sOBnZCIdAKuuizxMRsI7pvfUspjj/nR25ERW5vb2/ZYUB04ly0D7i+G0kiVjB++lx
	 fS0pg+St64hZ5568bo2nftdY+N8K2JWU+pS5Y14SBOTTL6BjvQYMj+5+oOSlqdX3wM
	 SExxfNVF8CZKLT3fHiK8Hd+D8nVEvEqDQIvkbFsU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgGNHNT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 03:13:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726782AbgGNHNT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jul 2020 03:13:19 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C813C2076D;
        Tue, 14 Jul 2020 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594710798;
        bh=cQTMltfyROz1QWjB6Hka3WMC53cNIRPxQ4Bp5e5b6nI=;
        h=From:To:Cc:Subject:Date:From;
        b=vGQmagC7b/lFgb0wwvi+r2YvgSRdt+4SJ7PJFA6noICZoRXCtih+Cj/DIhXtvezY1
         ik/qZl2A/LJwrslTf0S2y2QJoeyrxOpCnCVCs1hASshhAfddK3GUPZz3N66XnWVNyx
         7aOD440ik0nJHX8nKAOBTYsGIk9ZVPK0myVwy9KA=
Received: by wens.tw (Postfix, from userid 1000)
        id DE0825FAF3; Tue, 14 Jul 2020 15:13:13 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Subject: [PATCH 0/5] ARM: sunxi: Add support for MSI Primo73 tablet
Date:   Tue, 14 Jul 2020 15:13:00 +0800
Message-Id: <20200714071305.18492-1-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This series add support for MSI's Primo73 tablet. This is a 7" tablet
based on Allwinner's A20 SoC.

The tablet uses some unknown LCD panel, with only serial number
markings, and what appears to be a part number. Searching the Internet
for said part number yielded no usable results. Hence this panel is
described solely using the panel-dpi binding. The display timing values
were retrieved from the hardware description file from the original
Android system.

A new property for the panel-dpi binding is added to describe the color
depth of the panel, which is normally included the panel description in
panel-simple. Otherwise this would be undefined in the panel-dpi case
and left to encoder drivers to make up. I believe this would be separate
from the bus format, which was added earlier and then retracted.

Patches 1 and 2 add the new color depth property to the device tree
binding and the panel-simple driver.

Patch 3 adds the board compatible string to the list of boards.

Patch 4 adds a pinmux option for LCD0 full 24-bit output, with
control signals, for the A20.

Patch 5 adds the device tree file for the Primo73.


Please have a look.


Regards
ChenYu


Chen-Yu Tsai (5):
  dt-bindings: display: panel-dpi: Add bits-per-color property
  drm/panel: simple: Set bpc from bits-per-color DT property for
    panel-dpi
  dt-bindings: arm: sunxi: Add compatible for MSI Primo73 tablet
  ARM: dts: sun7i: Add LCD0 RGB888 pins
  ARM: dts: sun7i: Add MSI Primo73 tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../bindings/display/panel/panel-dpi.yaml     |   4 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/sun7i-a20-primo73.dts       | 279 ++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi              |  12 +
 drivers/gpu/drm/panel/panel-simple.c          |   1 +
 6 files changed, 302 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-primo73.dts

-- 
2.27.0

