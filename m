From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 0/2 v2] ARM: dts: rockchip: correct the regulators in firefly reload
Date: Thu, 18 Aug 2016 01:03:09 +0800
Message-ID: <1471453391-10267-1-git-send-email-ayaka@soulik.info>
References: <19126716.OZv44ZHtAK@diego>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <19126716.OZv44ZHtAK@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: heiko@sntech.de, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, mark.rutland@arm.com, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

The last version forget to check the regulators in PMU. This
verison would fix them. I have remove regualtor-always-on as much
as possible.

Randy Li (2):
  ARM: dts: rockchip: remove excess sd properties for firefly reload
  ARM: dts: rockchip: add missing regulators for firefly reload board

 arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 49 ++++------------
 arch/arm/boot/dts/rk3288-firefly-reload.dts       | 69 +++++++++++++++++++----
 2 files changed, 68 insertions(+), 50 deletions(-)

-- 
2.7.4
