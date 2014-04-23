From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v4] ARM: perf: save/restore pmu registers in pm notifier
Date: Wed, 23 Apr 2014 18:08:21 +0100
Message-ID: <20140423170821.GJ5649@arm.com>
References: <1398133596-29170-1-git-send-email-zhangwm@marvell.com>
 <20140422103642.GF7484@arm.com>
 <175CCF5F49938B4D99B2E3EF7F558EBE5507A3B59B@SC-VEXCH4.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <175CCF5F49938B4D99B2E3EF7F558EBE5507A3B59B@SC-VEXCH4.marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Zhang <zhangwm@marvell.com>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 23, 2014 at 11:31:09AM +0100, Neil Zhang wrote:
>=20
> > -----Original Message-----
> > From: Will Deacon [mailto:will.deacon@arm.com]
> > Sent: 2014=E5=B9=B44=E6=9C=8822=E6=97=A5 18:37
> > To: Neil Zhang
> > Cc: linux@arm.linux.org.uk; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; Sudeep Holla; devicetree@vger.kernel.=
org
> > Subject: Re: [PATCH v4] ARM: perf: save/restore pmu registers in pm=
 notifier
> >=20
> > Hi Neil,
> >=20
> > On Tue, Apr 22, 2014 at 03:26:36AM +0100, Neil Zhang wrote:
> > > This adds core support for saving and restoring CPU PMU registers=
 for
> > > suspend/resume support i.e. deeper C-states in cpuidle terms.
> > > This patch adds support only to ARMv7 PMU registers save/restore.
> > > It needs to be extended to xscale and ARMv6 if needed.
> > >
> > > I made this patch because DS-5 is not working on Marvell's CA7 ba=
sed SoCs.
> > > And it has consulted Sudeep KarkadaNagesha's patch set for multip=
le PMUs.
> > >
> > > Thanks Will and Sudeep's suggestion to only save / restore used e=
vents.
> >=20
> > Whilst this is a step in the right direction, I'd still like to see=
 the save/restore
> > predicated on something in the device-tree or otherwise. Most SoCs =
*don't*
> > require these registers to be preserved by software, so we need a w=
ay to
> > describe that the PMU is in a power-domain where its state is lost =
when the
> > CPU goes idle.
> >=20
> > This doesn't sound like a PMU-specific problem, so there's a possib=
ility that
> > this has been discussed elsewhere, in the context of other IP block=
s
> >=20
> > [adding the devicetree list in case somebody there is aware of any =
work in
> > this area]
> >=20
>=20
> Thanks Will.
> What should I do now?
> Add a filed under PMU or waiting for somebody whether there are gener=
al
> supporting for power domain maintain.

I think we need some input from the device-tree guys to see whether the=
y
would object to us solving this locally (in the PMU node) or not.
Personally, I'd much prefer a general way to describe the need for
pm-notifiers, but if that's not being looked at then we can cook someth=
ing
specifically for our needs.

Will
