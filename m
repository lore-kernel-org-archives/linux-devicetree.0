From: Grant Likely <grant.likely@secretlab.ca>
Subject: [GIT PULL] devicetree changes for v3.5 merge window
Date: Thu, 24 May 2012 14:02:44 -0600
Message-ID: <CACxGe6sTLbNoVN79iayrZ24oaHHnS4jdiOwFVVXWNdeFdp87MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Description below, please pull.
g.

The following changes since commit 36be50515fe2aef61533b516fa2576a2c7fe7664:

  Linux 3.4-rc7 (2012-05-12 18:37:47 -0700)

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 tags/devicetree-for-linus

for you to fetch changes up to 8d6c1efa51236bb781f202aa13b9f4ba654978c6:

  Merge branch 'devicetree/merge' into devicetree/next (2012-05-20
20:18:37 -0600)

----------------------------------------------------------------

Device tree changes for v3.5 merge window

Mostly documentation updates, but also includes an empty stub for
non-CONFIG_OF builds.

----------------------------------------------------------------
Grant Likely (1):
      Merge branch 'devicetree/merge' into devicetree/next

Marc Zyngier (1):
      ARM: DT: Add binding for GIC virtualization extentions (VGIC)

Roland Stigge (1):
      dt/documentation: Fix value format description

Stephen Warren (1):
      dt: add vendor prefix for EM Microelectronics

Thomas Abraham (1):
      of/irq: add empty irq_of_parse_and_map() for non-dt builds

 Documentation/devicetree/bindings/arm/gic.txt      |   35 ++++++++++++-
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 Documentation/devicetree/booting-without-of.txt    |   55 ++++++++++----------
 include/linux/of_irq.h                             |   12 ++++-
 4 files changed, 72 insertions(+), 31 deletions(-)


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
