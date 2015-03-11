From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/4] soc: Mediatek: Add SCPSYS power domain driver
Date: Wed, 11 Mar 2015 10:03:45 +0100
Message-ID: <20150311090345.GR24885@pengutronix.de>
References: <1425888603-25800-1-git-send-email-s.hauer@pengutronix.de>
 <1425888603-25800-3-git-send-email-s.hauer@pengutronix.de>
 <7h61a94zy0.fsf@deeprootsystems.com>
 <20150310094142.GD24885@pengutronix.de>
 <1426043791.24243.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426043791.24243.9.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 11:16:31AM +0800, James Liao wrote:
> Hi,
>=20
> On Tue, 2015-03-10 at 10:41 +0100, Sascha Hauer wrote:
> > On Mon, Mar 09, 2015 at 02:35:03PM -0700, Kevin Hilman wrote:
> > > Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> > >=20
> > > > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > >=20
> > > A bit of a changelog here would be useful describing this driver,=
 that
> > > it's only covering part of the device (e.g. power controller) wit=
h more
> > > to come, dependency on the syscon driver, etc.
> > >=20
> > > > +/*
> > > > + * The Infracfg unit has bus protection bits. We enable the bu=
s protection
> > > > + * for disabled power domains so that the system does not hang=
 when some unit
> > > > + * accesses the bus while in power down.
> > > > + */
> > >=20
> > > Hmm, why don't you want to know if some device is accessing anoth=
er
> > > device which is in a domain that is powered down?   Seems like th=
is is a
> > > good way to hide real bugs.
> >=20
> > How I understand it the system just hangs on erroneous accesses wit=
hout
> > these protection bits enabled, so enabling them at least makes sure=
 we
> > can output something.
> > I must admit though that my understanding of these bits is quite li=
mited
> > and the only user of this driver I have available here (audio) does=
n't
> > make use of these protection bits, so I can't test here.
> >=20
> > James, could you shed some light on this issue?
>=20
> I asked our designer about the bus protection feature, here is his
> response:
>=20
> "
> It's for unexpected signal glitch in Power switch process.
>=20
> During Power switch process, we have clock switch, reset, isolation
> enable/disable and  power switch involved where the transition of
> asynchronous reset and  isolation is the most critical one,  which ha=
ve
> risk to introduce a unexpected short period signal transition from
> MTCMOS=E2=80=99s interface to other alive HW .=20
> "
>=20
> That means it protects unexpected bus accessing from HW, not from SW.=
 So
> it will not hide bugs from wrong SW access.

Ok, thanks for clarifying. This means we should enable this feature
sooner or later. Since the audio driver which is likely the first user
of this driver doesn't need the protection bits I think we have some
time and can add the protection bits once the clock patches have been
merged.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
