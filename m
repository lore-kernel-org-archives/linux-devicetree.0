From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 13/15] arm: dts: r8a7743: Add missing OPP properties for
 CPUs
Date: Tue, 29 May 2018 13:33:25 +0000
Message-ID: <OSBPR01MB2103A3411D0C3C5DB76F715EB86D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <5821a6dbe413b5a217ca1e24ddf8ebfa63ba6ef0.1527244201.git.viresh.kumar@linaro.org>
 <20180528092331.3jon45nsqfdzs5ds@verge.net.au>
 <20180528105831.vesrswazlagynemq@vireshk-i7>
 <20180528115832.b2wovvanypxkgalj@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180528115832.b2wovvanypxkgalj@verge.net.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: "arm@kernel.org" <arm@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, "ionela.voinescu@arm.com" <ionela.voinescu@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "chris.redpath@arm.com" <chris.redpath@arm.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi All,

I have tested this patch on RZ/G1M and I didn't find any issues. r8a7743 is=
 similar to r8a7791. So I assume you will apply the same patch for other R-=
SoC devices as well.

Apart from this, maybe we need to update the OPP binding documentation. i.e=
., extend the  operating- point usage to other cores in the cluster (Bindin=
g 1: operating-points).

Regards,
Biju

> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 28 May 2018 12:59
> To: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: arm@kernel.org; Magnus Damm <magnus.damm@gmail.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Vincent Guittot <vincent.guittot@linaro.org>; ionela.voinescu@arm.com;
> Daniel Lezcano <daniel.lezcano@linaro.org>; chris.redpath@arm.com; linux-
> renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Biju Das <biju.das@bp.renesas.com>
> Subject: Re: [PATCH 13/15] arm: dts: r8a7743: Add missing OPP properties =
for
> CPUs
>
> On Mon, May 28, 2018 at 04:28:31PM +0530, Viresh Kumar wrote:
> > On 28-05-18, 11:23, Simon Horman wrote:
> > > [Cc Biju Das]
> > >
> > > On Fri, May 25, 2018 at 04:01:59PM +0530, Viresh Kumar wrote:
> > > > The OPP properties, like "operating-points", should either be
> > > > present for all the CPUs of a cluster or none. If these are
> > > > present only for a subset of CPUs of a cluster then things will
> > > > start falling apart as soon as the CPUs are brought online in a
> > > > different order. For example, this will happen because the
> > > > operating system looks for such properties in the CPU node it is
> > > > trying to bring up, so that it can create an OPP table.
> > > >
> > > > Add such missing properties.
> > > >
> > > > Fix other missing property (clock latency) as well to make it all
> > > > work.
> > > >
> > > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > >
> > > Thanks, this looks good to me and it looks like it should have:
> > >
> > > Fixes: 0417814ea140 ("ARM: dts: r8a7743: Add OPP table for frequency
> > > scaling")
> >
> > Sure.
> >
> > Will you be picking this patch directly and send it part of your pull
> > request ? Maybe add Fixes tag then only ?
>
> Yes, that is my plan. I can handle adding the Fixes tag.
> But I'll wait to see if Bjiu has an feedback first.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
