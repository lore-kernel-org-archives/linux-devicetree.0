From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] arm: shmobile: add USB 3.0 DT for r8a7791
Date: Tue, 3 Jun 2014 15:56:55 +0900
Message-ID: <538D71B7.603@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, SH-Linux <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This patch series is based on the renesas-devel-v3.15-rc7-20140530
in renesas.git.

Changes from v1:
 - Change node name to "usb@ee000000" in patch 2.
 - Add comment in the change log of patch 2 about a generic phy.

Yoshihiro Shimoda (2):
  arm: shmobile: r8a7791: add USB3.0 clocks to device tree
  arm: shmobile: r8a7791: add USB3.0 node to r8a7791.dtsi

 arch/arm/boot/dts/r8a7791.dtsi |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
1.7.9.5
