From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] phy rcar-gen3-usb[23]: Add support for r8a77965
Date: Tue, 27 Feb 2018 14:52:25 +0900
Message-ID: <1519710747-26435-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set adds R-Car Gen3 USB 2.0 and 3.0 support for R8A77965.


Yoshihiro Shimoda (2):
  phy: rcar-gen3-usb2: Add support for r8a77965
  phy: rcar-gen3-usb3: Add binding for r8a77965

 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 2 ++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c                     | 4 ++++
 3 files changed, 8 insertions(+)

-- 
1.9.1
