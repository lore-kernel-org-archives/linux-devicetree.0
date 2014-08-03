Return-Path: <gabriel.fernandez@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20140729053149.4906.84119@quantum>
References: <1405437631-23623-1-git-send-email-gabriel.fernandez@linaro.org>
	<1405437631-23623-7-git-send-email-gabriel.fernandez@linaro.org>
	<20140729053149.4906.84119@quantum>
Date: Sun, 3 Aug 2014 12:58:26 +0200
Message-ID: <CAG374jC4V4sDqm_CWZjTTXHDOM4fSAvszpO52uY3CX-zfaAGBw@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] drivers: clk: st: STiH407: Support for Flexgen Clocks
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Content-Type: multipart/alternative; boundary=047d7bdc13407d592904ffb780b4
To: Mike Turquette <mturquette@linaro.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <maxime.coquelin@st.com>, Olivier Bideau <olivier.bideau@st.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bdc13407d592904ffb780b4
Content-Type: text/plain; charset=UTF-8

Thanks Mike !


On 29 July 2014 07:31, Mike Turquette <mturquette@linaro.org> wrote:

> Quoting Gabriel FERNANDEZ (2014-07-15 08:20:22)
> > +static const char ** __init flexgen_get_parents(struct device_node *np,
> > +                                                      int *num_parents)
> > +{
> > +       const char **parents;
> > +       int nparents, i;
> > +
> > +       nparents = of_count_phandle_with_args(np, "clocks",
> "#clock-cells");
>
> FYI, of_clk_get_parent_count provides a nice wrapper around this. Maybe
> you can update it some day? Not a blocking issue for this series.
>
> Regards,
> Mike
>

--047d7bdc13407d592904ffb780b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Mike !</div><div class=3D"gmail_extra"><br><br><div=
 class=3D"gmail_quote">On 29 July 2014 07:31, Mike Turquette <span dir=3D"l=
tr">&lt;<a href=3D"mailto:mturquette@linaro.org" target=3D"_blank">mturquet=
te@linaro.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Quoting Gabriel FERNANDEZ (2014-07-15 08:20:=
22)<br>
<div class=3D"">&gt; +static const char ** __init flexgen_get_parents(struc=
t device_node *np,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *num_parents)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 const char **parents;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int nparents, i;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 nparents =3D of_count_phandle_with_args(np, &qu=
ot;clocks&quot;, &quot;#clock-cells&quot;);<br>
<br>
</div>FYI, of_clk_get_parent_count provides a nice wrapper around this. May=
be<br>
you can update it some day? Not a blocking issue for this series.<br>
<br>
Regards,<br>
Mike<br>
</blockquote></div><br></div>

--047d7bdc13407d592904ffb780b4--
