From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH RESEND v2 0/8] Cache-coherent DMA access using UIO
Date: Mon,  8 Aug 2016 11:22:29 +0530
Message-ID: <1470635557-13416-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
Cc: Ankit Jindal <thatsjindal-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The goal of this patchset is to improve UIO framework and UIO dmem
driver to allow cache-coherent DMA accesses from user-space.

This patchset is based on two previous patchsets:
1) [PATCH v5 0/6] UIO driver for APM X-Gene QMTM
(Refer, http://www.spinics.net/lists/devicetree/msg58244.html)
2) [PATCH 0/4] Fix and extend uio_dmem_genirq
(Refer, https://lkml.org/lkml/2016/5/17/141)

We have adopted only patch0-3 of patchset1 which was abandoned
long time back. We have taken care of last few unaddressed comments
on these patches.

The patchset2 is quite recent has been adopted entirely. We have
taken care review comments on these patches too.

This patchset is based on v4.7-rc7 tag and it is available in uio-v2
branch of https://github.com/Broadcom/arm64-linux.git

Changes since v1:
 - Make patch5 as first patch1 and mark it for linux-stable
 - Check return value of dma_set_coherent_mask()
 - Get UIO dmem dynamic region details as module parameter instead
   of getting it from DT node

Ankit Jindal (3):
  uio: code style cleanup
  uio: Add new UIO_MEM_PHYS_CACHE type for mem regions
  Documentation: Update documentation for UIO_MEM_PHYS_CACHE and
    UIO_MEM_DEVICE

Anup Patel (2):
  uio: Add new UIO_MEM_DEVICE type for mem regions
  uio: Use new memtypes in uio_dmem_genirq

Jan Viktorin (3):
  uio: fix dmem_region_start computation
  uio: UIO_IRQ_NONE is a valid option for uioinfo->irq
  uio: bind uio_dmem_genirq via OF

 Documentation/DocBook/uio-howto.tmpl |   6 +-
 drivers/uio/uio.c                    |  32 ++++--
 drivers/uio/uio_dmem_genirq.c        | 190 +++++++++++++++++++++++++++--------
 include/linux/uio_driver.h           |  10 +-
 4 files changed, 182 insertions(+), 56 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
