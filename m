Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1455848322-2210-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455848322-2210-1-git-send-email-shawn.lin@rock-chips.com>
Date: Fri, 19 Feb 2016 23:23:02 +0100
Message-ID: <CAPDyKFojtZamH-xwM9UTyWdeW3SSSS3-uUyVr2R1t9NkwCXvYg@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 0/2] Add phy support for arasan,sdhci-5.1
From: Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: multipart/alternative; boundary=001a1141fa822d700d052c26edc2
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>
List-ID: <devicetree@vger.kernel.org>

--001a1141fa822d700d052c26edc2
Content-Type: text/plain; charset=UTF-8

Den 19 feb 2016 3:24 fm skrev "Shawn Lin" <shawn.lin@rock-chips.com>:
>
>
> Hello Ulf and Adrian,
>
> Sorry for delay the new version for this topic. Actually I have no
> platform available to test phy stuff since v4. Now, I can rework it.:)
> I remove rpm support from v5 because this patchset just need to focus
> on phy stuff, which will make the changes more precise. Another reason
> is that phy_power_on take too much time from rpm, however the power profit
> gained from phy_power_off is little due to the low power mechanism with
the
> phy itself observed from experiments.
>
> v4 can be found here:
> https://patchwork.kernel.org/patch/7463251/
>
> Note:
> Phy is mandatory requirement for arasan,sdhci-5.1, so we introduce
> generic phy support for sdhci-of-arasan.
>
>
> Shawn Lin (2):
>   Documentation: bindings: add description of phy for sdhci-of-arasan
>   mmc: sdhci-of-arasan: add phy support for sdhci-of-arasan
>
>  .../devicetree/bindings/mmc/arasan,sdhci.txt       | 20 ++++++-
>  drivers/mmc/host/sdhci-of-arasan.c                 | 66
++++++++++++++++++++--
>  2 files changed, 80 insertions(+), 6 deletions(-)
>
> --
> 2.3.7
>
>

This looks good to me! When acks has been received I am ready to queue it
for next.

Kind regards
Uffe

--001a1141fa822d700d052c26edc2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
Den 19 feb 2016 3:24 fm skrev &quot;Shawn Lin&quot; &lt;<a href=3D"mailto:s=
hawn.lin@rock-chips.com">shawn.lin@rock-chips.com</a>&gt;:<br>
&gt;<br>
&gt;<br>
&gt; Hello Ulf and Adrian,<br>
&gt;<br>
&gt; Sorry for delay the new version for this topic. Actually I have no<br>
&gt; platform available to test phy stuff since v4. Now, I can rework it.:)=
<br>
&gt; I remove rpm support from v5 because this patchset just need to focus<=
br>
&gt; on phy stuff, which will make the changes more precise. Another reason=
<br>
&gt; is that phy_power_on take too much time from rpm, however the power pr=
ofit<br>
&gt; gained from phy_power_off is little due to the low power mechanism wit=
h the<br>
&gt; phy itself observed from experiments.<br>
&gt;<br>
&gt; v4 can be found here:<br>
&gt; <a href=3D"https://patchwork.kernel.org/patch/7463251/">https://patchw=
ork.kernel.org/patch/7463251/</a><br>
&gt;<br>
&gt; Note:<br>
&gt; Phy is mandatory requirement for arasan,sdhci-5.1, so we introduce<br>
&gt; generic phy support for sdhci-of-arasan.<br>
&gt;<br>
&gt;<br>
&gt; Shawn Lin (2):<br>
&gt; =C2=A0 Documentation: bindings: add description of phy for sdhci-of-ar=
asan<br>
&gt; =C2=A0 mmc: sdhci-of-arasan: add phy support for sdhci-of-arasan<br>
&gt;<br>
&gt; =C2=A0.../devicetree/bindings/mmc/arasan,sdhci.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 20 ++++++-<br>
&gt; =C2=A0drivers/mmc/host/sdhci-of-arasan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 66 ++++++++++++++++++++--<br>
&gt; =C2=A02 files changed, 80 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.3.7<br>
&gt;<br>
&gt;</p>
<p dir=3D"ltr">This looks good to me! When acks has been received I am read=
y to queue it for next. </p>
<p dir=3D"ltr">Kind regards <br>
Uffe <br>
</p>

--001a1141fa822d700d052c26edc2--
