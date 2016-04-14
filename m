From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 0/5] da8xx USB PHY platform devices and clocks (was "da8xx UBS clocks")
Date: Thu, 14 Apr 2016 14:44:13 -0500
Message-ID: <1460663058-9462-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, khilman@kernel.org, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Here is the second half of v3 "da8xx UBS clocks" that just includes the
arch/arm/mach-davinci/ portion. There were no comments on these patches, so
they are mostly unchanged other than fixing on strict checkpatch complaint.

This series also requires include/linux/mfd/da8xx-cfgchip.h from the "da8xx USB
PHY" series in order to compile.

David Lechner (5):
  ARM: davinci: da8xx: add usb phy clocks
  ARM: davinci: da8xx: Add CFGCHIP syscon platform declaration.
  ARM: davinci: da8xx: Add USB PHY platform declaration
  ARM: DTS: da850: Add cfgchip syscon node
  ARM: DTS: da850: Add usb phy node

 arch/arm/boot/dts/da850.dtsi                |   9 ++
 arch/arm/mach-davinci/board-da830-evm.c     |  52 +++----
 arch/arm/mach-davinci/board-da850-evm.c     |   4 +
 arch/arm/mach-davinci/board-mityomapl138.c  |   4 +
 arch/arm/mach-davinci/board-omapl138-hawk.c |  23 ++-
 arch/arm/mach-davinci/devices-da8xx.c       |  28 ++++
 arch/arm/mach-davinci/include/mach/da8xx.h  |   6 +
 arch/arm/mach-davinci/usb-da8xx.c           | 230 +++++++++++++++++++++++++++-
 8 files changed, 314 insertions(+), 42 deletions(-)

-- 
1.9.1
