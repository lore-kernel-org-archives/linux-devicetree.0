From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 0/1] ARM: dts: sunxi: sun8i-h3-nanopi-m1-plus: fix build failure
Date: Wed,  1 Nov 2017 09:03:56 +0100
Message-ID: <20171101080357.4241-1-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello

The following patch fix the build failure due to "ARM: dts: sunxi: Restore EMAC changes (boards)".
A made a mistake when rebasing and a part of sun8i-h3-nanopi-m1-plus emac
was added without the needed regulator.

Regards

Corentin Labbe (1):
  ARM: dts: sunxi: sun8i-h3-nanopi-m1-plus: Add missing regulator

 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.13.6
