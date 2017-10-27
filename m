From: Kaihua Zhong <zhongkaihua@huawei.com>
Subject: [PATCH v2 0/3] mailbox: Add support for Hi3660 mailbox
Date: Fri, 27 Oct 2017 14:15:01 +0800
Message-ID: <1509084904-2505-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, jassisinghbrar@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, guodong.xu@linaro.org, haojian.zhuang@linaro.org, suzhuangluan@hisilicon.com, xuezhiliang@hisilicon.com, kevin.wangtao@hisilicon.com, zhongkaihua@huawei.com
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan@linaro.org>

Hi3660 mailbox controller is used to send message within multiple
processors, MCU, HIFI, etc. This patch series is to implement an
initial version for Hi3660 mailbox driver with "automatic
acknowledge" mode.

The patch set have been verified with Hi3660 stub clock driver, so
we can send message to MCU to execute CPU frequency scaling. This is
tested on 96boards Hikey960.

Changes from v1:
* Refactored structure definition according to Jassi's suggestion;
* Refactored and simplized mailbox driver with "automatic ack" mode;
* Refined commit logs to give background info for driver;
* Added document for DT binding;
* Added cover letter to track the changelog.


Kaihua Zhong (2):
  mailbox: Add support for Hi3660 mailbox
  dts: arm64: Add mailbox binding for hi3660

Leo Yan (1):
  dt-bindings: mailbox: Introduce Hi3660 controller binding

 .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  |  52 ++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |   8 +
 drivers/mailbox/Kconfig                            |   8 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/hi3660-mailbox.c                   | 331 +++++++++++++++++++++
 5 files changed, 401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
 create mode 100644 drivers/mailbox/hi3660-mailbox.c

-- 
1.9.1
