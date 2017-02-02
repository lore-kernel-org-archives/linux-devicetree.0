Return-Path: <SRS0=tIwT=ZP=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170202050425.GA7360@localhost.localdomain>
References: <1484714522-26651-1-git-send-email-baoyou.xie@linaro.org>
 <1484714522-26651-3-git-send-email-baoyou.xie@linaro.org> <20170202050425.GA7360@localhost.localdomain>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Thu, 2 Feb 2017 16:48:31 +0800
Message-ID: <CA+DQWkx8X7uz4rZKaCx+Mo0Mb5yE-53YCDLx56tSOf4mZkthcw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] thermal: zx2967: add thermal driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a1140338ad30ba70547883a1b
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>, rui.zhang@intel.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-pm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a1140338ad30ba70547883a1b
Content-Type: text/plain; charset=UTF-8

On 2 February 2017 at 13:04, Eduardo Valentin <edubezval@gmail.com> wrote:

> Hey Bao,
>
> On Wed, Jan 18, 2017 at 12:42:02PM +0800, Baoyou Xie wrote:
> > This patch adds thermal driver for ZTE's zx2967 family.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
>
> <cut>
>
> > +
> > +     /*
> > +      * Calculate temperature
> > +      *   922        initial value of calibration cure
> > +      *   1.951      slope of calibration cure
> > +      */
> > +     *temp = DIV_ROUND_CLOSEST((val - 922) * 1000, 1951);
>
> You can describe the offset and slope using DT and avoid this to be hard
> coded in your driver. Besides, if you read offset and slope from DT,
> your driver will be ready for any upcoming sensor addition that you may
> want to support in future, given that would required slope and offset
> change, per sensor, per chip version.
>
> Can you please check if you can move these to DT?
>
>
It's a good idea:)

I will modify code and test it. Please wait for my next version patch.

Thanks for you.


> BR,
> > --
> > 2.7.4
> >
>

--001a1140338ad30ba70547883a1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 2 February 2017 at 13:04, Eduardo Valentin <span dir=3D"ltr">&lt;<a =
href=3D"mailto:edubezval@gmail.com" target=3D"_blank">edubezval@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Bao,<br>
<span class=3D""><br>
On Wed, Jan 18, 2017 at 12:42:02PM +0800, Baoyou Xie wrote:<br>
&gt; This patch adds thermal driver for ZTE&#39;s zx2967 family.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
<br>
</span>&lt;cut&gt;<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Calculate temperature<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0922=C2=A0 =C2=A0 =C2=A0 =C2=A0 ini=
tial value of calibration cure<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A01.951=C2=A0 =C2=A0 =C2=A0 slope of=
 calibration cure<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*temp =3D DIV_ROUND_CLOSEST((val - 922) * 1000, 1=
951);<br>
<br>
</span>You can describe the offset and slope using DT and avoid this to be =
hard<br>
coded in your driver. Besides, if you read offset and slope from DT,<br>
your driver will be ready for any upcoming sensor addition that you may<br>
want to support in future, given that would required slope and offset<br>
change, per sensor, per chip version.<br>
<br>
Can you please check if you can move these to DT?<br>
<br></blockquote><div>=C2=A0</div><div>It&#39;s a good idea:)<br><br></div>=
<div>I will modify code and test it. Please wait for my next version patch.=
<br><br></div><div>Thanks for you.<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
BR,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</font></span></blockquote></div><br></div></div>

--001a1140338ad30ba70547883a1b--
