From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 0/5] Fix Cygnus, NS2, Stingray interrupt type
Date: Tue, 12 Jun 2018 13:21:26 -0700
Message-ID: <1528834891-17807-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch series fixes incorrect interrupt types for I2C and PCIe in DT
for Broadcom Cygnus, NS2, and Stingray SoCs

This patch series is based off v4.17 and is available on GIHUB:
repo: https://github.com/Broadcom/arm64-linux.git
branch: cygnus-ns2-dt-irq-type-fix-v1

Ray Jui (5):
  ARM: dts: cygnus: Fix I2C controller interrupt type
  ARM: dts: cygnus: Fix PCIe controller interrupt type
  ARM64: dts: ns2: Fix I2C controller interrupt type
  ARM64: dts: ns2: Fix PCIe controller interrupt type
  ARM64: dts: Stingray: Fix I2C controller interrupt type

 arch/arm/boot/dts/bcm-cygnus.dtsi                  | 24 +++++++++++-----------
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  8 ++++----
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  4 ++--
 3 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.1.4
