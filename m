From: Grant Likely <grant.likely@secretlab.ca>
Subject: [GIT PULL] device tree reverts and fix against v3.12-rc5
Date: Tue, 15 Oct 2013 22:43:26 +0100
Message-ID: <CACxGe6sw9xcPDDtbS5aJt9Q6H60x=HzDTvB80m1q7CHBW8VyUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Description below, please pull*

*unless you find the signed tag questionable. You'll notice that I
have a shiny-new gpg key which is currently only signed by my old key.
Yes. Bad. I left it very late to create a new key, the old key is now
expired, and I haven't gotten anyone else to sign the new one yet. It
will be properly signed real-soon-now and I can resend the pull
request when that happens if you don't like this one.

g.

The following changes since commit 61e6cfa80de5760bbe406f4e815b7739205754d2:

  Linux 3.12-rc5 (2013-10-13 15:41:28 -0700)

are available in the git repository at:

  git://git.secretlab.ca/git/linux tags/devicetree-for-linus

for you to fetch changes up to 1931ee143b0ab72924944bc06e363d837ba05063:

  Revert "drivers: of: add initialization code for dma reserved
memory" (2013-10-15 09:26:07 +0100)

----------------------------------------------------------------
Device tree fixes and reverts for v3.12-rc5

One bug fix and three reverts. The reverts back out the slightly
controversial feeding the entire device tree into the random pool and
the reserved-memory binding which isn't fully baked yet. Expect the
reserved-memory patches at least to resurface for v3.13. The bug fixes
removes a scary but harmless warning on SPARC that was introduced in the
v3.12 merge window. v3.13 will contain a proper fix that makes the new
code work on SPARC.

On the plus side, the diffstat looks *awesome*. I love removing lines of code.

----------------------------------------------------------------
Grant Likely (2):
      of: fix unnecessary warning on missing /cpus node
      Revert "of: Feed entire flattened device tree into the random pool"

Marek Szyprowski (2):
      Revert "ARM: init: add support for reserved memory defined by device tree"
      Revert "drivers: of: add initialization code for dma reserved memory"

 Documentation/devicetree/bindings/memory.txt | 168
--------------------------------------------
 arch/arm/mm/init.c                           |   3 -
 drivers/of/Kconfig                           |   6 --
 drivers/of/Makefile                          |   1 -
 drivers/of/base.c                            |   4 +-
 drivers/of/fdt.c                             |  12 ----
 drivers/of/of_reserved_mem.c                 | 173
----------------------------------------------
 drivers/of/platform.c                        |   4 --
 include/linux/of_reserved_mem.h              |  14 ----
 9 files changed, 1 insertion(+), 384 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory.txt
 delete mode 100644 drivers/of/of_reserved_mem.c
 delete mode 100644 include/linux/of_reserved_mem.h
