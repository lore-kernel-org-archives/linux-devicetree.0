Return-Path: <SRS0=3ErU=WB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:59735 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKDQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2019 06:03:16 -0400
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/8] AP807 clocks support
Date: Mon,  5 Aug 2019 12:03:02 +0200
Message-Id: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Stefan Chulski <stefanc@marvell.com>, Yan Markman <ymarkman@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Hello,

This is the first batch of changes (out of three) to support the brand
new Marvell CN9130 SoCs which are made of one AP807 and one CP115.

This clock series applies on top of Gregory's "AP806 CPU clocks" [1].

[1] https://patchwork.kernel.org/cover/11038577/

Thanks,
Miquèl


Ben Peled (3):
  clk: mvebu: ap80x-cpu: add AP807 CPU clock support
  clk: mvebu: ap806: Prepare the introduction of AP807 clock support
  clk: mvebu: ap80x: add AP807 clock support

Christine Gharzuzi (1):
  clk: mvebu: ap806-cpu: prepare mapping of AP807 CPU clock

Miquel Raynal (3):
  dt-bindings: ap80x: Document AP807 CPU clock compatible
  dt-bindings: ap806: Document AP807 clock compatible
  clk: mvebu: ap806: be more explicit on what SaR is

Omri Itach (1):
  clk: mvebu: ap806: add AP-DCLK (hclk) to system controller driver

 .../arm/marvell/ap806-system-controller.txt   |  17 +-
 drivers/clk/mvebu/ap-cpu-clk.c                | 139 ++++++++++++---
 drivers/clk/mvebu/ap806-system-controller.c   | 162 ++++++++++++++----
 3 files changed, 253 insertions(+), 65 deletions(-)

-- 
2.20.1
