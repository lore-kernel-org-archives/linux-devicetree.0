From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 00:11:21 -0600
Message-ID: <20110419061121.GB5252@ponder.secretlab.ca>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
 <20110418160658.GD23814@pengutronix.de>
 <BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Williams <john.williams@petalogix.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2011 at 11:58:25AM +1000, John Williams wrote:
> On Tue, Apr 19, 2011 at 2:06 AM, Wolfram Sang <w.sang@pengutronix.de>=
 wrote:
> > Hi,
> >
> >> For example with "uio" compatible string:
> >> static const struct of_device_id __devinitconst uio_of_genirq_matc=
h[] =3D {
> >> =A0 =A0 =A0 { .compatible =3D "uio", },
> >> =A0 =A0 =A0 { /* empty for now */ },
> >> };
> >
> > Please use a proper example with "vendor,device".
> > (And after that it won't be empty anymore)
>=20
> My vote is, and always has been 'generic-uio' :)
>=20
> Putting some random vendor/device string in there is just nuts. Do yo=
u
> really want a kernel patch every time some one binds their device to
> it?
>=20
> Or, is there no expectation that anybody would attempt to merge such =
a
> pointless patch to begin with?
>=20
> As we discussed at ELC, putting a real vendor/device in there is also
> broken because all instances in the system wil bind to the generic
> uio, which is not necessarily what is desired.
>=20
> I know the arguments against the 'generic-uio' tag, but come on, let'=
s
> look at the lesser of two evils here!  I call BS on this DTS purity.

Call it what you like, but the reasons are well founded.  The alternati=
ve
that has been proposed which I am in agreement with is to investigate
giving userspace the hook to tell the kernel at runtime which devices
should be picked up by the uio driver.

In the mean time, explicitly modifying the match table is an okay
compromise.

g.
