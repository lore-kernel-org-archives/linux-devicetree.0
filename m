From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH 0/2] Broadcom Stingray SATA PHY support
Date: Mon,  5 Jun 2017 14:30:33 +0530
Message-ID: <1496653235-22757-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <ray.jui@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset extends the Broadcom SATA PHY driver to add
support for Stingray SATA PHY.

All patches are based on Linux-4.12-rc2.

Srinath Mannam (2):
  dt-bindings: Update documentation for stingray SATA phy
  phy: Add stingray SATA phy support

 .../devicetree/bindings/phy/brcm-sata-phy.txt      |  7 ++-
 drivers/phy/phy-brcm-sata.c                        | 73 ++++++++++++++++++++++
 2 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.7.4
