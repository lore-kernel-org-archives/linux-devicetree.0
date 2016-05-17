From: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
Subject: [PATCH 0/4] Fix and extend uio_dmem_genirq
Date: Tue, 17 May 2016 11:22:16 +0200
Message-ID: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

as a part of my work related usually to FPGAs, I was playing with the
uio_dmem_genirq. First, I've discovered a (possible) bug in the
uio_dmem_genirq in exposing the dynamic regions to userspace (patch 0001).
When specifying a number of dynamic regions, one mapping is (due to
counting IORESOURCE_IRQ) skipped:

.../maps/map0/addr: 0xe000b000  <<< IORESOURCE_MEM from reg = <...>
.../maps/map0/size: 0x00001000
.../maps/map1/addr: 0xffffffff  <<< no mapping (skipped due to IORESOURCE_IRQ)
.../maps/map1/size: 0x00008000
.../maps/map2/addr: 0x1e210000  <<< the first dynamic mapping
.../maps/map2/size: 0x00008000
.../maps/map3/addr: 0x1e218000
.../maps/map3/size: 0x00008000
.../maps/map4/addr: 0x1e220000
.../maps/map4/size: 0x00008000

Next, I needed to do some DMA from userspace and I didn't like to change
the kernel at all. The uio_pdrv_genirq has a feature to specify of_id
when calling insmod to bind to a specific device. I've implemented this
(patches 0002-0004) for uio_dmem_genirq and added two OF properties to
specify memory allocations. The work is inspired by those commits (but
reworked):

* https://github.com/analogdevicesinc/linux/commit/757e2c54a613abed6145fcd572cf6c5d8b3fb7fc
* https://github.com/analogdevicesinc/linux/commit/45ec4148b290302c7de8e6a1de0d9f7b2833339b

Regards
Jan


Jan Viktorin (4):
  uio: fix dmem_region_start computation
  uio: UIO_IRQ_NONE is a valid option for uioinfo->irq
  uio: introduce devicetree bindings for uio_dmem_genirq
  uio: allow binding uio_pdrv_genirq.c to devices using command line
    option

 .../devicetree/bindings/uio/uio_dmem_genirq.txt    | 16 ++++
 drivers/uio/uio_dmem_genirq.c                      | 93 +++++++++++++++-------
 2 files changed, 81 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt

-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
