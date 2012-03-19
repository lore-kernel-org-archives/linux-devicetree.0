From: Grant Likely <grant.likely@secretlab.ca>
Subject: [GIT PULL] Devicetree changes for v3.4
Date: Mon, 19 Mar 2012 16:46:38 +0000
Message-ID: <CACxGe6uyTfted=6XMk3nE2OE6MP_MsunRHDwG_Vvey8WBdfWXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

As the tag log message below states, nothing earth shattering here.
Just incremental updates.  Please pull.

g.

The following changes since commit dcd6c92267155e70a94b3927bce681ce74b80d1f:

  Linux 3.3-rc1 (2012-01-19 15:04:48 -0800)

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 tags/dt-for-linus

for you to fetch changes up to 0f22dd395fc473cee252b9af50249b8e0f32fde7:

  of: Only compile OF_DYNAMIC on PowerPC pseries and iseries
(2012-02-21 13:33:00 -0700)

----------------------------------------------------------------
Core device tree changes for Linux v3.4

This branch contains a minor documentation addition, a utility
function for parsing string properties needed by some of the new ARM
platforms, disables dynamic DT code that isn't used anywhere but on a
few PPC machines, and exports DT node compatible data to userspace via
UEVENT properties.  Nothing earth shattering here.

----------------------------------------------------------------
Grant Likely (3):
      of: Add of_property_match_string() to find index into a string list
      drivercore: Output common devicetree information in uevent
      of: Only compile OF_DYNAMIC on PowerPC pseries and iseries

Vaibhav Hiremath (1):
      arm/dts: OMAP3: Add omap3evm and am335xevm support

 .../devicetree/bindings/arm/omap/omap.txt          |    6 +++
 arch/arm/boot/dts/testcases/tests-phandle.dtsi     |    2 +
 arch/powerpc/kernel/ibmebus.c                      |    2 +-
 arch/powerpc/platforms/8xx/Kconfig                 |    1 +
 arch/powerpc/platforms/iseries/Kconfig             |    1 +
 arch/powerpc/platforms/pseries/Kconfig             |    1 +
 arch/powerpc/platforms/wsp/Kconfig                 |    1 +
 drivers/base/core.c                                |    5 ++
 drivers/base/platform.c                            |    2 +-
 drivers/macintosh/macio_asic.c                     |    2 +-
 drivers/of/Kconfig                                 |    5 +-
 drivers/of/base.c                                  |   40 +++++++++++++++++++-
 drivers/of/device.c                                |   30 ++++++++-------
 drivers/of/selftest.c                              |   29 ++++++++++++++
 include/linux/of.h                                 |   17 ++++----
 include/linux/of_device.h                          |    8 +++-
 16 files changed, 121 insertions(+), 31 deletions(-)


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
