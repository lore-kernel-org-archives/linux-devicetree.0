Return-Path: <SRS0=w2p0=HQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37974 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753569AbeD0WC3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Apr 2018 18:02:29 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3 0/6] arm: dts: r8a77965 DU enablement
Date: Fri, 27 Apr 2018 23:02:14 +0100
Message-Id: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

Provide the required DT updates to enable the DU and, VGA and HDMI
outputs on the M3-N Salvator-X(S) platforms.

Driver updates and binding updates are sent separately.

Kieran Bingham (6):
  arm64: dts: r8a77965: Add FCPF and FCPV instances
  arm64: dts: r8a77965: Add VSP instances
  arm64: dts: r8a77965: Populate the DU instance placeholder
  arm64: dts: r8a77965: Add HDMI encoder instance
  arm64: dts: r8a77965-salvator-x: Enable DU external clocks and HDMI
  arm64: dts: r8a77965-salvator-xs: Enable DU external clocks and HDMI

 .../boot/dts/renesas/r8a77965-salvator-x.dts  |  28 ++++
 .../boot/dts/renesas/r8a77965-salvator-xs.dts |  28 ++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 131 +++++++++++++++++-
 3 files changed, 183 insertions(+), 4 deletions(-)

-- 
2.17.0

