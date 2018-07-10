From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 0/2] Stingray Smart NIC DT support
Date: Tue, 10 Jul 2018 14:25:29 -0700
Message-ID: <1531257931-11591-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch series adds DT support for Stingray smart NIC boards

This patch series is based off v4.18-rc3 and is available on GIHUB:
repo: https://github.com/Broadcom/arm64-linux.git
branch: sr-smartnic-dt-v1

Ray Jui (1):
  arm64: dts: stingray: add PAXC support

Vladimir Olovyannikov (1):
  arm64: dts: stingray: add bcm958802a802x dts

 arch/arm64/boot/dts/broadcom/stingray/Makefile     |  2 +
 .../boot/dts/broadcom/stingray/bcm958802a802x.dts  | 26 +++++++++++
 .../boot/dts/broadcom/stingray/stingray-pcie.dtsi  | 54 ++++++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 11 +++++
 4 files changed, 93 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-pcie.dtsi

-- 
2.1.4
