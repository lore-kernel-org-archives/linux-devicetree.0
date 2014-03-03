From: George Cherian <george.cherian@ti.com>
Subject: [PATCH 0/3] phy-omap-usb2 driver enhancements
Date: Mon, 3 Mar 2014 15:40:21 +0530
Message-ID: <1393841424-27656-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Cc: s.nawrocki@samsung.com, tony@atomide.com, george.cherian@ti.com, gregkh@linuxfoundation.org, kishon@ti.com, rob@landley.net, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


This series 
	* Adds suport for AM437x USB2 PHY driver
	* Address DRA7 PHY errata for false disconnect
	* New compatible for OMAP5

Austin Beam (1):
  phy: omap-usb2: Provide workaround for USB2PHY false disconnect

George Cherian (2):
  phy: omap-usb2: Adapt phy-omap-usb2 for AM437x
  phy: omap-usb2: Add different compatible for OMAP5

 Documentation/devicetree/bindings/usb/usb-phy.txt |   6 +-
 drivers/phy/phy-omap-usb2.c                       | 106 +++++++++++++++++++---
 include/linux/usb/omap_usb.h                      |  12 +++
 3 files changed, 111 insertions(+), 13 deletions(-)

-- 
1.8.3.1
