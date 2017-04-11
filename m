Return-Path: <SRS0=obXi=3T=kuvee.com=geoff@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170405090611.GF2136@zurbaran.ger.intel.com>
References: <1482380314-16440-1-git-send-email-geoff@kuvee.com> <20170405090611.GF2136@zurbaran.ger.intel.com>
From: Geoff Lansberry <geoff@kuvee.com>
Date: Tue, 11 Apr 2017 11:44:19 -0400
Message-ID: <CAO7Z3WKQZSD2jjn0M0Ga32aYk=6Sx6btz=V8q1Ay2dJBkdN=Og@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] NFC: trf7970a: add device tree option for 27MHz clock
Content-Type: multipart/alternative; boundary=001a114495247275d5054ce5f9c9
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Greer <mgreer@animalcreek.com>, Justin Bronder <justin@kuvee.com>
List-ID: <devicetree@vger.kernel.org>

--001a114495247275d5054ce5f9c9
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 5:06 AM, Samuel Ortiz <sameo@linux.intel.com> wrote:

> Hi Geoff,
>
> On Wed, Dec 21, 2016 at 11:18:32PM -0500, Geoff Lansberry wrote:
> > The TRF7970A has configuration options to support hardware designs
> > which use a 27.12MHz clock. This commit adds a device tree option
> > 'clock-frequency' to support configuring the this chip for default
> > 13.56MHz clock or the optional 27.12MHz clock.
> >
> > Signed-off-by: Geoff Lansberry <geoff@kuvee.com>
> > ---
> >  .../devicetree/bindings/net/nfc/trf7970a.txt       |  2 +
> >  drivers/nfc/trf7970a.c                             | 50
> +++++++++++++++++-----
> >  2 files changed, 41 insertions(+), 11 deletions(-)
> Patches #1 and #2 applied to nfc-next. I'll wait for you to rework #3
> before merging.
>
> Cheers,
> Samuel.
>

Excellent - thank you.  For the record, we may end up dropping #3.

Geoff

--001a114495247275d5054ce5f9c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Apr 5, 2017 at 5:06 AM, Samuel Ortiz <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:sameo@linux.intel.com" target=3D"_blank">sameo@linux.intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Geoff,<br>
<span class=3D""><br>
On Wed, Dec 21, 2016 at 11:18:32PM -0500, Geoff Lansberry wrote:<br>
</span><span class=3D"">&gt; The TRF7970A has configuration options to supp=
ort hardware designs<br>
&gt; which use a 27.12MHz clock. This commit adds a device tree option<br>
&gt; &#39;clock-frequency&#39; to support configuring the this chip for def=
ault<br>
&gt; 13.56MHz clock or the optional 27.12MHz clock.<br>
&gt;<br>
&gt; Signed-off-by: Geoff Lansberry &lt;<a href=3D"mailto:geoff@kuvee.com">=
geoff@kuvee.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/net/<wbr>nfc/trf7970a.txt=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 drivers/nfc/trf7970a.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 50 ++++++++=
+++++++++-----<br>
&gt;=C2=A0 2 files changed, 41 insertions(+), 11 deletions(-)<br>
</span>Patches #1 and #2 applied to nfc-next. I&#39;ll wait for you to rewo=
rk #3<br>
before merging.<br>
<br>
Cheers,<br>
Samuel.<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Excellent - thank y=
ou.=C2=A0 For the record, we may end up dropping #3.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Geoff</div></div>

--001a114495247275d5054ce5f9c9--
