Return-Path: <SRS0=QQZT=TK=gmail.com=peron.clem@kernel.org>
MIME-Version: 1.0
References: <CAJiuCceeLwY+myYtUf15frSYsLKmGaUBifAOxUkNWwSjbF4oDg@mail.gmail.com>
 <20190429220503.GA4720@bogus>
In-Reply-To: <20190429220503.GA4720@bogus>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 10 May 2019 21:47:27 +0200
Message-ID: <CAJiuCcc2_HWKvHyBepu_PXG+T-qD_4KFw=qT_rtrvqJDEXbrZw@mail.gmail.com>
Subject: Re: Question about compatible fallback and documentation
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Tue, 30 Apr 2019 at 00:05, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Apr 14, 2019 at 06:18:04PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > I have to bind an already existing IP by a vendor in a new SoC called
> > "SOC3" device-tree.
> >
> > In the 1st gen of "SOC1" the IP is introduced :
> > soc1.dtsi :
> > compatible =3D "vendor,ip-soc1";
> >
> > Then a 2nd gen of the IP is introduced in "SOC2" with new registers.
> > But the driver of the 1st gen is still working fine and no update of
> > the existing driver has been introduced because not required.
> > soc2.dtsi :
> > compatible =3D "vendor,ip-soc2", "vendor,ip-soc1";
> >
> > Finally in "SOC3" and regardind the user manual we think that the IP
> > introduced is the same as "SOC2".
> > Should the compatible in soc3.dtsi be A or B?
> > A) compatible =3D "vendor,ip-soc2", "vendor,ip-soc1";
> > or
> > B) compatible =3D "vendor,ip-soc3", "vendor,ip-soc2", "vendor,ip-soc1";
> >
> > I propose the solution B) because we don't know what could happens
> > maybe the IP could need a quirks only for "SOC3". And device tree
> > shouldn't move for the user only the driver.
>
> B is correct.
>
> Or you could list soc3 and soc2 given you do know there are additional
> features. That would require a driver update, but likely the new SoC
> requires some OS changes. Maybe someday SoC design will be disciplined
> enough that new SoCs are fully backwards compatible.

Thanks for the answer,
Clement

>
> > Last question does we have to document all the compatible use in
> > DTS(i) files in the Documentation ? or only the compatible used by the
> > drivers ?
>
> What is used in DTS files.
>
> Rob
