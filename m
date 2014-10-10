From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [GIT PULL] Devicetree changes for v3.18
Date: Fri, 10 Oct 2014 22:24:49 +0100
Message-ID: <CACxGe6sqRfWG4xAAxNuaONJrcy_VXYDxAqAdBa+oA4BVVkx32g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Here are the device tree changes I have queued up for v3.18. Pretty
small set this time. Please pull.

g.

The following changes since commit fe82dcec644244676d55a1384c958d5f6797=
9adb:

  Linux 3.17-rc7 (2014-09-28 14:29:07 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux
tags/devicetree-for-linus

for you to fetch changes up to 2118f4b8dfc666c3e4a9e262beca79636a0852fe=
:

  of/selftest: Move hash table off stack to fix large frame size
(2014-10-07 11:30:31 +0100)

----------------------------------------------------------------
Devicetree changes for v3.18

This branch contains bug fixes and new features for the devicetree code=
=2E
Most of the changes are either new testcases for the selftest code or
documentation changes. The most notable change is the addition of a
phandle resolver for use when grafting in a second device tree blob int=
o
the core tree. The resolver isn't currently used by anything other than
the selftest module, but it will be used to support device tree
overlays; probably in the v3.19 timeframe.

Also note that I've moved my normal tree from git.secretlab.ca to
git.kernel.org.

----------------------------------------------------------------
Gaurav Minocha (1):
      To remove non-ascii characters in of_selftest.txt

Geert Uytterhoeven (1):
      of: Add vendor prefix for Sitronix

Grant Likely (7):
      of: Fix NULL dereference in selftest removal code
      of/selftest: Test structure of device tree
      of: Don't try to search when phandle =3D=3D 0
      of/selftest: Add a test for duplicate phandles
      of/selftest: Use the resolver to fixup phandles
      Merge branch 'for-next' of git://git.kernel.org/.../robh/linux
into devicetree/next
      of/selftest: Move hash table off stack to fix large frame size

Pantelis Antoniou (1):
      of: Introduce Device Tree resolve support.

Peter Chen (1):
      of: add vendor prefix for Chipidea

Santosh Shilimkar (1):
      dt/documentation: add specification of dma bus information

Thierry Reding (1):
      of: Add vendor prefix for Innolux Corporation

Tim Harvey (1):
      devicetree: bindings: Document Gateworks vendor prefix

Uwe Kleine-K=F6nig (1):
      of: Add vendor prefix for Energy Micro

 .../devicetree/bindings/vendor-prefixes.txt        |   5 +
 Documentation/devicetree/booting-without-of.txt    |  53 ++++
 .../devicetree/dynamic-resolution-notes.txt        |  25 ++
 Documentation/devicetree/of_selftest.txt           |  30 +-
 drivers/of/Kconfig                                 |   4 +
 drivers/of/Makefile                                |   1 +
 drivers/of/base.c                                  |   3 +
 drivers/of/resolver.c                              | 336 +++++++++++++=
++++++++
 drivers/of/selftest.c                              | 120 +++++++-
 drivers/of/testcase-data/testcases.dts             |  35 +++
 include/linux/of.h                                 |   3 +
 11 files changed, 591 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/dynamic-resolution-notes.t=
xt
 create mode 100644 drivers/of/resolver.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
