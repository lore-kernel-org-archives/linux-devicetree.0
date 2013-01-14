From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 3.8
Date: Mon, 14 Jan 2013 15:17:23 -0600
Message-ID: <50F475E3.5060409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull these 2 small fixes for DT. The move to common dtb build rules
went in through the DT tree, so I'm taking the fixes too.

Rob

The following changes since commit 9931faca02c604c22335f5a935a501bb2ace6e20:

  Linux 3.8-rc3 (2013-01-09 18:59:55 -0800)

are available in the git repository at:

  git://sources.calxeda.com/kernel/linux.git tags/dt-fixes-for-3.8

for you to fetch changes up to 1ab3681271c84b7f926be9ae3be1d769b7e933e9:

  ARM: dts: prevent *.dtb from always being rebuilt (2013-01-14 08:08:31 -0600)

----------------------------------------------------------------
DeviceTree fixes for 3.8

2 fixes to prevent unconditional re-compile of dts files on arm and arm64.

----------------------------------------------------------------
Stephen Warren (2):
      arm64: dts: prevent *.dtb from always being rebuilt
      ARM: dts: prevent *.dtb from always being rebuilt

 arch/arm/boot/dts/Makefile   |    1 +
 arch/arm64/boot/dts/Makefile |    1 +
 2 files changed, 2 insertions(+)
