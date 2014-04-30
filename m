From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v12 0/7] MPC512x DMA slave s/g support, OF DMA lookup
Date: Wed, 30 Apr 2014 09:46:54 +0400
Message-ID: <CAF0T0X7=dEE0Cs=EjOm0GoLspiZa7uOPQDk9qr9U7ircRxnmNw@mail.gmail.com>
References: <1398261209-5578-1-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398261209-5578-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello

2014-04-23 17:53 GMT+04:00 Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Changes in v12:
>  A new patch (part 2/7) is added to this series.
>  Part 6/7:
>  - change the description of 'compatible' property according part 2/7;
>  - improve the document according Gerhard's feedback;

Could I have a feedback? Is the binding document fine now?
Thanks!

> Alexander Popov (7):
>   dma: mpc512x: reorder mpc8308 specific instructions
>   dma: mpc512x: separate 'compatible' values for MPC512x and MPC8308
>   dma: mpc512x: add support for peripheral transfers
>   dma: mpc512x: fix freeing resources in mpc_dma_probe() and
>     mpc_dma_remove()
>   dma: of: add common xlate function for matching by channel id
>   dma: mpc512x: add device tree binding document
>   dma: mpc512x: register for device tree channel lookup
>
>  .../devicetree/bindings/dma/mpc512x-dma.txt        |  40 +++
>  arch/powerpc/boot/dts/mpc5121.dtsi                 |   1 +
>  arch/powerpc/boot/dts/mpc8308_p1m.dts              |   2 +-
>  arch/powerpc/boot/dts/mpc8308rdb.dts               |   2 +-
>  drivers/dma/mpc512x_dma.c                          | 346 ++++++++++++++++++---
>  drivers/dma/of-dma.c                               |  35 +++
>  include/linux/of_dma.h                             |   4 +
>  7 files changed, 390 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt
>
> --
> 1.8.4.2
>

Best regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
