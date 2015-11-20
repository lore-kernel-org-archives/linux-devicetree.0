From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH v3 0/3] ARM: dts: add support for NS, NSP, and NS2 clocks
Date: Fri, 20 Nov 2015 10:17:17 -0500
Message-ID: <1448032640-27713-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Changes in v3:
Tweaked the NSP entry names, per Ray Jui

Changes in v2:
Rebased off of outstanding NSP DT patches and tweaked the entry names
per Ray Jui


This patch series adds device tree support for the Broadcom Northstar,
Northstar Plus, and Northstar 2 clocks.

Last sent as an RFC (see https://lkml.org/lkml/2015/10/13/882) due to
the inability to merge because of the driver dependencies.  Those
necessary driver changes were merged into 4.4.  All comments have been
addressed and it is ready to be pulled in.


Jon Mason (3):
  ARM: dts: enable clock support for BCM5301X
  ARM: dts: enable clock support for Broadcom NSP
  ARM64: dts: enable clock support for Broadcom NS2

 arch/arm/boot/dts/bcm-nsp.dtsi        | 81 ++++++++++++++++++++++++------
 arch/arm/boot/dts/bcm5301x.dtsi       | 92 +++++++++++++++++++++++++++--------
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 80 +++++++++++++++++++++++++++++-
 3 files changed, 216 insertions(+), 37 deletions(-)

-- 
1.9.1
