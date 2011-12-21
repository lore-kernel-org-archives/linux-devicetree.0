From: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH V3 0/2] Support for HTKW mcx
Date: Wed, 21 Dec 2011 16:47:50 +0100
Message-ID: <1324482472-23987-1-git-send-email-yanok@emcraft.com>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, Ilya Yanok <yanok@emcraft.com>
List-Id: devicetree@vger.kernel.org

plit into two parts:
 1. Device tree only to be used with board-generic (only serial works)
 2. Full board support via custom machine file for board-testing

Ilya Yanok (2):
  mcx: very basic support for HTKW mcx board
  mcx: support for HTKW mcx board

 arch/arm/boot/dts/mcx.dts                    |   27 ++
 arch/arm/mach-omap2/Kconfig                  |    6 +
 arch/arm/mach-omap2/Makefile                 |    1 +
 arch/arm/mach-omap2/board-mcx.c              |  500 ++++++++++++++++++++++++++
 arch/arm/plat-omap/include/plat/uncompress.h |    1 +
 5 files changed, 535 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/mcx.dts
 create mode 100644 arch/arm/mach-omap2/board-mcx.c

-- 
1.7.6.4

