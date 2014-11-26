Return-Path: <zhang.lyra@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3490516.nCDXzA8J8x@wuerfel>
References: <1416917818-10506-5-git-send-email-chunyan.zhang@spreadtrum.com>
	<3490516.nCDXzA8J8x@wuerfel>
Date: Wed, 26 Nov 2014 10:32:35 +0800
Message-ID: <CAAfSe-uoXOJ8=agCFuBnXhj7nBBTskQ=8_jMtv_SAjor2gfO2w@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] arm64: Add support for Spreadtrum's Sharkl64
 Platform in Kconfig and defconfig
From: Lyra Zhang <zhang.lyra@gmail.com>
Content-Type: multipart/alternative; boundary=f46d0418270228c4690508b9d76a
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>, grant.likely@linaro.org, "robh+dt@kernel.org" <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "jslaby@suse.cz" <jslaby@suse.cz>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ramkumar Ramachandra <artagnon@gmail.com>, "rrichter@cavium.com" <rrichter@cavium.com>, Will Deacon <will.deacon@arm.com>, gnomes@lxorguk.ukuu.org.uk, corbet@lwn.net, jason@lakedaemon.net, Mark Brown <broonie@kernel.org>, heiko@sntech.de, shawn.guo@freescale.com, florian.vaussard@epfl.ch, andrew@lunn.ch, hytszk@gmail.com, Orson Zhai <orsonzhai@gmail.com>, "geng.ren@spreadtrum.com" <geng.ren@spreadtrum.com>, "zhizhou.zhang" <zhizhou.zhang@spreadtrum.com>, lanqing.liu@spreadtrum.com, =?UTF-8?B?V2VpIFFpYW8gKOS5lOS8nyk=?= <wei.qiao@spreadtrum.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sprdlinux@freelists.org" <sprdlinux@freelists.org>, linux-doc@vger.kernel.org, linux-serial@vger.kernel.org, linux-api@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--f46d0418270228c4690508b9d76a
Content-Type: text/plain; charset=UTF-8

2014-11-25 20:57 GMT+08:00 Arnd Bergmann <arnd@arndb.de>:

> On Tuesday 25 November 2014 20:16:57 Chunyan Zhang wrote:
> >
> > +menuconfig ARCH_SPRD
> > +       bool "Spreadtrum SoC platform"
> > +       depends on ARM64
> > +       help
> > +         Support for Spreadtrum ARM based SoCs
> > +
> > +if ARCH_SPRD
> > +
> > +config ARCH_SHARKL64
> > +       bool "Sharkl64 SoC Platform"
> > +       help
> > +         Sharkl64 is a Spreadtrum's SoC Platform which is based
> > +         on ARM 64-bit processor core including
> > +           sc9836
> > +
> > +endif #ARCH_SPRD
> > +
>
> I don't think we need multiple levels here, it should be enough to
> have either ARCH_SPRD or ARCH_SHARKL64, because all device drivers
> are going to be optional anyway. Typically a Kconfig symbol covers
> all SoCs that are related, so if you Spreadtrum are doing both
> phone and server chips and these are designed independently, you
> would have two symbols, but if you only expect to see phone chips
> here that are all derived from the same product line, using ARCH_SPRD
> to refer to all of them should be enough.
>
>         Arnd
>

For now, we have only one platform(Sharkl64) based on ARM64 been submitted,
but we're intending to add support for more our platforms based on ARM64 or
ARM32 in the future. There are many common devices on these platforms, such
as serial. Our idea would be that if we had a 'menuconfig ARCH_SPRD' in the
Kconfig, these common devices only need to depend on ARCH_SPRD in the
respective Kconfig, otherwise they may depend on a few Kconfig symbols for
every platforms which include these common devices.

So, do you think whether we should define a menuconfig(ARCH_SPRD) in the
Kconfig for this case ?

Thanks!

Best regards,
Chunyan

--f46d0418270228c4690508b9d76a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2014-11-25 20:57 GMT+08:00 Arnd Bergmann <span dir=3D"ltr">&lt;<a href=
=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</span>:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"">On Tue=
sday 25 November 2014 20:16:57 Chunyan Zhang wrote:<br>
&gt;<br>
&gt; +menuconfig ARCH_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Spreadtrum SoC platform&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARM64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for Spreadtrum ARM based So=
Cs<br>
&gt; +<br>
&gt; +if ARCH_SPRD<br>
&gt; +<br>
&gt; +config ARCH_SHARKL64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Sharkl64 SoC Platform&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sharkl64 is a Spreadtrum&#39;s SoC =
Platform which is based<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on ARM 64-bit processor core includ=
ing<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc9836<br>
&gt; +<br>
&gt; +endif #ARCH_SPRD<br>
&gt; +<br>
<br>
</span>I don&#39;t think we need multiple levels here, it should be enough =
to<br>
have either ARCH_SPRD or ARCH_SHARKL64, because all device drivers<br>
are going to be optional anyway. Typically a Kconfig symbol covers<br>
all SoCs that are related, so if you Spreadtrum are doing both<br>
phone and server chips and these are designed independently, you<br>
would have two symbols, but if you only expect to see phone chips<br>
here that are all derived from the same product line, using ARCH_SPRD<br>
to refer to all of them should be enough.<br>
<span class=3D""><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br></font></span></blockquote><div>=C2=A0<=
/div></div>For now, we have only one platform(Sharkl64) based on ARM64 been=
 submitted, but we&#39;re intending to add support for more our platforms b=
ased on ARM64 or ARM32 in the future. There are many common devices on thes=
e platforms, such as serial. Our idea would be that if we had a &#39;menuco=
nfig ARCH_SPRD&#39; in the Kconfig, these common devices  only need to depe=
nd on ARCH_SPRD in the <span></span><span class=3D"" id=3D"tran_1_16">respe=
ctive</span><span> </span>Kconfig, otherwise they may depend on a few Kconf=
ig symbols for every platforms which include these common devices. <br><br>=
</div><div class=3D"gmail_extra">So, do you think whether we should define =
a menuconfig(ARCH_SPRD) in the Kconfig for this case ?<br><br></div><div cl=
ass=3D"gmail_extra">Thanks!<br><br></div><div class=3D"gmail_extra">Best re=
gards,<br></div><div class=3D"gmail_extra">Chunyan<br></div><div class=3D"g=
mail_extra"><br></div></div>

--f46d0418270228c4690508b9d76a--
