From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Mon, 17 Nov 2014 11:21:49 -0800
Message-ID: <CAL1qeaF+Y8gPFFkAXq+CnKpXmpFQQoC_6T+tJuXq2yGS1STH-g@mail.gmail.com>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com>
	<1416237576-21542-2-git-send-email-arul.ramasamy@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416237576-21542-2-git-send-email-arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arul Ramasamy <arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Naidu Tellapati <naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jude Abraham <jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 7:19 AM,  <arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> From: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> The Pistachio SOC from Imagination Technologies includes a eFuse Controller
> which exposes the status of 128 EFUSE bits to the external world.
>
> Signed-off-by: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

>  drivers/soc/Kconfig                    |   1 +
>  drivers/soc/Makefile                   |   1 +
>  drivers/soc/pistachio/Makefile         |   1 +
>  drivers/soc/pistachio/fuse/Kconfig     |   9 ++
>  drivers/soc/pistachio/fuse/Makefile    |   1 +
>  drivers/soc/pistachio/fuse/img-efuse.c | 184 +++++++++++++++++++++++++++++++++
>  include/soc/pistachio/img-efuse.h      |  17 +++
>  7 files changed, 214 insertions(+)
>  create mode 100644 drivers/soc/pistachio/Makefile
>  create mode 100644 drivers/soc/pistachio/fuse/Kconfig
>  create mode 100644 drivers/soc/pistachio/fuse/Makefile
>  create mode 100644 drivers/soc/pistachio/fuse/img-efuse.c
>  create mode 100644 include/soc/pistachio/img-efuse.h

Is this IP present on other ImgTec SoCs?  Perhaps it makes more sense
to create drivers/soc/img/ instead of drivers/soc/pistachio/?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
