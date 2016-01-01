From: Roman Volkov <v1ron@mail.ru>
Subject: [PATCH v3 RESEND 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Fri,  1 Jan 2016 16:38:10 +0300
Message-ID: <1451655492-2569-1-git-send-email-v1ron@mail.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, linux+armsoc@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Alexey Charkov <alchark@gmail.com>, Roman Volkov <rvolkov@v1ros.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Tony Prisk <linux@prisktech.co.nz>
List-Id: devicetree@vger.kernel.org

From: Roman Volkov <rvolkov@v1ros.org>

This patch set enables SD controller support for WM8650 and
fixes minor errors in WM8505 Device Tree file.

Changes in v3:
1. Add minor fixes for WM8505 SDHC node

Tested on both WM8505 and WM8650.

Roman Volkov (2):
  dts: vt8500: Add SDHC node to DTS file for WM8650
  dts: vt8500: Fix errors in SDHC node for WM8505

 arch/arm/boot/dts/wm8505.dtsi | 4 ++--
 arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
Hi maintainers, I see my previous versions were not applied. Could this
little patch set be applied for the linux-next? I don't think this is new
functionality, this must be considered as bugfix for existing Device Tree.

Any other suggestions?

2.3.1
