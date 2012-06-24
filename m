From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RESEND] of: add const to struct of_device_id.data
Date: Sun, 24 Jun 2012 16:43:20 +0200
Message-ID: <20120624144320.GB28001@pengutronix.de>
References: <1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20120607102014.GI22191@pengutronix.de>
 <20120622055613.GL5642@pengutronix.de>
 <201206221726.22285.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201206221726.22285.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, kernel@pengutronix.de, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On Fri, Jun 22, 2012 at 05:26:22PM +0000, Arnd Bergmann wrote:
> On Friday 22 June 2012, Uwe Kleine-K=F6nig wrote:
> > On Thu, Jun 07, 2012 at 12:20:14PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Drivers should never need to modify the data of a device id. So i=
t can
> > > be const which in turn allows more consts in the driver.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de=
>
> > > ---
> > > (Cc +=3D lkml + Grant)
> > >=20
> > > Hello,
> > >=20
> > > this might introduce warnings in drivers that access the data mem=
ber
> > > without using const, so this is definitly merge window material i=
f it is
> > > considered at all.
> >
> > ping
>=20
> Sorry for the delayed response. I think the approach is right, but I
> am a bit worried about adding warnings for legit code.
>=20
> A quick test with the defconfigs gave me this error for prima2_defcon=
fig
> and kzm9g_defconfig:
>=20
> /home/arnd/linux-arm/arch/arm/mm/cache-l2x0.c: In function 'l2x0_of_i=
nit':
> /home/arnd/linux-arm/arch/arm/mm/cache-l2x0.c:573:7: error: assignmen=
t discards 'const' qualifier from pointer target type [-Werror]
I already sent a patch for that to rmk's patch system:

	http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D7429/=
1

Russell commented:=20
Sigh, a gmane.org URL.  Which is difficult to dig the thread out of.
Eventually you can.  And I see nothing which suggests that the series
will be applied or, more importantly when it is going to be applied.
Punting this patch until there's better communication.

Russell, I didn't completely get your problem about gmane here. If you
follow the link in the Subject: line, you get a thread view. Does this
address your concerns?

And even without the of: add const to struct of_device_id.data patch
patch using more consts is IMHO nice.

> and this one with at91sam9263_defconfig:
> /home/arnd/linux-arm/drivers/misc/atmel_tclib.c: In function 'tc_prob=
e':
> /home/arnd/linux-arm/drivers/misc/atmel_tclib.c:170:19: error: assign=
ment discards 'const' qualifier from pointer target type [-Werror]
>=20
> I haven't checked all the defconfigs yet, but I think we should at le=
ast
> make sure they build fine before applying your patch.
=46ine for me, I will come up with a series next week.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
