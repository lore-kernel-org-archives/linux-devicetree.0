From: Grant Likely <grant.likely@secretlab.ca>
Subject: [GIT PULL] DT changes for v3.10
Date: Fri, 17 May 2013 21:11:27 +0100
Message-ID: <CACxGe6tVT9sDLgJwmKjjejYe2wnmYz4A5HaQThiOfyW3T8gU_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Here are a few DT bug fixes and documentation updates. Sorry this pull
request came after -rc1. I hope it is still okay to pull in. All has
been in linux-next well before the merge window.

g.

The following changes since commit 31880c37c11e28cb81c70757e38392b42e69=
5dc6:

  Linux 3.9-rc6 (2013-04-07 20:49:54 -0700)

are available in the git repository at:

  git://git.secretlab.ca/git/linux tags/devicetree-for-linus

for you to fetch changes up to 3132f623386e9ac87077bd839e726f7b940fbc94=
:

  Merge branch 'for-next' of git://sources.calxeda.com/kernel/linux
into HEAD (2013-05-07 12:03:42 +0100)

----------------------------------------------------------------

Device tree bug fixes and documentation updates for v3.10

Nothing earth shattering here. A build failure fix, and fix for
releasing nodes and some documenation updates.

----------------------------------------------------------------
Grant Likely (1):
      Merge branch 'for-next' of
git://sources.calxeda.com/kernel/linux into HEAD

Rahul Sharma (1):
      of/documentation: move video device bindings to a common place

Rob Herring (1):
      Merge tag 'tegra-for-3.10-dtc-cpp-chroot-std-headers' of
git://git.kernel.org/.../swarren/linux-tegra into for-next

Sergei Shtylyov (1):
      <linux/of_platform.h>: fix compilation warnings with DT disabled

Tang Yuantian (1):
      of/base: release the node correctly in of_parse_phandle_with_args=
()

Uwe Kleine-K=F6nig (1):
      Documentation/devicetree: make semantic of initrd-end more explic=
it

 .../{drm/exynos/hdmi.txt =3D> video/exynos_hdmi.txt} |  0
 .../hdmiddc.txt =3D> video/exynos_hdmiddc.txt}       |  0
 .../hdmiphy.txt =3D> video/exynos_hdmiphy.txt}       |  0
 .../exynos/mixer.txt =3D> video/exynos_mixer.txt}    |  0
 Documentation/devicetree/usage-model.txt           |  8 +-
 arch/arm/boot/dts/include/dt-bindings              |  1 +
 drivers/of/base.c                                  |  4 +-
 include/dt-bindings/gpio/gpio.h                    | 15 ++++
 include/dt-bindings/interrupt-controller/arm-gic.h | 22 +++++
 include/dt-bindings/interrupt-controller/irq.h     | 19 +++++
 include/linux/of_platform.h                        |  5 +-
 scripts/Makefile.lib                               | 17 ++--
 scripts/basic/fixdep.c                             | 93 ++++++++++++++=
--------
 13 files changed, 135 insertions(+), 49 deletions(-)
 rename Documentation/devicetree/bindings/{drm/exynos/hdmi.txt =3D>
video/exynos_hdmi.txt} (100%)
 rename Documentation/devicetree/bindings/{drm/exynos/hdmiddc.txt =3D>
video/exynos_hdmiddc.txt} (100%)
 rename Documentation/devicetree/bindings/{drm/exynos/hdmiphy.txt =3D>
video/exynos_hdmiphy.txt} (100%)
 rename Documentation/devicetree/bindings/{drm/exynos/mixer.txt =3D>
video/exynos_mixer.txt} (100%)
 create mode 120000 arch/arm/boot/dts/include/dt-bindings
 create mode 100644 include/dt-bindings/gpio/gpio.h
 create mode 100644 include/dt-bindings/interrupt-controller/arm-gic.h
 create mode 100644 include/dt-bindings/interrupt-controller/irq.h


--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
