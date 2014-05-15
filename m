From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC v13 0/5] MPC512x DMA slave s/g support, OF DMA lookup
Date: Thu, 15 May 2014 18:15:30 +0400
Message-ID: <1400163335-29853-1-git-send-email-a13xp0p0v88@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2013/7/14 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> this series
> - introduces slave s/g support (that's support for DMA transfers which
>    involve peripherals in contrast to mem-to-mem transfers)
> - adds device tree based lookup support for DMA channels
> - combines floating patches and related feedback which already covered
>    several aspects of what the suggested LPB driver needs, to demonstrate
>    how integration might be done

...

Changes in v12:
 A new patch (part 2/7) is added to this series.
 Part 6/7:
 - change the description of 'compatible' property according part 2/7;
 - improve the document according Gerhard's feedback;

Parts 1/7, 2/7 and 4/7 have been applied by Vinod Koul and
are excluded from v13.

Changes in v13:
 A new patch (part 1/5) is added to this series.
 Part 2/5:
 - fix style issue;
 - improve comments;

> known issues:
> - it's yet to get confirmed whether MPC8308 can use slave support or
>    whether the DMA controller's driver shall actively reject it, the
>    information that's available so far suggests that peripheral transfers
>    to IP bus attached I/O is useful and shall not get blocked right away


Alexander Popov (5):
  dmaengine: fix comment typo
  dma: mpc512x: add support for peripheral transfers
  dma: of: add common xlate function for matching by channel id
  dma: mpc512x: add device tree binding document
  dma: mpc512x: register for device tree channel lookup

 .../devicetree/bindings/dma/mpc512x-dma.txt        |  40 ++++
 arch/powerpc/boot/dts/mpc5121.dtsi                 |   1 +
 drivers/dma/mpc512x_dma.c                          | 257 ++++++++++++++++++++-
 drivers/dma/of-dma.c                               |  35 +++
 include/linux/dmaengine.h                          |   2 +-
 include/linux/of_dma.h                             |   4 +
 6 files changed, 332 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt

-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
