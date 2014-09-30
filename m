Return-Path: <zhang.lyra@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140929144752.GP16977@sirena.org.uk>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
	<1411992293-7729-4-git-send-email-zhang.lyra@gmail.com>
	<20140929144752.GP16977@sirena.org.uk>
Date: Tue, 30 Sep 2014 17:26:03 +0800
Message-ID: <CAAfSe-sTTfCHaiDfLuTGRo1LwSYrpgbTFcUJC6au1H8-MVfE9Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts/Makefile: Add support for Spreadtrum's
 Shark64 SoC.
From: Lyra Zhang <zhang.lyra@gmail.com>
Content-Type: multipart/alternative; boundary=001a1134cde8e0d9d4050444f80f
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, Kumar Gala <galak@codeaurora.org>, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, Ramkumar Ramachandra <artagnon@gmail.com>, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, Orson Zhai <orsonzhai@gmail.com>, geng.ren@spreadtrum.com, "zhizhou.zhang" <zhizhou.zhang@spreadtrum.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a1134cde8e0d9d4050444f80f
Content-Type: text/plain; charset=UTF-8

Hi, Mark


2014-09-29 22:47 GMT+08:00 Mark Brown <broonie@kernel.org>:

> On Mon, Sep 29, 2014 at 08:04:50PM +0800, zhang.lyra@gmail.com wrote:
>
> >  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
> >  dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
> > +dtb-$(CONFIG_ARCH_SHARK64) += sprd_shark64.dtb
>
> It's better to keep lists in Makefiles and Kconfig sorted
> alphanumerically, that way there's less chance of conflicts when
> applying patches or merging different branches.
>

Thank you very much for your review and explain why this way is better.
I'll address this change in V2.

Best regards,
Chunyan

--001a1134cde8e0d9d4050444f80f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, Mark<br><br></div><div><div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">2014-09-29 22:47 GMT+08:00 Mark Brown =
<span dir=3D"ltr">&lt;<a href=3D"mailto:broonie@kernel.org" target=3D"_blan=
k">broonie@kernel.org</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span class=3D"">On Mon, Sep 29, 2014 at 08:04:50PM +0800, =
<a href=3D"mailto:zhang.lyra@gmail.com">zhang.lyra@gmail.com</a> wrote:<br>
<br>
&gt;=C2=A0 dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_ve-aemv8a.dtb foundation-v=
8.dtb<br>
&gt;=C2=A0 dtb-$(CONFIG_ARCH_XGENE) +=3D apm-mustang.dtb<br>
&gt; +dtb-$(CONFIG_ARCH_SHARK64) +=3D sprd_shark64.dtb<br>
<br>
</span>It&#39;s better to keep lists in Makefiles and Kconfig sorted<br>
alphanumerically, that way there&#39;s less chance of conflicts when<br>
applying patches or merging different branches.<br></blockquote><div>=C2=A0=
</div></div>Thank you very much for your review and explain why this way is=
 better. I&#39;ll address this change in V2.<br><br></div><div class=3D"gma=
il_extra">Best regards,<br></div><div class=3D"gmail_extra">Chunyan<br></di=
v></div></div></div>

--001a1134cde8e0d9d4050444f80f--
