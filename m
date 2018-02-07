From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Wed, 7 Feb 2018 09:41:22 -0200
Message-ID: <CAOMZO5DVoh67DZuwEtKpDaEkU2x1=qz92fiYmf9SQtidTbnhXg@mail.gmail.com>
References: <20180201174923.7385-1-l.stach@pengutronix.de> <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
 <1517825351.3175.3.camel@pengutronix.de> <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
 <1517914394.3175.21.camel@pengutronix.de> <CACRpkdbuGOrm=y=yPpsrkckk8+uKGxv6J9WGw9y=yiGcmbqn+w@mail.gmail.com>
 <1517932068.3175.27.camel@pengutronix.de> <CACRpkdYy43E5H=tRAf+YDvAY1RDTJ34nHSmqCXEn9xaknbLKZQ@mail.gmail.com>
 <20180207111156.a7cevrz3dbk2f4fb@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207111156.a7cevrz3dbk2f4fb-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Adding Shawn on Cc]

On Wed, Feb 7, 2018 at 9:11 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> My opinion is that all that is generic about padctrl is a device driver
> saying "Put my pins into a suitable mode". That is what padctrl is good
> for and we are there for years now. I have always been happy with the
> plain register values in the device tree. Before device tree we had
> exactly these values in the board files and I never heard anyone
> complaining about it. There were defines for the bits in the register
> which you could use when you were unhappy with plain register values.
>
> It's really trivial to look in the reference manual to make up the
> needed register values. It's also trivial to take a register value
> and look into the reference manual what this value does. Every
> translation layer, call it generic properties, just makes things more
> complicated. Often enough our input is register value tables
> from either our customers our from spreadsheets from FSL/NXP. Every
> translation layer in the way just means we have to translate the already
> existing register values into something hoping that this correctly
> translates back into the register values.
>
> It's not that some board designer comes up with "I need a drive strength
> of 150mA" and wants to put that value into the device tree. Instead they
> start with the reference manual, see which values they can (must) adjust
> and then adjust the values until they are happy. No one wants to ask
> questions like "How do I have to manipulate that device tree to change
> that particular bit?"
>
> As said, I am happy with plain register values in the device tree and
> I consider everything else overengineered.
> FSL/NXP Reference Manuals are freely available and of high quality so
> everybody can understand the register values. There's nothing magic to
> them. That might change slightly when the Manuals are not available, but
> even then I think that not the device tree ABI is the right place to
> add that missing documentation.

I agree 100% with Sascha.

I am also happy with the current plain register values in device tree.

Having two methods (plain register values on most of i.MX SoCs and the
new generic one for imx7ulp, imx8mq) is confusing for the end users.

I would prefer to use the plain register values in device tree for all
i.MX SoCs instead.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
