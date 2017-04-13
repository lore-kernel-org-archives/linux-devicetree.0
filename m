From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: imx7s: Add node for GPC
Date: Thu, 13 Apr 2017 16:18:10 -0300
Message-ID: <CAOMZO5CgLP7P+Q2Mvzpnx6u5ryb1TjAvaj9xDKXpD+8fMmn7MQ@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-5-andrew.smirnov@gmail.com> <CANMBJr5sFeVxVq2w2uUd-ehXi9SpaJ7W9S_PTS_VN25YZEdXvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANMBJr5sFeVxVq2w2uUd-ehXi9SpaJ7W9S_PTS_VN25YZEdXvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 4:03 PM, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> I've been testing your GPC/PCIe patch sets against v4.11-rc5 on my
> imx7d-cl-som-imx7, but hit a bit of a wall. When gpc is set as the
> interrupt-parent for the soc, the kernel seems to hang and not produce
> any output on the serial port[0]. I tried to enable earlyprintk, but
> no luck getting a trace. Reversing this change, gets the board
> booting[1], but obviously isn't using the gpc which is needed for PCIe
> support as I understand it. I assume you've tested these changes on a
> imx7d-sdb and are not seeing a similar issue? You can find the patches
> I've picked on top of v4.11-rc5 here[2], any idea what might be the
> issue?

Thanks for the report.

It seems this series depends on the drivers/soc/imx/gpcv2.c patches
that landed into linux-next.

In this case, it would be better to re-send this series after
4.12-rc11 is out to avoid the breakage.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
