From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Thu, 8 Feb 2018 17:19:07 -0200
Message-ID: <CAOMZO5AYEPCJOa0onN84-1_OraizM9dzcqORfNS6nMsRbQzY1A@mail.gmail.com>
References: <20180201174923.7385-1-l.stach@pengutronix.de> <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
 <1517825351.3175.3.camel@pengutronix.de> <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
 <1517914394.3175.21.camel@pengutronix.de> <CACRpkdbuGOrm=y=yPpsrkckk8+uKGxv6J9WGw9y=yiGcmbqn+w@mail.gmail.com>
 <1517932068.3175.27.camel@pengutronix.de> <CACRpkdYy43E5H=tRAf+YDvAY1RDTJ34nHSmqCXEn9xaknbLKZQ@mail.gmail.com>
 <20180207111156.a7cevrz3dbk2f4fb@pengutronix.de> <CAOMZO5DVoh67DZuwEtKpDaEkU2x1=qz92fiYmf9SQtidTbnhXg@mail.gmail.com>
 <20180208085605.GG31910@dragon> <1518103733.31735.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518103733.31735.6.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Thu, Feb 8, 2018 at 1:28 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> So it seems with that we are at a point where the majority vote of
> users/maintainers are in favor of keeping the binding that has served
> us well on MX5/6. Which is right where we started with v1 of the MX8
> patches.
>
> How do we proceed? I would like to send out a respin of those series
> next week. Can we all agree to roll back the pinctrl binding to the
> MX5/6 one? Or are there still major reservations against it? I would

Yes, looks like a good plan IMHO.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
