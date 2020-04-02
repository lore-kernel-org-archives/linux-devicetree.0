Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B628C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 13:51:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFE2920757
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 13:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flowbird.group header.i=@flowbird.group header.b="WxDOydG4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732598AbgDBNve (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 09:51:34 -0400
Received: from mail-wm1-f100.google.com ([209.85.128.100]:55927 "EHLO
        mail-wm1-f100.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732567AbgDBNvd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 09:51:33 -0400
Received: by mail-wm1-f100.google.com with SMTP id r16so3461681wmg.5
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bqIbwL+acHtoAroEjr8MBe+Y9xxYhfN4sCBRb23QqXw=;
        b=WxDOydG4gNsjhFliMQPVW0yPVcblZV/O3xNuu0kvKS/u4sMyYGfI7NC2qXLRZWvWhg
         Yh/706lK0q+csyM8CPUrcoHBO8xeDLbp4AegVZ0wCPYesNVBJBM2pYxyfoiBQVsQeg1A
         eeXErl5KZvWGs3SFOrBI6WoOotDZ+T38/wOYHlBVewrhB/tTKq1ZC8lFERNVczEHzrOU
         LJa0NfJ8Y85ohnJzSGhXtlPjwl6BzYDRZ9IFLr1PcTLpZ3WFtsptPJK5BOG7m0co7Qd1
         fuJFj942r2UNNKQWS5dSQ1HcTDqhEY6v5cBIcPeDIjB0uVXH/UbWOAMefH6uRWmstVws
         Bigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bqIbwL+acHtoAroEjr8MBe+Y9xxYhfN4sCBRb23QqXw=;
        b=G0Xg+2zsPnE/n16QfvR6z546yQBzhWF4NrKh8dN6Y2vjG5cd35Y02NdLY8kHjPiP1w
         Qf+Ykv/pHG+Z/5jiU3XcS0myj1YMp6RpOK8fKy9A0d8mQWGNVGGOhNG34bPh3GdXCQt1
         wlODqhqDwSeH81nN9WzO3iPRgpfKO+H2d1F3tsbu2mx0U75BsWxj58LFqHWkyZxyB7WS
         UB/RuUqGLRxV1ym8AQmtQghjWzZ+PLwiQ1Oz+QlogAkCAiGyMf2lEV5t0MKDGVQ0mCCo
         QzfrBA1BUVC0mHd6Zb6Qly8hiQOO9FDhvHUHGtffLF+xdcJp8czJvX22P7zVDnw38z3w
         wikQ==
X-Gm-Message-State: AGi0PuZHYsqtLTYdV1nOS7JUdZl6MSVnU/kqy5iR6+kcgqZERG9ystVG
        uGCYdO7cF5VDwbj0bzrKqBM9pfqD2ik057Fypp7SHc1XK724
X-Google-Smtp-Source: APiQypJLVwxGrzPx/MtDC7rGnrUYvKDKjcNrb0e1eiZM7uwPxeO3JVwlFsXjnZLe32/OhWSULyGpATSq+ksU
X-Received: by 2002:a1c:2cc6:: with SMTP id s189mr584157wms.137.1585835491351;
        Thu, 02 Apr 2020 06:51:31 -0700 (PDT)
Received: from mail.besancon.parkeon.com ([185.149.63.251])
        by smtp-relay.gmail.com with ESMTPS id y206sm64655wmc.19.2020.04.02.06.51.31
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Apr 2020 06:51:31 -0700 (PDT)
X-Relaying-Domain: flowbird.group
Received: from [172.16.12.10] (port=55896 helo=PC12445-BES.dynamic.besancon.parkeon.com)
        by mail.besancon.parkeon.com with esmtp (Exim 4.71)
        (envelope-from <martin.fuzzey@flowbird.group>)
        id 1jK0Fm-0001KP-Uy; Thu, 02 Apr 2020 15:51:31 +0200
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
To:     Fugang Duan <fugang.duan@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 0/4] Fix Wake on lan with FEC on i.MX6
Date:   Thu,  2 Apr 2020 15:51:26 +0200
Message-Id: <1585835490-3813-1-git-send-email-martin.fuzzey@flowbird.group>
X-Mailer: git-send-email 1.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series fixes WoL support with the FEC on i.MX6
The support was already in mainline but seems to have bitrotted
somewhat.

Only tested with i.MX6DL

Changes V2->V3
	Patch 1:
		fix non initialized variable introduced in V2 causing
		probe to sometimes fail.

	Patch 2:
		remove /delete-property/interrupts-extended in
		arch/arm/boot/dts/imx6qp.dtsi.

	Patches 3 and 4:
		Add received Acked-by and RB tags.

Changes V1->V2
	Move the register offset and bit number from the DT to driver code
	Add SOB from Fugang Duan for the NXP code on which this is based

Martin Fuzzey (4):
  net: fec: set GPR bit on suspend by DT configuration.
  ARM: dts: imx6: Use gpc for FEC interrupt controller to fix wake on
    LAN.
  dt-bindings: fec: document the new gpr property.
  ARM: dts: imx6: add fec gpr property.

 Documentation/devicetree/bindings/net/fsl-fec.txt |   2 +
 arch/arm/boot/dts/imx6qdl.dtsi                    |   6 +-
 arch/arm/boot/dts/imx6qp.dtsi                     |   1 -
 drivers/net/ethernet/freescale/fec.h              |   7 +
 drivers/net/ethernet/freescale/fec_main.c         | 149 +++++++++++++++++-----
 5 files changed, 132 insertions(+), 33 deletions(-)

--
1.9.1

