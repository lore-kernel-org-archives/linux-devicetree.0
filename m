Return-Path: <SRS0=ivNv=VX=linaro.org=amit.kucheria@kernel.org>
MIME-Version: 1.0
References: <cover.1564091601.git.amit.kucheria@linaro.org> <20190726103605.GB3327@onstation.org>
In-Reply-To: <20190726103605.GB3327@onstation.org>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Fri, 26 Jul 2019 16:14:42 +0530
Message-ID: <CAP245DXpJaO6Kw4YLNe1j=mCUPqdcz8EBbWrFck8Gq5LrGmO-w@mail.gmail.com>
Subject: Re: [PATCH 00/15] thermal: qcom: tsens: Add interrupt support
Content-Type: multipart/alternative; boundary="0000000000008f3ebb058e933b4a"
To: Brian Masney <masneyb@onstation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, marc.w.gonzalez@free.fr, devicetree@vger.kernel.org, linux-pm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--0000000000008f3ebb058e933b4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jul, 2019, 16:06 Brian Masney, <masneyb@onstation.org> wrote:

> Hi Amit,
>
> On Fri, Jul 26, 2019 at 03:48:35AM +0530, Amit Kucheria wrote:
> > Add interrupt support to TSENS. The first 6 patches are general fixes a=
nd
> > cleanups to the driver before interrupt support is introduced.
> >
> > This series has been developed against qcs404 and sdm845 and then teste=
d
> on
> > msm8916. Testing on msm8998 and msm8974 would be appreciated since I
> don't
> > have hardware handy. Further, I plan to test on msm8996 and also submit
> to
> > kernelci.
> >
> > I'm sending this out for more review to get help with testing.
>
> I can test this on msm8974 for you using a Nexus 5. Here's what I've
> done so far
>

Thanks, I was hoping that would be the case given your effort getting Nexus
5 supported. =F0=9F=98=80

The device tree nodes appear in sysfs:
>
> / # ls -1 /sys/class/thermal/
> cooling_device0
> cooling_device1
> thermal_zone0
> thermal_zone1
> thermal_zone2
> thermal_zone3
> thermal_zone4
> thermal_zone5
> thermal_zone6
> thermal_zone7
> thermal_zone8
> thermal_zone9
>
> The various temperatures were in the upper 40s and I threw some work at
> all four CPU cores to warm up the phone and watched the various
> temperatures rise:
>
> / # for i in $(seq 0 9) ; do
> > TYPE=3D$(cat /sys/class/thermal/thermal_zone$i/type)
> > TEMP=3D$(cat /sys/class/thermal/thermal_zone$i/temp)
> > echo "$TYPE =3D $TEMP"
> > done
> cpu-thermal0 =3D 66000
> cpu-thermal1 =3D 66000
> cpu-thermal2 =3D 66000
> cpu-thermal3 =3D 66000
> q6-dsp-thermal =3D 60000
> modemtx-thermal =3D 57000
> video-thermal =3D 61000
> wlan-thermal =3D 65000
> gpu-thermal-top =3D 61000
> gpu-thermal-bottom =3D 59000
>
> To test the interrupt support, I lowered all of the temperature trips to
> 51C but I'm not sure where to read that notification. I assume one of
> the cooling devices or a governor should be started? Sorry but I haven't
> done any work in the thermal subsystem yet and I'm short on time this
> morning to investigate right now.
>

For now, just checking if the tsens interrupt fires in /proc/interrupts
should be fine. I have another patch to add more info to debugfs, that
should give a more detailed log.

How well does cpufreq work on 8974? I haven't looked at it yet. Well need
that for throttling.


Brian
>

--0000000000008f3ebb058e933b4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 26 Jul, 2019, 16:06 Brian Masney, &lt;<a href=
=3D"mailto:masneyb@onstation.org">masneyb@onstation.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hi Amit,<br>
<br>
On Fri, Jul 26, 2019 at 03:48:35AM +0530, Amit Kucheria wrote:<br>
&gt; Add interrupt support to TSENS. The first 6 patches are general fixes =
and<br>
&gt; cleanups to the driver before interrupt support is introduced.<br>
&gt; <br>
&gt; This series has been developed against qcs404 and sdm845 and then test=
ed on<br>
&gt; msm8916. Testing on msm8998 and msm8974 would be appreciated since I d=
on&#39;t<br>
&gt; have hardware handy. Further, I plan to test on msm8996 and also submi=
t to<br>
&gt; kernelci.<br>
&gt; <br>
&gt; I&#39;m sending this out for more review to get help with testing.<br>
<br>
I can test this on msm8974 for you using a Nexus 5. Here&#39;s what I&#39;v=
e<br>
done so far<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thanks, I was hoping that would be the case given your effort ge=
tting Nexus 5 supported. =F0=9F=98=80</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
The device tree nodes appear in sysfs:<br>
<br>
/ # ls -1 /sys/class/thermal/<br>
cooling_device0<br>
cooling_device1<br>
thermal_zone0<br>
thermal_zone1<br>
thermal_zone2<br>
thermal_zone3<br>
thermal_zone4<br>
thermal_zone5<br>
thermal_zone6<br>
thermal_zone7<br>
thermal_zone8<br>
thermal_zone9<br>
<br>
The various temperatures were in the upper 40s and I threw some work at<br>
all four CPU cores to warm up the phone and watched the various<br>
temperatures rise:<br>
<br>
/ # for i in $(seq 0 9) ; do<br>
&gt; TYPE=3D$(cat /sys/class/thermal/thermal_zone$i/type)<br>
&gt; TEMP=3D$(cat /sys/class/thermal/thermal_zone$i/temp)<br>
&gt; echo &quot;$TYPE =3D $TEMP&quot;<br>
&gt; done<br>
cpu-thermal0 =3D 66000<br>
cpu-thermal1 =3D 66000<br>
cpu-thermal2 =3D 66000<br>
cpu-thermal3 =3D 66000<br>
q6-dsp-thermal =3D 60000<br>
modemtx-thermal =3D 57000<br>
video-thermal =3D 61000<br>
wlan-thermal =3D 65000<br>
gpu-thermal-top =3D 61000<br>
gpu-thermal-bottom =3D 59000<br>
<br>
To test the interrupt support, I lowered all of the temperature trips to<br=
>
51C but I&#39;m not sure where to read that notification. I assume one of<b=
r>
the cooling devices or a governor should be started? Sorry but I haven&#39;=
t<br>
done any work in the thermal subsystem yet and I&#39;m short on time this<b=
r>
morning to investigate right now.<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">For now, just checking if the tsens interr=
upt fires in /proc/interrupts should be fine. I have another patch to add m=
ore info to debugfs, that should give a more detailed log.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">H=
ow well does cpufreq work on 8974? I haven&#39;t looked at it yet. Well nee=
d that for throttling.</span><br></div><div dir=3D"auto"><span style=3D"fon=
t-family:sans-serif"><br></span></div><div dir=3D"auto"><span style=3D"font=
-family:sans-serif"><br></span></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
Brian<br>
</blockquote></div></div></div>

--0000000000008f3ebb058e933b4a--
