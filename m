From: Leo Yan <leo.yan@linaro.org>
Subject: [RFC PATCH 0/3] mailbox: hisilicon: add mailbox driver
Date: Mon,  3 Aug 2015 09:13:07 +0800
Message-ID: <1438564390-28111-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, kongfei@hisilicon.com, Guangyue Zeng <zengguangyue@hisilicon.com>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch series is to implement Hisilicon's mailbox driver and enable
the mailbox controller on Hi6220.

The Hisilicon mailbox supports up to 32 channels. Each channel is
unidirectional with a maximum message size of 8 words. I/O is performed
using register access (there is no DMA) and the cell raises an interrupt
when messages are received.

For easily extending for Hisilicon series SoCs (SoCs may have difference
for register's definition with each other), so firstly implement common
mailbox driver; this common mailbox driver provides three mainly
functionality:

 - help register channels into framework;
 - hook low level callback functions for register's operations;
 - Enhance rx channel's message queue, which is based on the code in
   drivers/mailbox/omap-mailbox.c.

Base on this common driver, also has enabled Hi6220 mailbox controller.


Leo Yan (3):
  dt-bindings: mailbox: Document Hisilicon mailbox driver
  mailbox: Hisilicon: add mailbox driver
  arm64: dts: add Hi6220 mailbox node

 .../devicetree/bindings/mailbox/hisi-mailbox.txt   |  57 ++++
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |  20 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |   8 +
 drivers/mailbox/Kconfig                            |   2 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/hisilicon/Kconfig                  |  13 +
 drivers/mailbox/hisilicon/Makefile                 |   2 +
 drivers/mailbox/hisilicon/common.c                 | 282 +++++++++++++++++++
 drivers/mailbox/hisilicon/common.h                 | 114 ++++++++
 drivers/mailbox/hisilicon/hi6220-mailbox.c         | 305 +++++++++++++++++++++
 10 files changed, 802 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisi-mailbox.txt
 create mode 100644 drivers/mailbox/hisilicon/Kconfig
 create mode 100644 drivers/mailbox/hisilicon/Makefile
 create mode 100644 drivers/mailbox/hisilicon/common.c
 create mode 100644 drivers/mailbox/hisilicon/common.h
 create mode 100644 drivers/mailbox/hisilicon/hi6220-mailbox.c

-- 
1.9.1
