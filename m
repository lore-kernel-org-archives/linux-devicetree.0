Return-Path: <michael.scott@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkda9fcUjtEuezEa-DdU_Q_OcE-kArRpY7RGp+aTFWWf=rA@mail.gmail.com>
References: <20161026233228.15219-1-michael.scott@linaro.org> <CACRpkda9fcUjtEuezEa-DdU_Q_OcE-kArRpY7RGp+aTFWWf=rA@mail.gmail.com>
From: Michael Scott <michael.scott@linaro.org>
Date: Sat, 29 Oct 2016 09:26:28 -0700
Message-ID: <CAEz3QY0aXuhmcHKTpRZzKvEB1cbpMe4W9McE-2bGsbFvMHAa6g@mail.gmail.com>
Subject: Re: [PATCH V2] pinctrl: qcom: Add msm8994 pinctrl driver
Content-Type: multipart/alternative; boundary=001a11c16510e78fce0540036f3d
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

--001a11c16510e78fce0540036f3d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Oct 29, 2016 1:27 AM, "Linus Walleij" <linus.walleij@linaro.org> wrote:
>
> On Thu, Oct 27, 2016 at 1:32 AM, Michael Scott <michael.scott@linaro.org>
wrote:
>
> > Initial pinctrl driver for QCOM msm8994 platforms.
> >
> > In order to continue the initial board support for QCOM msm8994/msm8992
> > presented in patches from Jeremy McNicoll <jeremymc@redhat.com>, let's
put
> > a proper pinctrl driver in place.
> >
> > Currently, the DT for these platforms uses the msm8x74 pinctrl driver
to enable
> > basic UART.  Beyond the first few pins the rest are different enough to
justify
> > it's own driver.
> >
> > Note: This driver is also be used by QCOM's msm8992 platform as it's
TLM block
> > is the same.
> >
> > - Initial formatting and style was taken from the msm8x74 pinctrl
driver added
> >   by Bj=C3=B6rn Andersson <bjorn.andersson@linaro.org>
> > - Data was then adjusted per QCOM MSM8994 documentation for Top Level
Multiplexing
> > - Bindings documentation was based on qcom,msm8996-pinctrl.txt by
> >   Joonwoo Park <joonwoop@codeaurora.org> and then modified for msm8994
content
> >
> > Signed-off-by: Michael Scott <michael.scott@linaro.org>
> > ---
> >
> > V1 -> V2: fixed missing FUNCTION(nav_pps) and removed 3 odd newlines
between blsp_i2c4_groups and cci_timer0_groups
>
> Looks fine to me, just like the other Qcom drivers.
>
> I just want Bj=C3=B6rn Andersson's ACK before merging, Bj=C3=B6rn?

FYI: I asked Stephen if he could find someone else with tech docs to do a
data review.  This may or may not happen depending on the internal interest
level and/or current work load.  It will probably take a week or so to get
sorted out.

Worst case is no extra set of eyes on the data, and as issues are found we
can fix them in follow up patches.  The driver works for the current
msm8994 patches submitted by Jeremy.

Michael Scott

>
> Yours,
> Linus Walleij

--001a11c16510e78fce0540036f3d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Oct 29, 2016 1:27 AM, &quot;Linus Walleij&quot; &lt;<a hr=
ef=3D"mailto:linus.walleij@linaro.org">linus.walleij@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; On Thu, Oct 27, 2016 at 1:32 AM, Michael Scott &lt;<a href=3D"mailto:m=
ichael.scott@linaro.org">michael.scott@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Initial pinctrl driver for QCOM msm8994 platforms.<br>
&gt; &gt;<br>
&gt; &gt; In order to continue the initial board support for QCOM msm8994/m=
sm8992<br>
&gt; &gt; presented in patches from Jeremy McNicoll &lt;<a href=3D"mailto:j=
eremymc@redhat.com">jeremymc@redhat.com</a>&gt;, let&#39;s put<br>
&gt; &gt; a proper pinctrl driver in place.<br>
&gt; &gt;<br>
&gt; &gt; Currently, the DT for these platforms uses the msm8x74 pinctrl dr=
iver to enable<br>
&gt; &gt; basic UART.=C2=A0 Beyond the first few pins the rest are differen=
t enough to justify<br>
&gt; &gt; it&#39;s own driver.<br>
&gt; &gt;<br>
&gt; &gt; Note: This driver is also be used by QCOM&#39;s msm8992 platform =
as it&#39;s TLM block<br>
&gt; &gt; is the same.<br>
&gt; &gt;<br>
&gt; &gt; - Initial formatting and style was taken from the msm8x74 pinctrl=
 driver added<br>
&gt; &gt;=C2=A0 =C2=A0by Bj=C3=B6rn Andersson &lt;<a href=3D"mailto:bjorn.a=
ndersson@linaro.org">bjorn.andersson@linaro.org</a>&gt;<br>
&gt; &gt; - Data was then adjusted per QCOM MSM8994 documentation for Top L=
evel Multiplexing<br>
&gt; &gt; - Bindings documentation was based on qcom,msm8996-pinctrl.txt by=
<br>
&gt; &gt;=C2=A0 =C2=A0Joonwoo Park &lt;<a href=3D"mailto:joonwoop@codeauror=
a.org">joonwoop@codeaurora.org</a>&gt; and then modified for msm8994 conten=
t<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Michael Scott &lt;<a href=3D"mailto:michael.scott@=
linaro.org">michael.scott@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; V1 -&gt; V2: fixed missing FUNCTION(nav_pps) and removed 3 odd ne=
wlines between blsp_i2c4_groups and cci_timer0_groups<br>
&gt;<br>
&gt; Looks fine to me, just like the other Qcom drivers.<br>
&gt;<br>
&gt; I just want Bj=C3=B6rn Andersson&#39;s ACK before merging, Bj=C3=B6rn?=
</p>
<p dir=3D"ltr">FYI: I asked Stephen if he could find someone else with tech=
 docs to do a data review.=C2=A0 This may or may not happen depending on th=
e internal interest level and/or current work load.=C2=A0 It will probably =
take a week or so to get sorted out.</p>
<p dir=3D"ltr">Worst case is no extra set of eyes on the data, and as issue=
s are found we can fix them in follow up patches.=C2=A0 The driver works fo=
r the current msm8994 patches submitted by Jeremy.</p>
<p dir=3D"ltr">Michael Scott</p>
<p dir=3D"ltr">&gt;<br>
&gt; Yours,<br>
&gt; Linus Walleij<br></p>

--001a11c16510e78fce0540036f3d--
