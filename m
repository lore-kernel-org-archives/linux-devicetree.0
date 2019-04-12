Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54237 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfDLLhv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:37:51 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 0/2] media: rcar-vin: Add "renesas,id" to V3H
Date: Fri, 12 Apr 2019 13:38:30 +0200
Message-Id: <20190412113832.30075-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, sergei.shtylyov@cogentembedded.com, geert+renesas@glider.be
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

These two patches add the mandatory "renesas,id" property to
V3H device tree.

As the property is mandatory and the driver checks for its presence,
this might actually fix VIN probe on V3H boards.

In order to support V3H, which has 16 VIN instances, modify the way the
VIN driver handles the maximum number of VIN, making it a per-SoC property.

As explained in the commit message of [2/2] if anyone with an V3H board could
provide a Tested-by tag, these two patches might actually be tagged as fixes.

Tested on Salvator-x M3-W and Ebisu E3.

Thanks
  j

Jacopo Mondi (2):
  media: rcar-vin: Make the number of VIN SoC-dependent
  arm64: dts: renesas: r8a77980: Add "renesas,id" to VIN

 arch/arm64/boot/dts/renesas/r8a77980.dtsi   | 16 ++++++++++++++
 drivers/media/platform/rcar-vin/rcar-core.c | 23 +++++++++++++++------
 drivers/media/platform/rcar-vin/rcar-vin.h  |  5 ++++-
 3 files changed, 37 insertions(+), 7 deletions(-)

--
2.21.0
