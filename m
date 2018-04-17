Return-Path: <SRS0=pf7g=HG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:31852 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751204AbeDQUzy (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Apr 2018 16:55:54 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779{5,6}: decrease temperature
Date: Tue, 17 Apr 2018 22:54:26 +0200
Message-Id: <20180417205428.15227-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi Simon,

This series decrease the hysteresis from 2C to 1C for the two boards we 
have described upstream. They have no dependencies and are ready to be 
accepted if the review is in favor of them.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a7795: decrease temperature hysteresis
  arm64: dts: renesas: r8a7796: decrease temperature hysteresis

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 12 ++++++------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.17.0

