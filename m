From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Thu, 30 Nov 2017 15:21:56 +0100
Message-ID: <CACRpkdbkG_83-gpGqdMA5y3cpAvSbQ2X_xT07PC3+boxPeWbPQ@mail.gmail.com>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-5-git-send-email-preid@electromag.com.au>
 <20171121133434.tuvxtrrbabjk4zeg@earth> <c191a9d6-3ebb-e95b-7342-aa18598ddf2b@electromag.com.au>
 <20171121152142.zg3r57gl2kenjwgi@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171121152142.zg3r57gl2kenjwgi@earth>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 21, 2017 at 4:21 PM, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> IMHO the explicit line-inverter is a bit over-engineered and
> implicit line-inverter is enough, but I'm fine with both solutions.
> I think the DT binding maintainers should comment on this though,
> since it's pretty much a core decision about interrupt specifiers.

I feel the same.

I am very much back and forth on the subject.

Simplicity of use vs modelling the system as it actually works.

Back and forth.

I honestly have just a very vague idea about this.

I don't know if Marc Z as irqchip maintainer has some idea
on how to model inverters on irq lines or if he's seen some
solutions to it out there.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
