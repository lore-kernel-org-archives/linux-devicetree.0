From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH 0/1] Add support for esdhc0 on Vybrid.
Date: Wed,  8 Jul 2015 16:51:05 -0400
Message-ID: <1436388666-29376-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, stefan@agner.ch
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

Currently, only esdhc1 is described in vfxxx.dtsi.  This quick patch
adds support for esdhc0 also.

Regards,
-Cory


Cory Tusar (1):
  ARM: dts: vfxxx: Include support for esdhc0 functionality.

 arch/arm/boot/dts/vfxxx.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.3.6
