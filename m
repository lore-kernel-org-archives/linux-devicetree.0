From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 0/3] mailbox: hisilicon: add Hi6220 mailbox driver
Date: Thu, 20 Aug 2015 10:53:56 +0800
Message-ID: <1440039239-8772-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, galak@codeaurora.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, haojian.zhuang@linaro.org, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, guodong.xu@linaro.org, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, kongfei@hisilicon.com, Guangyue Zeng <zengguangyue@hisilicon.com>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi6220 mailbox supports up to 32 channels. Each channel is unidirectional
with a maximum message size of 8 words. I/O is performed using register
access (there is no DMA) and the cell raises an interrupt when messages
are received.

This patch series is to implement Hi6220 mailbox driver. It registers
two channels into framework for communication with MCU, one is tx channel
and another is rx channel. Now mailbox driver is used to send message to
MCU to control dynamic voltage and frequency scaling for CPU, GPU and DDR.

Changes from v1:
* Correct lock usage for SMP scenario

Changes from RFC:
* According to Jassi's review, totally remove the abstract common driver
  layer and only commit driver dedicated for Hi6220
* According to Paul Bolle's review, fix typo issue for Kconfig and remove
  unnecessary dependency with OF and fix minor for mailbox driver
* Refine a little for dts nodes


Leo Yan (3):
  dt-bindings: mailbox: Document Hi6220 mailbox driver
  mailbox: Hi6220: add mailbox driver
  arm64: dts: add Hi6220 mailbox node

 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  |  57 +++
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |  20 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |   8 +
 drivers/mailbox/Kconfig                            |   8 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/hi6220-mailbox.c                   | 519 +++++++++++++++++++++
 6 files changed, 611 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
 create mode 100644 drivers/mailbox/hi6220-mailbox.c

-- 
1.9.1
