From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 RESEND 0/4] arm64: Hi6220: enable CPU idle states
Date: Thu, 21 Jan 2016 18:53:46 +0800
Message-ID: <1453373630-4693-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leo Yan <leo.yan@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, Yu Dongbin <yudongbin@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Tyler Baker <tyler.baker@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series is to enable CPU idle states for Hi6220.

Hi6220 uses PSCIv0.2 compliance interface, so directly use ARM's generic
CPUIdle driver. Patch 1 is to reserve memory regions so make sure MCU can
work well to handle power controlling; Patch 2/3 enable sp804 timer as
broadcast timer during idle states; Patch 4 registers CPU power down state
and cluster power down state.

Patch 1 "arm64: dts: Reserve memory regions for hi6220" reserves memory
regions by carve out from memory node; This follows up Mark Rutland's
suggestion to avoid risks, such like kernel's linear mapping for reserved
secure memory region may introduce speculative accesses triggering aborts
from trustzone controller (TZC) and potential cache alias problem.

Rob Herring expressed reservations for this method and says "regions should
be marked as reserved, it's not really worth holding up this platform
further", so appreciate Rob helped to make progress for this series.

The resend patch series have been rebased on mainline kernel, and tested on
Hikey board. During testing I found CPUIdle menu governor is broken, this
bug has been reported by Sudeep; Rafael J. Wysocki already has committed
patch [1] to fix this issue. Testing pass after applied Rafael's patch.

Changes from v1:
* According to Sudeep's review, fix binding for idle-states
* According to Rob's review, due timers share same clock source with apb
  clock, so just only pass one clock phandle

[1] http://article.gmane.org/gmane.linux.kernel.commits.head/573361


Leo Yan (4):
  arm64: dts: Reserve memory regions for hi6220
  arm64: Kconfig: select sp804 timer for ARCH_HISI
  arm64: dts: add sp804 timer node for Hi6220
  arm64: dts: enable idle states for Hi6220

 arch/arm64/Kconfig.platforms                   |  1 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 16 ++++++++---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 40 ++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 4 deletions(-)

-- 
1.9.1
