Return-Path: <mka@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20160802033215.GB26831@shlinux2>
References: <1469007629-31757-3-git-send-email-peter.chen@nxp.com>
 <c2e3679b-4522-d403-0a98-eb09c5a2c02d@chromium.org> <20160802033215.GB26831@shlinux2>
From: Matthias Kaehlcke <mka@chromium.org>
Date: Tue, 2 Aug 2016 10:29:36 -0700
Message-ID: <CAKZ8rEMto86Lm2_BpSFmoiyKQZ_Y-pOwvm2SeL=RjoBKpzqYjg@mail.gmail.com>
Subject: Re: [v3,2/6] power: add power sequence library
Content-Type: multipart/alternative; boundary=94eb2c05e1129736d005391a0fe4
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Peter Chen <peter.chen@nxp.com>, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, ulf.hansson@linaro.org, broonie@kernel.org, sre@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, linux-usb@vger.kernel.org, arnd@arndb.de, s.hauer@pengutronix.de, mail@maciej.szmigiero.name, troy.kisky@boundarydevices.com, festevam@gmail.com, oscar@naiandei.net, stephen.boyd@linaro.org, linux-pm@vger.kernel.org, stillcompiling@gmail.com, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c05e1129736d005391a0fe4
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 1, 2016 at 8:32 PM, Peter Chen <hzpeterchen@gmail.com> wrote:

> On Fri, Jul 29, 2016 at 01:06:48PM -0700, Matthias Kaehlcke wrote:
> > >...
> > >
> > >+static int pwrseq_generic_get(struct device_node *np, struct pwrseq
> *pwrseq)
> > >+{
> > >+    struct pwrseq_generic *pwrseq_gen = to_generic_pwrseq(pwrseq);
> > >+    enum of_gpio_flags flags;
> > >+    int reset_gpio, ret = 0;
> > >+
> > >+    pwrseq_gen->clk = of_clk_get_by_name(np, NULL);
> > This only gets the first of potentially multiple clocks, is that
> intended?
>
> Matthias, I have added multiple input clocks support at v4 patch set,
> and you are at cc list.


Great, thanks!

--94eb2c05e1129736d005391a0fe4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Aug 1, 2016 at 8:32 PM, Peter Chen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:hzpeterchen@gmail.com" target=3D"_blank">hzpeterchen@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, Ju=
l 29, 2016 at 01:06:48PM -0700, Matthias Kaehlcke wrote:<br>
</span><span class=3D"">&gt; &gt;...<br>
&gt; &gt;<br>
&gt; &gt;+static int pwrseq_generic_get(struct device_node *np, struct pwrs=
eq *pwrseq)<br>
&gt; &gt;+{<br>
&gt; &gt;+=C2=A0 =C2=A0 struct pwrseq_generic *pwrseq_gen =3D to_generic_pw=
rseq(pwrseq);<br>
&gt; &gt;+=C2=A0 =C2=A0 enum of_gpio_flags flags;<br>
&gt; &gt;+=C2=A0 =C2=A0 int reset_gpio, ret =3D 0;<br>
&gt; &gt;+<br>
&gt; &gt;+=C2=A0 =C2=A0 pwrseq_gen-&gt;clk =3D of_clk_get_by_name(np, NULL)=
;<br>
&gt; This only gets the first of potentially multiple clocks, is that inten=
ded?<br>
<br>
</span>Matthias, I have added multiple input clocks support at v4 patch set=
,<br>
and you are at cc list.</blockquote><div><br></div><div>Great, thanks!</div=
></div></div></div>

--94eb2c05e1129736d005391a0fe4--
