From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/3] Qualcomm Resource Power Manager driver
Date: Wed, 18 Jun 2014 17:48:22 +0100
Message-ID: <20140618164822.GC25353@lee--X1>
References: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
 <7hvbrzbh1u.fsf@paris.lan>
 <CAJAp7OhHr4Cgcp9pvQ3=MAie_zSnFJxG28Vf37qJ98BK7P1jaQ@mail.gmail.com>
 <7hzjha8b97.fsf@paris.lan>
 <842A7147-A2CC-42BD-9947-CBADF738DC92@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <842A7147-A2CC-42BD-9947-CBADF738DC92@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Kevin Hilman <khilman@linaro.org>, Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

On Wed, 18 Jun 2014, Kumar Gala wrote:

>=20
> On Jun 18, 2014, at 10:53 AM, Kevin Hilman <khilman@linaro.org> wrote=
:
>=20
> > Bjorn Andersson <bjorn@kryo.se> writes:
> >=20
> >> On Tue, Jun 17, 2014 at 10:07 AM, Kevin Hilman <khilman@linaro.org=
> wrote:
> >>> +Paul Walmsley
> >>>=20
> >>> Bjorn Andersson <bjorn.andersson@sonymobile.com> writes:
> >>>=20
> >>>> This series adds a regulator driver for the Resource Power Manag=
er found in
> >>>> Qualcomm 8660, 8960 and 8064 based devices.
> >>>>=20
> >>>> The RPM driver exposes resources to its child devices, that can =
be accessed to
> >>>> implement drivers for the regulators, clocks and bus frequency c=
ontrol that's
> >>>> owned by the RPM in these devices.
> >>>>=20
> >>>> Changes since v2:
> >>>>  - Fix copy-paste error in dt binding
> >>>>  - Correct incomplete move from mfd to soc
> >>>>  - Correct const mistake in regulator driver
> >>>>=20
> >>>> Changes since v1:
> >>>>  - Moved rpm driver to drivers/soc
> >>>=20
> >>> I'm not sure I follow the motivation for having this under driver=
s/soc?
> >>>=20
> >> Hi Kevin,
> >>=20
> >> I've made the argument that to me this is conceptually a black box
> >> handling regulators, clocks and other stuff; hence similar to a PM=
IC,
> >> which would fit nicely into drivers/mfd.
> >>=20
> >> I still think this is the case and now that I look back I didn't g=
et
> >> any pushback from Lee Jones so maybe the move was premature?
> >=20
> > Yes, IMO, the move was premature, but hopefully the drivers/soc fol=
ks
> > can chime in an clarify the criteria for inclusion there.
> >=20
> > Kevin
>=20
> I dont agree, I think having this in drivers/soc means that we can
> clearly go through drivers/soc in the future and look for patterns
> across SoCs that should be re-factored.

> Where MFD seems like its become the new drivers misc.

Do you have any grounds for that statement?  I only know of one driver
which doesn't fit the bounds of a true MFD.  If you know of more, I'd
like to hear about it.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
