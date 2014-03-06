From: George Cherian <george.cherian@ti.com>
Subject: [PATCH v2 0/3] phy-omap-usb2 driver enhancements
Date: Thu, 6 Mar 2014 18:11:51 +0530
Message-ID: <1394109714-31228-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Cc: s.nawrocki@samsung.com, tony@atomide.com, george.cherian@ti.com, gregkh@linuxfoundation.org, kishon@ti.com, rob@landley.net, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


This series 
	* Adds suport for AM437x USB2 PHY driver
	* Address DRA7 PHY errata for false disconnect
	* New compatible for OMAP5

Changelog v1 -> v2 
	* Refreshed the whole series on top of linux-phy/next
	* u32 flags changed to u8 flags in Patch1
	* changed devm_request_and ioremap to devm_ioremap_resource in Patch2

Austin Beam (1):
  phy: omap-usb2: Provide workaround for USB2PHY false disconnect

George Cherian (2):
  phy: omap-usb2: Adapt phy-omap-usb2 for AM437x
  phy: omap-usb2: Add different compatible for OMAP5

 Documentation/devicetree/bindings/usb/usb-phy.txt |   6 +-
 drivers/phy/phy-omap-usb2.c                       | 102 +++++++++++++++++++---
 include/linux/phy/omap_usb.h                      |  13 +++
 3 files changed, 108 insertions(+), 13 deletions(-)

-- 
1.8.3.1

