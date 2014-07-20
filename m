From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] dmaengine: mpc512x: add device tree binding
 document and DMA channel lookup
Date: Sun, 20 Jul 2014 23:18:04 +0400
Message-ID: <CAF0T0X62_uwG7z8ZKtn7C=OsRCRfbBBE8QKb3tpju0zvSZf8Fg@mail.gmail.com>
References: <1403693580-9449-1-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403693580-9449-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

2014-06-25 14:52 GMT+04:00 Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> This patch series introduces a device tree binding document for
> the MPC512x DMA controller and adds device tree based DMA channel lookup
> for it.
>
> This version contains the improved device tree binding document:
> #dma-cells is made a required property, as it must be according
> dma/dma.txt document.

Could I have a feedback, please?
Thanks!

> Alexander Popov (3):
>   dmaengine: mpc512x: add device tree binding document
>   dmaengine: of: add common xlate function for matching by channel id
>   dmaengine: mpc512x: register for device tree channel lookup
>
>  .../devicetree/bindings/dma/mpc512x-dma.txt        | 29 ++++++++++++++++++
>  arch/powerpc/boot/dts/mpc5121.dtsi                 |  1 +
>  drivers/dma/mpc512x_dma.c                          | 13 +++++++-
>  drivers/dma/of-dma.c                               | 35 ++++++++++++++++++++++
>  include/linux/of_dma.h                             |  4 +++
>  5 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt
>
> --
> 1.8.4.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
