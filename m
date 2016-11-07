From: John Garry <john.garry@huawei.com>
Subject: [PATCH 0/3] arm64: dts: hisi: hip06 SAS device tree fixes
Date: Tue, 8 Nov 2016 00:44:22 +0800
Message-ID: <1478537065-169286-1-git-send-email-john.garry@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com, John Garry <john.garry@huawei.com>
List-Id: devicetree@vger.kernel.org

This patchset resolves some hip06 SAS device tree issues.

John Garry (3):
  arm64: dts: hisi: fix hip06 sas am-max-trans quirk
  arm64: dts: hisi: disable sas0 and sas2 for d03
  arm64: dts: hisi: add refclk node to hip06 dts files for SAS

 arch/arm64/boot/dts/hisilicon/hip06-d03.dts |  8 --------
 arch/arm64/boot/dts/hisilicon/hip06.dtsi    | 11 ++++++++++-
 2 files changed, 10 insertions(+), 9 deletions(-)

-- 
1.9.1
