From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [RFC PATCH v5 0/1] drivers: mfd: Versatile Express SPC support
Date: Wed, 17 Jul 2013 15:20:11 +0100
Message-ID: <1374070811.3146.124.camel@hornet>
References: <1373990743-23106-1-git-send-email-lorenzo.pieralisi@arm.com>
	 <1374052705.3146.86.camel@hornet>
	 <alpine.LFD.2.03.1307170825240.14924@syhkavp.arg>
	 <1374067786.3146.123.camel@hornet>
	 <alpine.LFD.2.03.1307171014510.14924@syhkavp.arg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.03.1307171014510.14924@syhkavp.arg>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Amit Kucheria <amit.kucheria@linaro.org>, Jon Medhurst <tixy@linaro.org>, Achin Gupta <Achin.Gupta@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-07-17 at 15:16 +0100, Nicolas Pitre wrote:
> On Wed, 17 Jul 2013, Pawel Moll wrote:
>=20
> > On Wed, 2013-07-17 at 13:33 +0100, Nicolas Pitre wrote:
> > > If this is really miscelaneous code that really doesn't fit=20
> > > anywhere else, it should rather go into drivers/misc/ as a last r=
esort.
> >=20
> > Interestingly enough drivers/misc was my first choice for all the
> > vexpress stuff, but it wasn't received well...
> >=20
> > Anyway, the SPC driver as it is now seem to be a "power management
> > system driver". Maybe a relevant directory would be in place? Would=
n't
> > PSCI belong there as well? (there are two psci.c files in arch/arm =
and
> > arch/arm64, surprisingly similar ones ;-)
> >=20
> > The bottom line is: today it is not an MFD driver.
>=20
> But we know it will, right?  So better  save some churn by storing th=
e=20
> initial code where it would end up anyway once complete.

Not in that form, no. The code living in mfd will just register
mfd_cells while "functional" parts are going to live elsewhere. This is
how I understand what Samuel asked me to do and that's what is happenin=
g
to vexpress-sysreg now.

Pawe=C5=82
