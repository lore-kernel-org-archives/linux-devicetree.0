From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [GIT PULL] Last minute bug fix for Exynos platform
Date: Wed, 30 Jul 2014 08:52:43 -0600
Message-ID: <CACxGe6vLUtEGAFs+cx4KxwXyXwrTo4Ksw36wLeBnWc8GMBxwfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

This bug fix has been brewing for a while. I hate sending it to you so
late, but I only got confirmation that it solves the problem this past
weekend. The diff looks big for a bug fix, but the majority of it is
only executed in the Exynos quirk case. Unfortunately it required
splitting early_init_dt_scan() in two and adding quirk handling in the
middle of it on ARM.

If you're not happy pulling at this late stage then I'll add it to my
v3.17 merge queue and ask Greg to pull it into stable.

g.

The following changes since commit 64aa90f26c06e1cb2aacfb98a7d0eccfbd6c1a91:

  Linux 3.16-rc7 (2014-07-27 12:41:55 -0700)

are available in the git repository at:

  git://git.secretlab.ca/git/linux tags/devicetree-for-linus

for you to fetch changes up to 5a12a597a8627b91fd9d94365853f9f69a4f399c:

  arm: Add devicetree fixup machine function (2014-07-29 21:26:49 -0600)

----------------------------------------------------------------
Device tree Exynos bug fix for v3.16-rc7

Exynos has buggy firmware that puts bad data into the memory node. Commit
1c2f87c2 (ARM: Get rid of meminfo) exposed the bug by dropping the artificial
upper bound on the number of memory banks that can be added. Exynos fails to
boot after that commit. This branch fixes it by splitting the early DT parse
function and inserting a fixup hook. Exynos uses the hook to correct the DT
before parsing memory regions.

----------------------------------------------------------------
Laura Abbott (3):
      of: Split early_init_dt_scan into two parts
      of: Add memory limiting function for flattened devicetrees
      arm: Add devicetree fixup machine function

 arch/arm/include/asm/mach/arch.h |  1 +
 arch/arm/kernel/devtree.c        |  8 ++++-
 arch/arm/mach-exynos/exynos.c    | 10 ++++++
 drivers/of/fdt.c                 | 66 +++++++++++++++++++++++++++++++++++++++-
 include/linux/of_fdt.h           |  3 ++
 5 files changed, 86 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
