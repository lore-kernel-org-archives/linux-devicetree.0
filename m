Return-Path: <SRS0=kFSR=FN=gmail.com=joel.stan@kernel.org>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/3] reset: simple: enable for ASPEED SoCs
Date: Mon, 19 Feb 2018 17:24:35 +1030
Message-Id: <20180219065438.19933-1-joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@aj.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

Hello Philip,

Here is a series that enables the simple reset driver for the ASPEED
SoCs. You may recall I posted a patch back in May 2017 with a
similar idea[1]. I was happy to see that you merged a driver that solves
the problem, and suits our purpose for the ASPEED. Thanks!

Cheers,

Joel

[1] https://lkml.org/lkml/2017/5/25/940


Joel Stanley (3):
  dt-bindings: aspeed-lpc: Add reset controller
  reset: simple: Enable for ASPEED systems
  reset: simple: Allow user selection of driver

 .../devicetree/bindings/mfd/aspeed-lpc.txt          | 21 +++++++++++++++++++++
 drivers/reset/Kconfig                               | 12 ++++++++----
 drivers/reset/reset-simple.c                        |  2 ++
 3 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.15.1
