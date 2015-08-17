From: Mathieu Olivari <mathieu@codeaurora.org>
Subject: [PATCH v3 0/3] qcom: Add SMEM MTD parser
Date: Mon, 17 Aug 2015 16:47:43 -0700
Message-ID: <1439855266-26242-1-git-send-email-mathieu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dwmw2@infradead.org, computersforpeace@gmail.com, agross@codeaurora.org, sboyd@codeaurora.org, bjorn.andersson@sonymobile.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Mathieu Olivari <mathieu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

QCOM platforms such as IPQ806x are using SMEM to store their flash
layout. This patch set adds the DT nodes required to instanciate SMEM
on IPQ806x and add an MTD parser using it.

This change is based on the SMEM driver posted here:
*https://lkml.org/lkml/2015/7/27/1125

v2:
*Release the SPI device reference after looking it up (put_device())
*Represent SMEM data as __le32 rather than u32
*Move new DT nodes in their proper respective location
*Address readability concerns in MTD parser

v3:
*Address Bjorn's comments

Mathieu Olivari (3):
  ARM: qcom: add SFPB nodes to IPQ806x dts
  ARM: qcom: add SMEM device node to IPQ806x dts
  mtd: add SMEM parser for QCOM platforms

 arch/arm/boot/dts/qcom-ipq8064.dtsi |  23 +++-
 drivers/mtd/Kconfig                 |   7 ++
 drivers/mtd/Makefile                |   1 +
 drivers/mtd/qcom_smem_part.c        | 224 ++++++++++++++++++++++++++++++++++++
 4 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/qcom_smem_part.c

-- 
2.1.4
