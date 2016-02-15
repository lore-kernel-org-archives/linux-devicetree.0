From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v7 RESEND 0/4] mailbox: hisilicon: add Hi6220 mailbox driver
Date: Mon, 15 Feb 2016 21:50:22 +0800
Message-ID: <1455544226-10094-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Leo Yan <leo.yan@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>, Bintian Wang <bintian.wang@huawei.com>, Chen Feng <puck.chen@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wei Xu <xuwei5@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi6220 mailbox supports up to 32 channels. Each channel is unidirectional
with a maximum message size of 8 words. I/O is performed using register
access (there is no DMA) and the cell raises an interrupt when messages
are received.

This patch series is to implement Hi6220 mailbox driver. It registers
two channels into framework for communication with MCU, one is tx channel
and another is rx channel. Now mailbox driver is used to send message to
MCU to control dynamic voltage and frequency scaling for CPU, GPU and DDR.

Changes from v6:
* Fix to use lowercase for hexadecimal value in DT binding document

Changes from v5:
* Refine to use mailbox three specifiers for client driver, so add xlate
  callback function in mailbox driver to support these specifiers
* Refine document for property "hi6220,mbox-tx-noirq"

Changes from v4:
* According to Jassi's suggestion, using DT binding to register channels
* Change to use operating-points-v2 to register operating points

Changes from v3:
* The patch series for enabling idle state for Hi6220 has reserved memory
  regions, so this series will not include it anymore
* Refined mailbox driver according to Jassi's suggestion;
  Removed kfifo from mailbox driver;
  Removed spinlock for ipc registers accessing, due every channel has its
  own dedicated bit in ipc register and readl/writel will introduce memory
  barrier, so don't need spinlock to protect ipc registers accessing
* After mailbox driver is ready, can use patch 4 to enable CPU's OPPs and
  stub clock driver; finally can enable CPUFreq driver for CPU frequency
  scaling

Changes from v2:
* Get rid of unused memory regions from memory node in DT, and don't use
  reserved-memory node according to Mark and Leif's suggestion; Haojian also
  has updated UEFI for efi memory info

Changes from v1:
* Correct lock usage for SMP scenario

Changes from RFC:
* According to Jassi's review, totally remove the abstract common driver
  layer and only commit driver dedicated for Hi6220
* According to Paul Bolle's review, fix typo issue for Kconfig and remove
  unnecessary dependency with OF and fix minor for mailbox driver
* Refine a little for dts nodes


Leo Yan (4):
  dt-bindings: mailbox: Document Hi6220 mailbox driver
  mailbox: Hi6220: add mailbox driver
  arm64: dts: add mailbox node for Hi6220
  arm64: dts: add Hi6220's stub clock node

 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  |  74 ++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  64 ++++
 drivers/mailbox/Kconfig                            |   8 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/hi6220-mailbox.c                   | 395 +++++++++++++++++++++
 5 files changed, 543 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
 create mode 100644 drivers/mailbox/hi6220-mailbox.c

-- 
1.9.1
