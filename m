Return-Path: <SRS0=bZSF=JF=gmail.com=ctatlor97@kernel.org>
MIME-Version: 1.0
References: <1529415925-28915-1-git-send-email-sricharan@codeaurora.org>
 <1529415925-28915-14-git-send-email-sricharan@codeaurora.org> <f195e30e-bef3-9352-9584-fec35631ec5e@arm.com>
In-Reply-To: <f195e30e-bef3-9352-9584-fec35631ec5e@arm.com>
From: Craig Tatlor <ctatlor97@gmail.com>
Date: Tue, 19 Jun 2018 15:49:03 +0100
Message-ID: <CAALoacqzwcZjfDENwATsaDC87UmLnksfbYsj6EZTz2t8L-=YiQ@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] cpufreq: Add module to register cpufreq on
 Krait CPUs
Content-Type: multipart/alternative; boundary="000000000000342194056effc973"
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sricharan R <sricharan@codeaurora.org>, Rob Herring <robh@kernel.org>, viresh.kumar@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, rjw@rjwysocki.net, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux@arm.linux.org.uk, thierry.escande@linaro.org
List-ID: <devicetree@vger.kernel.org>

--000000000000342194056effc973
Content-Type: text/plain; charset="UTF-8"

The pvs refuse check is incorrect... With downstream it says it isn't blown
and that it is 11, which also happens on upstream if I import it's efuse
reading code from an older revision, or comment out the check.

Also, I'm still getting my issue about clocks above 2,147,483,647hz however
I think this may be related to the division in the hfpll driver so I'll
have a debug around there.

On Tue, 19 Jun 2018, 14:56 Sudeep Holla, <sudeep.holla@arm.com> wrote:

>
>
> On 19/06/18 14:45, Sricharan R wrote:
> > From: Stephen Boyd <sboyd@codeaurora.org>
> >
> > Register a cpufreq-generic device whenever we detect that a
> > "qcom,krait" compatible CPU is present in DT.
> >
>
> Just curious to know how different is this from qcom kryo driver
> that was added recently. IIRC even that gets the speedbin from nvmem.
> Can they be merged ? I don't see need to have different driver for Krait
> and Kryo CPUs when the code is not even remotely related to CPU type.
>
> Sorry if I have missed anything from previous versions, I just happen
> to open and looked at this series first time today.
>
> --
> Regards,
> Sudeep
>

--000000000000342194056effc973
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>The pvs refuse check is incorrect... With downstream=
 it says it isn&#39;t blown and that it is 11, which also happens on upstre=
am if I import it&#39;s efuse reading code from an older revision, or comme=
nt out the check.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Also, =
I&#39;m still getting my issue about clocks above=C2=A02,147,483,647hz howe=
ver I think this may be related to the division in the hfpll driver so I&#3=
9;ll have a debug around there.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr">On Tue, =
19 Jun 2018, 14:56 Sudeep Holla, &lt;<a href=3D"mailto:sudeep.holla@arm.com=
">sudeep.holla@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
<br>
On 19/06/18 14:45, Sricharan R wrote:<br>
&gt; From: Stephen Boyd &lt;<a href=3D"mailto:sboyd@codeaurora.org" target=
=3D"_blank" rel=3D"noreferrer">sboyd@codeaurora.org</a>&gt;<br>
&gt; <br>
&gt; Register a cpufreq-generic device whenever we detect that a<br>
&gt; &quot;qcom,krait&quot; compatible CPU is present in DT.<br>
&gt; <br>
<br>
Just curious to know how different is this from qcom kryo driver<br>
that was added recently. IIRC even that gets the speedbin from nvmem.<br>
Can they be merged ? I don&#39;t see need to have different driver for Krai=
t<br>
and Kryo CPUs when the code is not even remotely related to CPU type.<br>
<br>
Sorry if I have missed anything from previous versions, I just happen<br>
to open and looked at this series first time today.<br>
<br>
-- <br>
Regards,<br>
Sudeep<br>
</blockquote></div></div></div>

--000000000000342194056effc973--
