From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2] ti-pipe3: PCIe x2 lane mode configuration in dra72
Date: Tue, 19 Dec 2017 15:15:38 +0530
Message-ID: <20171219094540.18432-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

DRA72 uses the same pipe3 PHY for the 2nd lane of PCIE and USB3 PHY.
By default it is configured to be used as USB3 PHY and some special
configuration has to be done inorder to use it for the 2nd lane of PCIE.

This series adds a new dt property and the configuration required to
enable 2nd lane of PCIE.

Kishon Vijay Abraham I (2):
  dt-bindings: phy: ti-pipe3: Add dt binding to use USB3 PHY for PCIe
  phy: ti-pipe3: configure usb3 phy to be used as pcie phy

 Documentation/devicetree/bindings/phy/ti-phy.txt |  2 +
 drivers/phy/ti/phy-ti-pipe3.c                    | 47 +++++++++++++++++++++---
 2 files changed, 43 insertions(+), 6 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
