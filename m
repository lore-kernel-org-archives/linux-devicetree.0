From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Subject: [PATCH 0/6] miscellaneous pxa dt fixes
Date: Thu,  5 Jun 2014 14:19:44 -0500
Message-ID: <cover.1401995177.git.andrew.ruder@elecsyscorp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, rdunlap@infradead.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, Andrew Ruder <andrew.ruder@elecsyscorp.com>
List-Id: devicetree@vger.kernel.org

Andrew Ruder (6):
  arm: pxa2xx.dtsi: compatible tags for usb, mmc
  pxa-usb: devicetree bindings docs update
  arm: pxa27x.dtsi: header typo - wrong file
  arm: pxa2xx.dtsi: disable RTC by default
  arm: pxa27x.dtsi: add pwri2c definition
  arm: pxa{27x,3xx}.dtsi: gpio cleanups

 Documentation/devicetree/bindings/usb/pxa-usb.txt |  5 +++--
 arch/arm/boot/dts/pxa27x.dtsi                     | 14 +++++++++++++-
 arch/arm/boot/dts/pxa2xx.dtsi                     |  9 +++++----
 arch/arm/boot/dts/pxa3xx.dtsi                     |  7 -------
 4 files changed, 21 insertions(+), 14 deletions(-)

-- 
1.9.0.rc3.12.gbc97e2d
