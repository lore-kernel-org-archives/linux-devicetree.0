From: Shirish S <shirish@chromium.org>
Subject: Re: [PATCH 0/3] Add dt support for exynos hdmiphy settings
Date: Tue, 29 Oct 2013 10:28:59 +0530
Message-ID: <CAHvYUDBzUdCqSS2_d-8j7XGGmvBCHbXshdSOLaPxT-7n4zb4sA@mail.gmail.com>
References: <1382956755-1318-1-git-send-email-s.shirish@samsung.com>
	<03a501ced3e6$4d5ad3e0$e8107ba0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0918518886=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <03a501ced3e6$4d5ad3e0$e8107ba0$%dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shirish S <s.shirish@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

--===============0918518886==
Content-Type: multipart/alternative; boundary=047d7b5d97cb1c514604e9da1367

--047d7b5d97cb1c514604e9da1367
Content-Type: text/plain; charset=ISO-8859-1

Ok, i shall rebase.


On Mon, Oct 28, 2013 at 7:32 PM, Inki Dae <inki.dae@samsung.com> wrote:

> Hi Shirish,
>
> I have merged the re-factoring patch set from Sean Paul to exynos-drm-next.
> Can you re-base your patch set at top of exynos-drm-next?
>
> Thanks,
> Inki Dae
>
> > -----Original Message-----
> > From: Shirish S [mailto:s.shirish@samsung.com]
> > Sent: Monday, October 28, 2013 7:39 PM
> > To: dri-devel@lists.freedesktop.org; inki.dae@samsung.com;
> > devicetree@vger.kernel.org
> > Cc: seanpaul@chromium.org; sw0312.kim@samsung.com; mark.rutland@arm.com;
> > shirish@chromium.org; Shirish S
> > Subject: [PATCH 0/3] Add dt support for exynos hdmiphy settings
> >
> > For various revisions of a chipset if the signal pattern is changed for
> > every
> > revision, then the phy setting need to be updated correspondingly by
> > measuring
> > the signal.
> > For getting correct signals the clock level and data de-emphasis
> > levels needs to be adjusted.
> > Since only these 2 values matter,we can move the same to dt,
> > wherein we can have different dt files for every revision.
> >
> > This is an initial patchset towards achieving the same
> > for exynos 5250 and can be later extended to future chipsets.
> >
> > V2: replaced moving of entire phy config structure with only
> > required and justifiable conf registers.
> >
> > V3: Incorporated Mark Rutland's comments.
> >
> > Shirish S (3):
> >   ARM: dts: smdk5250: Add hdmi phy settings
> >   ARM: dts: arndale: Add hdmi phy settings
> >   drm: exynos: hdmi: Add dt support for hdmiphy settings
> >
> >  .../devicetree/bindings/video/exynos_hdmi.txt      |   32 +++++++++
> >  arch/arm/boot/dts/exynos5250-arndale.dts           |   68
> ++++++++++++++++++
> >  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   68
> ++++++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_hdmi.c               |   76
> ++++++++++++++++++-
> > -
> >  4 files changed, 240 insertions(+), 4 deletions(-)
> >
> > --
> > 1.7.9.5
>
>

--047d7b5d97cb1c514604e9da1367
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, i shall rebase.<br><div class=3D"gmail_extra"><br><br>=
<div class=3D"gmail_quote">On Mon, Oct 28, 2013 at 7:32 PM, Inki Dae <span =
dir=3D"ltr">&lt;<a href=3D"mailto:inki.dae@samsung.com" target=3D"_blank">i=
nki.dae@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Shirish,<br>
<br>
I have merged the re-factoring patch set from Sean Paul to exynos-drm-next.=
<br>
Can you re-base your patch set at top of exynos-drm-next?<br>
<br>
Thanks,<br>
Inki Dae<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; -----Original Message-----<br>
&gt; From: Shirish S [mailto:<a href=3D"mailto:s.shirish@samsung.com">s.shi=
rish@samsung.com</a>]<br>
&gt; Sent: Monday, October 28, 2013 7:39 PM<br>
&gt; To: <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists=
.freedesktop.org</a>; <a href=3D"mailto:inki.dae@samsung.com">inki.dae@sams=
ung.com</a>;<br>
&gt; <a href=3D"mailto:devicetree@vger.kernel.org">devicetree@vger.kernel.o=
rg</a><br>
&gt; Cc: <a href=3D"mailto:seanpaul@chromium.org">seanpaul@chromium.org</a>=
; <a href=3D"mailto:sw0312.kim@samsung.com">sw0312.kim@samsung.com</a>; <a =
href=3D"mailto:mark.rutland@arm.com">mark.rutland@arm.com</a>;<br>
&gt; <a href=3D"mailto:shirish@chromium.org">shirish@chromium.org</a>; Shir=
ish S<br>
&gt; Subject: [PATCH 0/3] Add dt support for exynos hdmiphy settings<br>
&gt;<br>
&gt; For various revisions of a chipset if the signal pattern is changed fo=
r<br>
&gt; every<br>
&gt; revision, then the phy setting need to be updated correspondingly by<b=
r>
&gt; measuring<br>
&gt; the signal.<br>
&gt; For getting correct signals the clock level and data de-emphasis<br>
&gt; levels needs to be adjusted.<br>
&gt; Since only these 2 values matter,we can move the same to dt,<br>
&gt; wherein we can have different dt files for every revision.<br>
&gt;<br>
&gt; This is an initial patchset towards achieving the same<br>
&gt; for exynos 5250 and can be later extended to future chipsets.<br>
&gt;<br>
&gt; V2: replaced moving of entire phy config structure with only<br>
&gt; required and justifiable conf registers.<br>
&gt;<br>
&gt; V3: Incorporated Mark Rutland&#39;s comments.<br>
&gt;<br>
&gt; Shirish S (3):<br>
&gt; =A0 ARM: dts: smdk5250: Add hdmi phy settings<br>
&gt; =A0 ARM: dts: arndale: Add hdmi phy settings<br>
&gt; =A0 drm: exynos: hdmi: Add dt support for hdmiphy settings<br>
&gt;<br>
&gt; =A0.../devicetree/bindings/video/exynos_hdmi.txt =A0 =A0 =A0| =A0 32 +=
++++++++<br>
&gt; =A0arch/arm/boot/dts/exynos5250-arndale.dts =A0 =A0 =A0 =A0 =A0 | =A0 =
68<br>
++++++++++++++++++<br>
&gt; =A0arch/arm/boot/dts/exynos5250-smdk5250.dts =A0 =A0 =A0 =A0 =A0| =A0 =
68<br>
++++++++++++++++++<br>
&gt; =A0drivers/gpu/drm/exynos/exynos_hdmi.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 76<br>
++++++++++++++++++-<br>
&gt; -<br>
&gt; =A04 files changed, 240 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
<br>
</div></div></blockquote></div><br></div></div>

--047d7b5d97cb1c514604e9da1367--

--===============0918518886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0918518886==--
