From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 0/2] Follow up fixes for SCU3 ESB
Date: Wed, 11 Jul 2018 19:33:35 -0700
Message-ID: <20180712023337.30112-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Lucas Stach <l.stach@pengutronix.de>, cphealy@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

Shawn:

Here's a couple of fixes for things I missed in the
[original-submission]. Sorry about the inconvenience.

Thanks,
Andrey Smirnov

[original-submission] lkml.kernel.org/r/20180711050704.11492-1-andrew.smirnov@gmail.com

Andrey Smirnov (2):
  ARM: dts: imx51-zii-scu3-esb: Add switch IRQ line pinumx config
  ARM: dts: imx51-zii-scu3-esb: Fix RAVE SP watchdog compatible string

 arch/arm/boot/dts/imx51-zii-scu3-esb.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.17.1
