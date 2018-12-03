Return-Path: <SRS0=QSQ/=OM=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20181203091456.454030-1-tmaimon77@gmail.com> <20181203102240.79a86a26@bbrezillon>
 <CAP6Zq1ib3p=UVC8ct_gvB801_XjTwknXMKPfFCq7=d1Jxv0Dfg@mail.gmail.com> <20181203153046.0554854f@bbrezillon>
In-Reply-To: <20181203153046.0554854f@bbrezillon>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 3 Dec 2018 17:28:23 +0200
Message-ID: <CAP6Zq1h8wbi90NyL20UtKH-vMhJO_f5-oPrWb290302YSMK7SQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
Content-Type: multipart/alternative; boundary="000000000000956a47057c1fb59a"
To: boris.brezillon@bootlin.com
Cc: David Woodhouse <dwmw2@infradead.org>, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-mtd@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000956a47057c1fb59a
Content-Type: text/plain; charset="UTF-8"

Hi Boris,

Thanks for your prompt reply,

We will start to work on it soon.

Regards,

Tomer

On Mon, 3 Dec 2018 at 16:30, Boris Brezillon <boris.brezillon@bootlin.com>
wrote:

> Hi Tomer;
>
> On Mon, 3 Dec 2018 16:09:19 +0200
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>
> > A few comments/input:
> >
> >
> >    1. We have been working on this driver for quite a long time to port
> it
> >    to the latest Linux conventions, polish the code, run tests and reach
> high
> >    quality.
> >    Our partners and customers are waiting to get this driver upstream so
> >    they can freely use it.
>
> Your patch prefix says "v1", so I'm assuming this is the first public
> version. I'm sure you spent a lot of time developing this driver
> internally, but no matter how long it took, it's a first version for
> us, and since we are moving away from the spi_nor controller interface,
> I'm not willing to accept new drivers using this interface.
>
> If you want more background about the spi_nor controller interface
> deprecation, you can read [1].
>
> >    Since this driver is already in final stages and is in very good shape
> >    we will appreciate if you can review this specific driver/interface
> and
> >    help us to upstream it.
>
> Actually, I'd like to do it the other way around: let you rework the
> driver to implement the spi-mem interface and review this version.
> Otherwise I'll be reviewing things I don't intend to merge anyway.
>
> >    2.  As for the new interface, we are open for any discussion and for
> >    porting the driver as required.
> >    We are unsure what is this specific interface and weather it really
> fits
> >    a driver for a Flash Interface Controller module (rather than a SPI
> flash
> >    device).
>
> Didn't go through the code in details, but at first glance, it looks
> like it would fit pretty well.
>
> >    Is it possible to get a sample driver from another Flash Interface
> >    Controller module that was ported to this new interface ?
>
> We recently converted the atmel QSPI driver [2].
>
> Regards,
>
> Boris
>
> [1]
> https://bootlin.com/blog/spi-mem-bringing-some-consistency-to-the-spi-memory-ecosystem/
> [2]
> https://patchwork.kernel.org/project/spi-devel-general/list/?series=38347&state=*
>

--000000000000956a47057c1fb59a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Boris,<div><br></div><div>Thanks for your prompt=C2=A0r=
eply,</div><div><br></div><div>We will start to work on it soon.</div><div>=
<br></div><div>Regards,</div><div><br></div><div>Tomer</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 3 Dec 2018 at 16:30, Boris B=
rezillon &lt;<a href=3D"mailto:boris.brezillon@bootlin.com">boris.brezillon=
@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Tome=
r;<br>
<br>
On Mon, 3 Dec 2018 16:09:19 +0200<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
<br>
&gt; A few comments/input:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 1. We have been working on this driver for quite a long t=
ime to port it<br>
&gt;=C2=A0 =C2=A0 to the latest Linux conventions, polish the code, run tes=
ts and reach high<br>
&gt;=C2=A0 =C2=A0 quality.<br>
&gt;=C2=A0 =C2=A0 Our partners and customers are waiting to get this driver=
 upstream so<br>
&gt;=C2=A0 =C2=A0 they can freely use it.<br>
<br>
Your patch prefix says &quot;v1&quot;, so I&#39;m assuming this is the firs=
t public<br>
version. I&#39;m sure you spent a lot of time developing this driver<br>
internally, but no matter how long it took, it&#39;s a first version for<br=
>
us, and since we are moving away from the spi_nor controller interface,<br>
I&#39;m not willing to accept new drivers using this interface.<br>
<br>
If you want more background about the spi_nor controller interface<br>
deprecation, you can read [1].<br>
<br>
&gt;=C2=A0 =C2=A0 Since this driver is already in final stages and is in ve=
ry good shape<br>
&gt;=C2=A0 =C2=A0 we will appreciate if you can review this specific driver=
/interface and<br>
&gt;=C2=A0 =C2=A0 help us to upstream it.<br>
<br>
Actually, I&#39;d like to do it the other way around: let you rework the<br=
>
driver to implement the spi-mem interface and review this version.<br>
Otherwise I&#39;ll be reviewing things I don&#39;t intend to merge anyway.<=
br>
<br>
&gt;=C2=A0 =C2=A0 2.=C2=A0 As for the new interface, we are open for any di=
scussion and for<br>
&gt;=C2=A0 =C2=A0 porting the driver as required.<br>
&gt;=C2=A0 =C2=A0 We are unsure what is this specific interface and weather=
 it really fits<br>
&gt;=C2=A0 =C2=A0 a driver for a Flash Interface Controller module (rather =
than a SPI flash<br>
&gt;=C2=A0 =C2=A0 device).<br>
<br>
Didn&#39;t go through the code in details, but at first glance, it looks<br=
>
like it would fit pretty well.<br>
<br>
&gt;=C2=A0 =C2=A0 Is it possible to get a sample driver from another Flash =
Interface<br>
&gt;=C2=A0 =C2=A0 Controller module that was ported to this new interface ?=
<br>
<br>
We recently converted the atmel QSPI driver [2].<br>
<br>
Regards,<br>
<br>
Boris<br>
<br>
[1]<a href=3D"https://bootlin.com/blog/spi-mem-bringing-some-consistency-to=
-the-spi-memory-ecosystem/" rel=3D"noreferrer" target=3D"_blank">https://bo=
otlin.com/blog/spi-mem-bringing-some-consistency-to-the-spi-memory-ecosyste=
m/</a><br>
[2]<a href=3D"https://patchwork.kernel.org/project/spi-devel-general/list/?=
series=3D38347&amp;state=3D*" rel=3D"noreferrer" target=3D"_blank">https://=
patchwork.kernel.org/project/spi-devel-general/list/?series=3D38347&amp;sta=
te=3D*</a><br>
</blockquote></div>

--000000000000956a47057c1fb59a--
