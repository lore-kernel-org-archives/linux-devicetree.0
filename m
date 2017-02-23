Return-Path: <SRS0=NU9W=2E=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170222160050.GA1479@katana>
References: <1487755132-7730-1-git-send-email-baoyou.xie@linaro.org>
 <1487755132-7730-3-git-send-email-baoyou.xie@linaro.org> <20170222160050.GA1479@katana>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Thu, 23 Feb 2017 21:03:19 +0800
Message-ID: <CA+DQWky=zhHLk4eGtMtFgxHXp_prWpHdgw-RBTD_pJaVRJzZmQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] i2c: zx2967: add i2c controller driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a114028d2c6a42a0549323c0c
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a114028d2c6a42a0549323c0c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, Wolfram:

Changes for v8:
1=E3=80=81don't reset the hardware and disable the irq while timeouts in
zx2967_i2c_xfer_read_bytes.
2=E3=80=81remove two functions named zx2967_i2c_xfer_read and zx2967_i2c_xf=
er_write,
and merge the codes to zx2967_i2c_xfer_msg.

On 23 February 2017 at 00:00, Wolfram Sang <wsa@the-dreams.de> wrote:

> On Wed, Feb 22, 2017 at 05:18:52PM +0800, Baoyou Xie wrote:
> > This patch adds i2c controller driver for ZTE's zx2967 family.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > Reviewed-by: Shawn Guo <shawnguo@kernel.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Reviewed-by: Jun Nie <jun.nie@linaro.org>
>
> Please provide a changelog what you changed since the last version.
>
>

--001a114028d2c6a42a0549323c0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-m_7398540747629391754gmail-im">Hi, Wo=
lfram:<br><br>Changes for v8:<br>1=E3=80=81don&#39;t reset the hardware and=
 disable the irq while timeouts in zx2967_i2c_xfer_read_bytes.</span><div c=
lass=3D"gmail_extra">2=E3=80=81remove two functions named <span class=3D"gm=
ail-im">zx2967_i2c_xfer_read and </span><span class=3D"gmail-im">zx2967_i2c=
_xfer_write, and merge the codes to zx2967_i2c_xfer_msg.<br><br></span><div=
 class=3D"gmail_quote">On 23 February 2017 at 00:00, Wolfram Sang <span dir=
=3D"ltr">&lt;<a href=3D"mailto:wsa@the-dreams.de" target=3D"_blank">wsa@the=
-dreams.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-m_7398540747629391754gmail-">On Wed, Feb 22=
, 2017 at 05:18:52PM +0800, Baoyou Xie wrote:<br>
&gt; This patch adds i2c controller driver for ZTE&#39;s zx2967 family.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
 target=3D"_blank">baoyou.xie@linaro.org</a>&gt;<br>
&gt; Reviewed-by: Shawn Guo &lt;<a href=3D"mailto:shawnguo@kernel.org" targ=
et=3D"_blank">shawnguo@kernel.org</a>&gt;<br>
&gt; Reviewed-by: Andy Shevchenko &lt;<a href=3D"mailto:andy.shevchenko@gma=
il.com" target=3D"_blank">andy.shevchenko@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org" target=
=3D"_blank">jun.nie@linaro.org</a>&gt;<br>
<br>
</span>Please provide a changelog what you changed since the last version.<=
br>
<br>
</blockquote></div><br></div></div>

--001a114028d2c6a42a0549323c0c--
