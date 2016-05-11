Return-Path: <noltari@gmail.com>
Date: Wed, 11 May 2016 13:05:49 +0200
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <e8213986-22b9-465f-9a4a-44d6d45e38b4@Spark>
In-Reply-To: <3359834.V76Y1cJiRU@debian64>
References: <cover.1462543457.git.chunkeey@googlemail.com>
 <535f785bf6116c0fb6f46afbb77e6d4bd3ef5f60.1462543458.git.chunkeey@googlemail.com>
 <CACRpkdaeZ14hfz-gRetRcdj8NzzyqigV1ZtDSWAwveFxwAgt0w@mail.gmail.com>
 <3359834.V76Y1cJiRU@debian64>
Subject: Re: [PATCH v8 2/3] gpio: mmio: add DT support for memory-mapped
 GPIOs
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="57331219_643c9869_b59"
To: Linus Walleij <linus.walleij@linaro.org>, Christian Lamparter <chunkeey@googlemail.com>
Cc: "=?utf-8?Q?linux-gpio=40vger.kernel.org?=" <linux-gpio@vger.kernel.org>, "=?utf-8?Q?devicetree=40vger.kernel.org?=" <devicetree@vger.kernel.org>, "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>, "=?utf-8?Q?linux-arm-kernel=40lists.infradead.org?=" <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--57331219_643c9869_b59
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello everyone,

=46irst of all thanks Christian for persisting in adding generic device t=
ree support for memory-mapped gpios.

=46or the brcm63xx case we could probably do something like this:
https://gist.github.com/Noltari/fd34aedafd427d25467697ec6799d15a
Notice that I'm doing something similar to what's already done for non de=
vice tree with basic-mmio-gpio vs basic-mmio-gpio-be:
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpio-generic.c=
=23L634

P.S: excuse me for not using an interleaved reply, but I'm sending this f=
rom my phone :)

Regards,
=C3=81lvaro.


El 10 may 2016 21:55 +0200, Christian Lamparter<chunkeey=40googlemail.com=
>, escribi=C3=B3:
> On Tuesday, May 10, 2016 02:08:45 PM Linus Walleij wrote:
> > On Sun, May 8, 2016 at 3:08 PM, Christian Lamparter
> > <chunkeey=40googlemail.com>wrote:
> > =20
> > > =46rom: =C3=81lvaro =46ern=C3=A1ndez Rojas<noltari=40gmail.com
> > > =20
> > > This patch adds support for defining memory-mapped GPIOs which
> > > are compatible with the existing gpio-mmio interface.
> > =20
> > Overall very nice, just waiting for the next version.
> =20
> K, will deliver. I noticed that you sent a mail in which you stated
> that you applied the dt binding already. Can you update your devel
> branch on git.kernel.org's linux-gpio=3F Then, I'll simply rebase my
> series and sent the remaining two patches.
> (unless you tell me otherwise).
> =20
> > > The first user for this binding is =22wd,mbl-gpio=22.
> > =20
> > And that binding defines that we have a register named =22dat=22.
> =20
> Yeah, I had to remove all non wd related bits. But since this
> series was posted (over and over :D) on a public mailing-list
> the original =22generic=22 linux-mmio binding is available for
> everybody to perusal=5B0=5D and study. I think what we can make
> would be something like a devicetree template out of it. This
> way people can remove unused flags and regnames for their
> compatible device tree binding. (But first: need to finish
> that ppc-gpio.txt).
> =20
> > > + if (of=5Fproperty=5Fread=5Fbool(dev->of=5Fnode, =22no-output=22))=

> > =20
> > And then this too.
> > =20
> > Do we want these generic MMIO bindings (dat, no-output)
> > in a special document like
> > Documentation/devicetree/bindings/gpio/gpio-mmio.txt=3F
> > =20
> > Going forward=3F
> Ah, I was thinking about Documentation/gpio... Since there's no
> way it would go in the devicetree/bindings without having a compatible=3F=

> (And there's technically none). As far as I know the problem here is no=
t
> that it would be impossible to do that (updating a .dts file is =22easy=
=22...),
> but updating .dtb to a tiny flash-rom on the device might not be. So we=

> have to make every effort to preserve compatibility for those devices
> (and old/incomplete/broken dtbs) as long as the device is supported.
> =20
> About adding new device:
> This will work in the following way:
> 1. new drives will need to supply their hardware-specific devicetree
> binding file to the dt maintainers (This =22vendor,device.txt=22 file
> will be like the wd,mbl-gpio.txt - but modified for the hardware
> (this is where the template would be handy)
> =20
> 2. Make a one-liner patch which adds a compatible string to
> gpio-mmio.c's bgpio=5Fof=5Fmatch table:
> =20
> + =7B .compatible =3D =22vendor,device=22, .data =3D bgpio=5Fbasic=5Fmm=
io=5Fparse=5Fdt =7D,
> =20
> (Of course, not having parses for the =22ngpio=22 property and the flag=
s like
> big-endian, reg-output-reg,set, unreadable-reg-dir, ... properties from=

> the get-go is sad, these can add back once a driver/binding needs it).
> =20
> I think brcm63xx will be following shortly. So we can test the
> procedure.
> > This patch set mainly deals with refactorings, but in the
> > long run we want to slim things down a bit and use standard
> > bindings I think.
> Well, to do that, I think we need to collect enough devices to
> make it a real =22class=22 of devices first.
> =20
> Regards,
> Christian
> =20
> =5B0=5D<https://lkml.org/lkml/2016/4/28/921

--57331219_643c9869_b59
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>Hello everyone,<br />
<br />
=46irst of all thanks Christian for persisting in adding generic device t=
ree support for memory-mapped gpios.<br />
<br />
=46or the brcm63xx case we could probably do something like this:<br />
https://gist.github.com/Noltari/fd34aedafd427d25467697ec6799d15a<br />
Notice that I'm doing something similar to what's already done for non de=
vice tree with basic-mmio-gpio vs basic-mmio-gpio-be:<br />
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpio-generic.c=
=23L634<br />
<br />
P.S: excuse me for not using an interleaved reply, but I'm sending this f=
rom my phone :)<br />
<br />
Regards,<br />
=C3=81lvaro.</div>
<div name=3D=22messageSignatureSection=22><br /></div>
<div name=3D=22messageReplySection=22><br />
El 10 may 2016 21:55 +0200, Christian Lamparter &lt;chunkeey=40googlemail=
.com&gt;, escribi=C3=B3:<br />
<blockquote type=3D=22cite=22>On Tuesday, May 10, 2016 02:08:45 PM Linus =
Walleij wrote:<br />
<blockquote type=3D=22cite=22>On Sun, May 8, 2016 at 3:08 PM, Christian L=
amparter<br />
&lt;chunkeey=40googlemail.com&gt; wrote:<br />
<br />
<blockquote type=3D=22cite=22>=46rom: =C3=81lvaro =46ern=C3=A1ndez Rojas =
&lt;noltari=40gmail.com<br />
<br />
This patch adds support for defining memory-mapped GPIOs which<br />
are compatible with the existing gpio-mmio interface.<br /></blockquote>
<br />
Overall very nice, just waiting for the next version.<br /></blockquote>
<br />
K, will deliver. I noticed that you sent a mail in which you stated<br />=

that you applied the dt binding already. Can you update your devel<br />
branch on git.kernel.org's linux-gpio=3F Then, I'll simply rebase my<br /=
>
series and sent the remaining two patches.<br />
(unless you tell me otherwise).<br />
<br />
<blockquote type=3D=22cite=22>
<blockquote type=3D=22cite=22>The first user for this binding is =22wd,mb=
l-gpio=22.<br /></blockquote>
<br />
And that binding defines that we have a register named =22dat=22.<br /></=
blockquote>
<br />
Yeah, I had to remove all non wd related bits. But since this<br />
series was posted (over and over :D) on a public mailing-list<br />
the original =22generic=22 linux-mmio binding is available for<br />
everybody to perusal=5B0=5D and study. I think what we can make<br />
would be something like a devicetree template out of it. This<br />
way people can remove unused flags and regnames for their<br />
compatible device tree binding. (But first: need to finish<br />
that ppc-gpio.txt).<br />
<br />
<blockquote type=3D=22cite=22>
<blockquote type=3D=22cite=22>+ if (of=5Fproperty=5Fread=5Fbool(dev-&gt;o=
f=5Fnode, =22no-output=22))<br /></blockquote>
<br />
And then this too.<br />
<br />
Do we want these generic MMIO bindings (dat, no-output)<br />
in a special document like<br />
Documentation/devicetree/bindings/gpio/gpio-mmio.txt=3F<br />
<br />
Going forward=3F<br /></blockquote>
Ah, I was thinking about Documentation/gpio... Since there's no<br />
way it would go in the devicetree/bindings without having a compatible=3F=
<br />
(And there's technically none). As far as I know the problem here is not<=
br />
that it would be impossible to do that (updating a .dts file is =22easy=22=
...),<br />
but updating .dtb to a tiny flash-rom on the device might not be. So we<b=
r />
have to make every effort to preserve compatibility for those devices<br =
/>
(and old/incomplete/broken dtbs) as long as the device is supported.<br /=
>
<br />
About adding new device:<br />
This will work in the following way:<br />
1. new drives will need to supply their hardware-specific devicetree<br /=
>
binding file to the dt maintainers (This =22vendor,device.txt=22 file<br =
/>
will be like the wd,mbl-gpio.txt - but modified for the hardware<br />
(this is where the template would be handy)<br />
<br />
2. Make a one-liner patch which adds a compatible string to<br />
gpio-mmio.c's bgpio=5Fof=5Fmatch table:<br />
<br />
+ =7B .compatible =3D =22vendor,device=22, .data =3D bgpio=5Fbasic=5Fmmio=
=5Fparse=5Fdt =7D,<br />
<br />
(Of course, not having parses for the =22ngpio=22 property and the flags =
like<br />
big-endian, reg-output-reg,set, unreadable-reg-dir, ... properties from<b=
r />
the get-go is sad, these can add back once a driver/binding needs it).<br=
 />
<br />
I think brcm63xx will be following shortly. So we can test the<br />
procedure.</blockquote>
<blockquote type=3D=22cite=22>
<blockquote type=3D=22cite=22>This patch set mainly deals with refactorin=
gs, but in the<br />
long run we want to slim things down a bit and use standard<br />
bindings I think.<br /></blockquote>
Well, to do that, I think we need to collect enough devices to<br />
make it a real =22class=22 of devices first.<br />
<br />
Regards,<br />
Christian<br />
<br />
=5B0=5D &lt;https://lkml.org/lkml/2016/4/28/921<br /></blockquote>
</div>
</body>
</html>

--57331219_643c9869_b59--
