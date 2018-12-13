Return-Path: <SRS0=lBuG=OW=linaro.org=loic.poulain@kernel.org>
MIME-Version: 1.0
References: <1544634806-1037-1-git-send-email-loic.poulain@linaro.org> <8c92dc30-cfbe-00e2-ae70-243455549ecd@codeaurora.org>
In-Reply-To: <8c92dc30-cfbe-00e2-ae70-243455549ecd@codeaurora.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 13 Dec 2018 08:55:24 +0100
Message-ID: <CAMZdPi8-9d11FXKJinpJkJyhi8fcysbYVDjG8aDwbY3s=mLarw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: apq8096-db820c: Increase load on l21 for SDCARD
Content-Type: multipart/alternative; boundary="00000000000045a7de057ce2a545"
To: jhugo@codeaurora.org
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--00000000000045a7de057ce2a545
Content-Type: text/plain; charset="UTF-8"

Hi Jeffrey,


On Wed, 12 Dec 2018 at 18:23, Jeffrey Hugo <jhugo@codeaurora.org> wrote:

> On 12/12/2018 10:13 AM, Loic Poulain wrote:
> > In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
> > VMMC, needs to be increased in order to prevent any voltage drop issues
> > (due to limited current) happening with some SDCARDS or during specific
> > operations (e.g. write).
> >
> > Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994 regulator node)
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > index 104cad9..c15e2c0 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > @@ -634,6 +634,8 @@
> >                               l21 {
> >                                       regulator-min-microvolt =
> <2950000>;
> >                                       regulator-max-microvolt =
> <2950000>;
> > +                                     regulator-allow-set-load;
> > +                                     regulator-system-load = <200000>;
> >                               };
> >                               l22 {
> >                                       regulator-min-microvolt =
> <3300000>;
> >
>
> I'm curious, why not update sdhci-msm to set the load on the regulator?
>

Yes you're right, and I saw that there is ongoing work:
https://patchwork.kernel.org/patch/10630731/

Howerver I thought this change would be a quicker fix and easier to
backport in stable trees.
I assume all the device-tree vmmc loads will be removed at some point when
driven from sdhci.

Regards,
Loic


>
> --
> Jeffrey Hugo
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm
> Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
>

--00000000000045a7de057ce2a545
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Jeffrey,</div><div><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 12 Dec 2018 at 18:23, J=
effrey Hugo &lt;<a href=3D"mailto:jhugo@codeaurora.org" target=3D"_blank">j=
hugo@codeaurora.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 12/12/2018 10:13 AM, Loic Poulain wrote:<br>
&gt; In the same way as for msm8974-hammerhead, l21 load, used for SDCARD<b=
r>
&gt; VMMC, needs to be increased in order to prevent any voltage drop issue=
s<br>
&gt; (due to limited current) happening with some SDCARDS or during specifi=
c<br>
&gt; operations (e.g. write).<br>
&gt; <br>
&gt; Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994 regulator no=
de)<br>
&gt; Signed-off-by: Loic Poulain &lt;<a href=3D"mailto:loic.poulain@linaro.=
org" target=3D"_blank">loic.poulain@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64=
/boot/dts/qcom/apq8096-db820c.dtsi<br>
&gt; index 104cad9..c15e2c0 100644<br>
&gt; --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi<br>
&gt; +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi<br>
&gt; @@ -634,6 +634,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l21 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regula=
tor-min-microvolt =3D &lt;2950000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regula=
tor-max-microvolt =3D &lt;2950000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-al=
low-set-load;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-sy=
stem-load =3D &lt;200000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l22 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regula=
tor-min-microvolt =3D &lt;3300000&gt;;<br>
&gt; <br>
<br>
I&#39;m curious, why not update sdhci-msm to set the load on the regulator?=
<br></blockquote><div><br></div><div>Yes you&#39;re right, and I saw that t=
here is ongoing work:</div><div><a href=3D"https://patchwork.kernel.org/pat=
ch/10630731/">https://patchwork.kernel.org/patch/10630731/</a></div><div><b=
r></div><div>Howerver I thought this change would be a quicker fix and easi=
er to backport in stable trees.</div><div>I assume all the device-tree vmmc=
 loads will be removed at some point when driven from sdhci.<br></div><div>=
<br></div><div>Regards,</div><div>Loic<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Jeffrey Hugo<br>
Qualcomm Datacenter Technologies as an affiliate of Qualcomm <br>
Technologies, Inc.<br>
Qualcomm Technologies, Inc. is a member of the<br>
Code Aurora Forum, a Linux Foundation Collaborative Project.<br>
</blockquote></div></div></div>

--00000000000045a7de057ce2a545--
