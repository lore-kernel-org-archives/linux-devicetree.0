From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] dmaengine: mpc512x: add device tree binding document
 and DMA channel lookup
Date: Sun, 8 Jun 2014 22:48:58 +0400
Message-ID: <CAF0T0X5OQH8SED5a0JreZw8wNs2R-2c2v5=7F4v4up5viK3aYw@mail.gmail.com>
References: <1400924009-23992-1-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400924009-23992-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2014-05-24 13:33 GMT+04:00 Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> This patch series introduces a device tree binding document for
> the MPC512x DMA controller and adds device tree based DMA channel lookup
> for it.

Hello, excuse me, could I have a feedback?
Should I fix anything?

Thanks a lot!
Alexander

> Alexander Popov (3):
>   dmaengine: mpc512x: add device tree binding document
>   dmaengine: of: add common xlate function for matching by channel id
>   dmaengine: mpc512x: register for device tree channel lookup
>
>  .../devicetree/bindings/dma/mpc512x-dma.txt        | 40 ++++++++++++++++++++++
>  arch/powerpc/boot/dts/mpc5121.dtsi                 |  1 +
>  drivers/dma/mpc512x_dma.c                          | 13 ++++++-
>  drivers/dma/of-dma.c                               | 35 +++++++++++++++++++
>  include/linux/of_dma.h                             |  4 +++
>  5 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt
>
> --
> 1.8.4.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
