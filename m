From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 00/12] ARM: dts: imx6: Update dts files for the Ka-Ro TX6 module series
Date: Tue, 17 Oct 2017 10:53:22 +0200
Message-ID: <1508230414-8090-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset updates the dts files for the Ka-Ro electronics GmbH TX6
module series and adds some include files to facilitate supporting
various SoM/baseboard combinations.

Changes vs. v1:
- rebased to imx/dt branch
- eliminate use of 'interrupts-extended' property according to Uwe
  Kleine-König's comment
