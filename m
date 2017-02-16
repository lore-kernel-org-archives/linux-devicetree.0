Return-Path: <SRS0=YH9C=Z5=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHp75VcwAym_ujHfyEJKypsvQftCY5JytDy922xqMM9yKz1GfQ@mail.gmail.com>
References: <1486632753-17363-1-git-send-email-baoyou.xie@linaro.org>
 <1486632753-17363-3-git-send-email-baoyou.xie@linaro.org> <8322ae7c-a74d-c6a3-9cdb-4cd5584f37d4@linaro.org>
 <CAHp75VcwAym_ujHfyEJKypsvQftCY5JytDy922xqMM9yKz1GfQ@mail.gmail.com>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Thu, 16 Feb 2017 08:52:47 +0800
Message-ID: <CA+DQWkzAVu-ULV-4k7fG29LyeKdzfHO2OUqbEQWfEiK2KJZVkw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] i2c: zx2967: add i2c controller driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a1144ca224a31ed05489b37fe
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a1144ca224a31ed05489b37fe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, Andy:

On 14 February 2017 at 17:29, Andy Shevchenko <andy.shevchenko@gmail.com>
wrote:

> On Tue, Feb 14, 2017 at 6:05 AM, Jun Nie <jun.nie@linaro.org> wrote:
> > On 2017=E5=B9=B402=E6=9C=8809=E6=97=A5 17:32, Baoyou Xie wrote:
> >>
>
> First of all, please, Jun, remove tons of lines of over quoting when
> answering to emails with one line question. Respect others time.
>
> See below.
>
> >> +static irqreturn_t zx2967_i2c_isr(int irq, void *dev_id)
> >> +{
> >> +       u32 status;
> >> +       struct zx2967_i2c_info *zx_i2c =3D (struct zx2967_i2c_info
> *)dev_id;
> >> +       unsigned long flags;
> >> +
> >> +       spin_lock_irqsave(&zx_i2c->lock, flags);
> >
> >
> > Is this spin lock really necessary?
>
> If you protect IO and one CPU is in interrupt while another in some
> other function you need to have a spin lock.
>
> I reviewed the code, we often need spin-lock to protect IO and the CPU in
interrupt, but this driver is a bit special, Inward I use the lock to
prevent irq runs in several cpus in parallel.
In fact, it's redundant here. So I will resend a patch to remove it.



> >> +
> >> +       status =3D zx2967_i2c_readl(zx_i2c, REG_STAT) & I2C_INT_MASK;
> >> +       zx2967_i2c_isr_clr(zx_i2c);
> >> +
> >> +       if (status & I2C_ERROR_MASK) {
> >> +               spin_unlock_irqrestore(&zx_i2c->lock, flags);
> >> +               return IRQ_HANDLED;
> >> +       }
> >> +
> >> +       if (status & I2C_TRANS_DONE)
> >> +               complete(&zx_i2c->complete);
> >> +
> >> +       spin_unlock_irqrestore(&zx_i2c->lock, flags);
> >> +
> >> +       return IRQ_HANDLED;
> >> +}
>
> --
> With Best Regards,
> Andy Shevchenko
>

--001a1144ca224a31ed05489b37fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Andy:<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 14 February 2017 at 17:29, Andy Shevchenko <span dir=3D"ltr=
">&lt;<a href=3D"mailto:andy.shevchenko@gmail.com" target=3D"_blank">andy.s=
hevchenko@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Tue, Feb 14, 2017 at 6:05 AM, Jun Nie &lt;<a href=3D"m=
ailto:jun.nie@linaro.org">jun.nie@linaro.org</a>&gt; wrote:<br>
&gt; On 2017=E5=B9=B402=E6=9C=8809=E6=97=A5 17:32, Baoyou Xie wrote:<br>
&gt;&gt;<br>
<br>
</span>First of all, please, Jun, remove tons of lines of over quoting when=
<br>
answering to emails with one line question. Respect others time.<br>
<br>
See below.<br>
<span class=3D""><br>
&gt;&gt; +static irqreturn_t zx2967_i2c_isr(int irq, void *dev_id)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 status;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c =3D (st=
ruct zx2967_i2c_info *)dev_id;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;zx_i2c-&gt;<wbr=
>lock, flags);<br>
&gt;<br>
&gt;<br>
&gt; Is this spin lock really necessary?<br>
<br>
</span>If you protect IO and one CPU is in interrupt while another in some<=
br>
other function you need to have a spin lock.<br>
<span class=3D"im HOEnZb"><br></span></blockquote><div>I reviewed the code,=
 we often need spin-lock to protect IO and the CPU in interrupt, but this d=
river is a bit special, Inward I use the lock to prevent irq runs in severa=
l cpus in parallel.<br></div><div>In fact, it&#39;s redundant here. So I wi=
ll resend a patch to remove it. <br></div><div><br></div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"im HOEnZb">
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D zx2967_i2c_readl(zx_i2c, RE=
G_STAT) &amp; I2C_INT_MASK;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_isr_clr(zx_i2c);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status &amp; I2C_ERROR_MASK) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unloc=
k_irqrestore(&amp;zx_<wbr>i2c-&gt;lock, flags);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ=
_HANDLED;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status &amp; I2C_TRANS_DONE)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complete(&=
amp;zx_i2c-&gt;complete);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;zx_<wbr>i2=
c-&gt;lock, flags);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt;&gt; +}<br>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
With Best Regards,<br>
Andy Shevchenko<br>
</div></div></blockquote></div><br></div></div>

--001a1144ca224a31ed05489b37fe--
