From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv3 0/5] ARM: dts: update Ka-Ro i.MX6 module support
Date: Thu, 31 Mar 2016 14:33:40 +0200
Message-ID: <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch set updates the Ka-Ro electronics i.MX6 based module
support and adds support for some new modules and a new baseboard.

changes vs. v1:
- relicense DTS files under GPLv2/X11
- dropped patches which have been applied already
- added some cleanup patches

changes vs. v2:
- dropped patches which have been applied already
- addressed comments from Shawn Guo
- added patch to remove LED pinctrl from hoggrp
- added patch to enable rtscts support on UARTs

[PATCHv3 1/5] ARM: dts: imx6-tx6: remove regulator bus
[PATCHv3 2/5] ARM: dts: imx6-tx6: remove LED pinctrl setting from hoggrp
[PATCHv3 3/5] ARM: dts: imx6-tx6: enable support for rtscts on UARTs
[PATCHv3 4/5] ARM: dts: imx6: add support for more Ka-Ro electronics modules
[PATCHv3 5/5] ARM: dts: imx6: add support for the Ka-Ro electronics 'MB7' baseboard
