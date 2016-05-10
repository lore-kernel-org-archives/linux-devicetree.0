From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH v8 2/3] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Tue, 10 May 2016 21:55:15 +0200
Message-ID: <3359834.V76Y1cJiRU@debian64>
References: <cover.1462543457.git.chunkeey@googlemail.com> <535f785bf6116c0fb6f46afbb77e6d4bd3ef5f60.1462543458.git.chunkeey@googlemail.com> <CACRpkdaeZ14hfz-gRetRcdj8NzzyqigV1ZtDSWAwveFxwAgt0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaeZ14hfz-gRetRcdj8NzzyqigV1ZtDSWAwveFxwAgt0w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tuesday, May 10, 2016 02:08:45 PM Linus Walleij wrote:
> On Sun, May 8, 2016 at 3:08 PM, Christian Lamparter
> <chunkeey@googlemail.com> wrote:
>=20
> > From: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> >
> > This patch adds support for defining memory-mapped GPIOs which
> > are compatible with the existing gpio-mmio interface.
>=20
> Overall very nice, just waiting for the next version.

K, will deliver. I noticed that you sent a mail in which you stated
that you applied the dt binding already. Can you update your devel
branch on git.kernel.org's linux-gpio? Then, I'll simply rebase my
series and sent the remaining two patches.
(unless you tell me otherwise).
=20
> > The first user for this binding is "wd,mbl-gpio".
>=20
> And that binding defines that we have a register named "dat".

Yeah, I had to remove all non wd related bits. But since this=20
series was posted (over and over :D) on a public mailing-list
the original  "generic" linux-mmio binding is available for
everybody to perusal[0] and study. I think what we can make
would be something like a devicetree template out of it. This
way people can remove unused flags and regnames for their
compatible device tree binding. (But first: need to finish
that ppc-gpio.txt).

> > +       if (of_property_read_bool(dev->of_node, "no-output"))
>=20
> And then this too.
>=20
> Do we want these generic MMIO bindings (dat, no-output)
> in a special document like
> Documentation/devicetree/bindings/gpio/gpio-mmio.txt?
>=20
> Going forward?
Ah, I was thinking about Documentation/gpio... Since there's no
way it would go in the devicetree/bindings without having a compatible?
(And there's technically none). As far as I know the problem here is no=
t
that it would be impossible to do that (updating a .dts file is "easy".=
=2E.),
but updating .dtb to a tiny flash-rom on the device might not be. So we
have to make every effort to preserve compatibility for those devices
(and old/incomplete/broken dtbs) as long as the device is supported.

About adding new device:
This will work in the following way:=20
 1. new drives will need to supply their hardware-specific devicetree
    binding file to the dt maintainers (This "vendor,device.txt" file
    will be like the wd,mbl-gpio.txt - but modified for the hardware
    (this is where the template would be handy)

 2. Make a one-liner patch which adds a compatible string to
    gpio-mmio.c's bgpio_of_match table:

+	{ .compatible =3D "vendor,device", .data =3D bgpio_basic_mmio_parse_d=
t },

(Of course, not having parses for the "ngpio" property and the flags li=
ke
big-endian, reg-output-reg,set, unreadable-reg-dir, ... properties from
the get-go is sad, these can add back once a driver/binding needs it).

I think brcm63xx will be following shortly. So we can test the
procedure.
> This patch set mainly deals with refactorings, but in the
> long run we want to slim things down a bit and use standard
> bindings I think.
Well, to do that, I think we need to collect enough devices to
make it a real "class" of devices first.

Regards,
Christian

[0] <https://lkml.org/lkml/2016/4/28/921>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
