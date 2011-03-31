From: "Hans J. Koch" <hjk@hansjkoch.de>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 22:30:24 +0200
Message-ID: <20110331203024.GE2734@local>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
 <1301574600-4861-2-git-send-email-monstr@monstr.eu>
 <20110331124925.GA2202@pengutronix.de>
 <4D948189.9070606@monstr.eu>
 <20110331170321.GA2734@local>
 <4D94C09B.4070506@monstr.eu>
 <20110331192302.GD2734@local>
 <AANLkTin6iSVQtKo602hceod+4=cVUMG=GR7cCZvHg4nO@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTin6iSVQtKo602hceod+4=cVUMG=GR7cCZvHg4nO@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "Hans J. Koch" <hjk@hansjkoch.de>, Michal Simek <monstr@monstr.eu>, Wolfram Sang <w.sang@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@linutronix.de, gregkh@suse.de
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2011 at 01:48:32PM -0600, Grant Likely wrote:
> On Thu, Mar 31, 2011 at 1:23 PM, Hans J. Koch <hjk@hansjkoch.de> wrot=
e:
> > On Thu, Mar 31, 2011 at 07:57:47PM +0200, Michal Simek wrote:
> >> Hans J. Koch wrote:
> >> >On Thu, Mar 31, 2011 at 03:28:41PM +0200, Michal Simek wrote:
> >> >>>>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 uioinfo->name =3D pdev->dev.of_n=
ode->name;
> >> >>>>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Use version for storing full =
IP name for identification */
> >> >>>>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 uioinfo->version =3D pdev->dev.o=
f_node->full_name;
> >> >>>I don't think this is apropriate, but will leave that to Hans.
> >> >>I was thinking what to add and I choose full_name because I can =
read
> >> >>this value and identify which UIO is this device.
> >> >>I know that there should be version but there is no version stri=
ng in DTS.
> >> >
> >> >The purpose of uio_info->version is to give the userspace part of=
 the driver
> >> >additional information. Kernel part and userspace part might be d=
eveloped
> >> >independently, and there should be a chance for the userspace par=
t to find
> >> >out if a certain feature is already supported by the kernel part =
without
> >> >having to do dirty kernel version checks.
> >> >
> >> >So, uio_info->version is an information about the driver, not the=
 hardware.
> >> >
> >> >Example: You write a UIO driver for a chip you use in a project. =
You don't
> >> >need all the functionality of that chip. One year later you need =
additional
> >> >chip functionality, and it turns out that you have to do certain
> >> >initializations in the kernel part. Your new userspace will need =
the new
> >> >kernel driver, but there are lots of older kernels around in your=
 customers
> >> >devices. In that case, your userspace part can simply check the v=
ersion
> >> >string in sysfs and require at least your new version.
> >>
> >> I understand reasons but this information is not in device tree an=
d
> >> it must be setup.
> >> Grant suggested compatible string but it is not the best option to=
o.
> >
> > In uio_pdrv_genirq, uio_info->version is hardcoded in platform data=
=2E Hardware
> > initialization can also take place in the same platform specific fi=
le, which
> > is common practice on archs like ARM. Therefore, a driver specific =
versioning
> > can make sense for UIO, even if the driver code itself doesn't chan=
ge.
> >
> > If you have no equivalent for that in device tree, you should creat=
e a new
> > generic driver (uio_of_genirq?) that simply doesn't support this ki=
nd of
> > versioning.
>=20
> I'd avoid that.  Current trend is to move away from separate
> of-specific data because the driver is essentially identical other
> than the data source being different (platform_data vs. a device node
> pointer).

The point here his that UIO drivers are _not_ like normal drivers, beca=
use
they're split into a kernel and a userspace part. If there are changes =
in the
hardware initialization the kernel performs, and the userspace part of =
the
driver needs to know about it, we use the "version" attribute in sysfs =
to
communicate that.

OK, userspace could check the kernel version. But UIO drivers are mostl=
y used
in environments where custom non-mainline kernels reporting arbitrary v=
ersion
numbers are running (less than 1% of the UIO drivers in use are ever po=
sted
on LKML, I guess). That makes it at least difficult for these people to=
 write
a clean UIO driver that can deal with different kernels.

Killing the "version" attribute means breaking some out-of-tree UIO dri=
vers.
Personally, I'm fine with that. But completely throwing away the possib=
ility
of that kind of versioning is one step too far IMHO.

=46or UIO, it is not enough to just know "we have this chip using that =
driver",
at least not for a generic driver like the one proposed in this patch.

Thanks,
Hans
