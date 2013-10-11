From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] Revert support for reserved memory regions defined in
 device tree
Date: Fri, 11 Oct 2013 09:27:26 +0200
Message-ID: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all!

Benjamin Herrenschmidt pointed a few issues in the proposed design of
device tree bindings for contiguous memory allocator and reserved memory
regions:
https://lkml.org/lkml/2013/9/15/151
http://www.spinics.net/lists/arm-kernel/msg273548.html

Some time has passed, but there is still no consensus on the bindings
for the reserved memory and various drawback of this solution has been
shown, so in my opinion the best I can do now is to revert them
completely and start from scratch again later.

This patch series reverts patches related to device tree bindings
proposed in the following thread:
http://thread.gmane.org/gmane.linux.ports.arm.kernel/263216
and merged by commit 64c353864e3f7ccba0ade1bd6f562f9a3bc7e68d ("Merge
branch 'for-v3.12' of git://git.linaro.org/people/mszyprowski/linux-dma-mapping").

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Marek Szyprowski (2):
  Revert "ARM: init: add support for reserved memory defined by device tree"
  Revert "drivers: of: add initialization code for dma reserved memory"

 Documentation/devicetree/bindings/memory.txt |  168 -------------------------
 arch/arm/mm/init.c                           |    3 -
 drivers/of/Kconfig                           |    6 -
 drivers/of/Makefile                          |    1 -
 drivers/of/of_reserved_mem.c                 |  173 --------------------------
 drivers/of/platform.c                        |    4 -
 include/linux/of_reserved_mem.h              |   14 ---
 7 files changed, 369 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory.txt
 delete mode 100644 drivers/of/of_reserved_mem.c
 delete mode 100644 include/linux/of_reserved_mem.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
