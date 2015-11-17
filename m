From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 0/2] ARM: dts: NSP: clean-ups and I2C support
Date: Tue, 17 Nov 2015 14:55:25 -0500
Message-ID: <1447790127-27237-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org


Minor changes to the Broadcom Northstar Plus device tree to make it more
organized and clean, and adding I2C support (device tree only change
needed for support).


Jon Mason (2):
  ARM: dts: NSP: Device Tree clean-ups
  ARM: dts: NSP: Add I2C support to the DT

 arch/arm/boot/dts/bcm-nsp.dtsi | 59 ++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 25 deletions(-)

-- 
1.9.1
