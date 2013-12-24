From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC v6 0/5] MPC512x DMA slave s/g support, OF DMA lookup
Date: Tue, 24 Dec 2013 16:06:24 +0400
Message-ID: <1387886789-20249-1-git-send-email-a13xp0p0v88@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

v2013/7/14 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> this series
> - introduces slave s/g support (that's support for DMA transfers which
>    involve peripherals in contrast to mem-to-mem transfers)
> - adds device tree based lookup support for DMA channels
> - combines floating patches and related feedback which already covered
>    several aspects of what the suggested LPB driver needs, to demonstrate
>    how integration might be done
> - carries Q&D SD card support to enable another DMA client during test,
>    while this patch needs to get dropped upon pickup

Changes in v2:
> - re-order mpc8308 related code paths for improved readability, no
>    change in behaviour, introduction of symbolic channel names here
>    already
> - squash 'execute() start condition' and 'terminate all' into the
>    introduction of 'slave s/g prep' and 'device control' support; refuse
>    s/g lists with more than one item since slave support is operational
>    yet proper s/g support is missing (can get addressed later)
> - always start transfers from software on MPC8308 as there are no
>    external request lines for peripheral flow control
> - drop dt-bindings header file and symbolic channel names in OF nodes

Changes in v3 and v4:
 Part 1/5:
 - use #define instead of enum since individual channels don't require
    special handling.
 Part 2/5:
 - add a flag "will_access_peripheral" to DMA transfer descriptor
    according recommendations of Gerhard Sittig.
    This flag is set in mpc_dma_prep_memcpy() and mpc_dma_prep_slave_sg()
    and is evaluated in mpc_dma_execute() to choose a type of start for
    the transfer.
 - prevent descriptors of transfers which involve peripherals from
    being chained together;
    each of such transfers needs hardware initiated start.
 - add locking while working with struct mpc_dma_chan
    according recommendations of Lars-Peter Clausen.
 - remove default nbytes value. Client kernel modules must set
    src_maxburst and dst_maxburst fields of struct dma_slave_config (dmaengine.h).

Changes in v5:
 Part 2/5:
 - add and improve comments;
 - improve the code moving transfer descriptors from 'queued' to 'active' list
    in mpc_dma_execute();
 - allow mpc_dma_prep_slave_sg() to run with non-empty 'active' list;
 - take 'mdesc' back to 'free' list in case of error in mpc_dma_prep_slave_sg();
 - improve checks of the transfer parameters;
 - provide the default value for 'maxburst' in mpc_dma_device_control().

Changes in v6:
 Part 2/5:
 - remove doubtful comment;
 - fix coding style issues;
 - set default value for 'maxburst' to 1 which applies to most cases;
 Part 3/5:
 - use dma_get_slave_channel() instead of dma_request_channel()
    in new function of_dma_xlate_by_chan_id() according recommendations of
    Arnd Bergmann;
 Part 4/5:
 - set DMA_PRIVATE flag for MPC512x DMA controller since its driver relies on
    of_dma_xlate_by_chan_id() which doesn't use dma_request_channel()
    any more;
 - resolve little patch conflict;
 Part 5/5:
 - resolve little patch conflict;

> known issues:
> - it's yet to get confirmed whether MPC8308 can use slave support or
>    whether the DMA controller's driver shall actively reject it, the
>    information that's available so far suggests that peripheral transfers
>    to IP bus attached I/O is useful and shall not get blocked right away
 - adding support for transfers which don't increment the RAM address or
    do increment the peripheral "port's" address is easy with
    this implementation; but which options of the common API
    should be used for specifying such transfers?


Alexander Popov (3):
  dma: mpc512x: reorder mpc8308 specific instructions
  dma: mpc512x: add support for peripheral transfers
  dma: of: Add common xlate function for matching by channel id

Gerhard Sittig (2):
  dma: mpc512x: register for device tree channel lookup
  HACK mmc: mxcmmc: enable clocks for the MPC512x

 .../devicetree/bindings/dma/mpc512x-dma.txt        |  55 ++++
 arch/powerpc/boot/dts/mpc5121.dtsi                 |   1 +
 drivers/dma/mpc512x_dma.c                          | 294 +++++++++++++++++++--
 drivers/dma/of-dma.c                               |  35 +++
 drivers/mmc/host/mxcmmc.c                          |  42 ++-
 include/linux/of_dma.h                             |   4 +
 6 files changed, 392 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt

-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
