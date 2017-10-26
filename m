From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH  0/3] mtd: spi-nor: stm32-quadspi: fixes
Date: Thu, 26 Oct 2017 13:54:51 +0200
Message-ID: <1509018894-15111-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

This series adds:
-Fix: to avoid compilation warning with older compiler
versions such as gcc-4.6.
This topic has been discussed on 2 threads with Geert and Arnd
https://lkml.org/lkml/2017/9/15/70
https://www.spinics.net/lists/arm-kernel/msg606269.html
-Fix: abort prefetching in memory-mapped mode as soon prefetching
could exceed nor size (not done by fsize limit)
-Change license text and Copyright

Geert Uytterhoeven (1):
  mtd: spi-nor: stm32-quadspi: Fix uninitialized error return code

Ludovic Barre (2):
  mtd: spi-nor: stm32-quadspi: fix prefetching outside fsize
  mtd: spi-nor: stm32-quadspi: change license text

 drivers/mtd/spi-nor/stm32-quadspi.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
