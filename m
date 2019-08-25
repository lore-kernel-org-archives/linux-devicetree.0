Return-Path: <SRS0=gEAL=WV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60237 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfHYOAQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 25 Aug 2019 10:00:16 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 0/2] arm64: dts: renesas: Add LIF channel to 'vsps' property
Date: Sun, 25 Aug 2019 16:01:33 +0200
Message-Id: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

V2 of this patch splits the DTS changes from the updating of the DU driver
comment as suggested by Laurent and Geert.

Patches based on renesas-devel-2019-08-21.

Thanks
  j

Jacopo Mondi (2):
  arm64: dts: renesas: Add LIF channel indices to vsps property
  drm: rcar-du: kms: Expand comment in vsps parsing routine

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c        | 6 +++++-
 6 files changed, 10 insertions(+), 6 deletions(-)

--
2.23.0
