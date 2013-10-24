From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Thu, 24 Oct 2013 11:00:56 +0200
Message-ID: <20131024090054.GA11296@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com>
 <20131024072811.GS30088@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131024072811.GS30088-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 09:28:11AM +0200, Sascha Hauer wrote:
> On Wed, Oct 23, 2013 at 09:14:17PM -0400, Rob Clark wrote:
> > On Mon, Oct 21, 2013 at 5:27 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> =
wrote:
> > >> If a subsystem doesn't work well with DT, then the choices are eithe=
r:
> > >>
> > >> (a) don't use DT with the subsystem
> > >
> > > The underlying problem has nothing to do with DT. Multi component
> > > hardware does exist and won't vanish when we stop using DT.
> > >
> > >> (b) fix the subsystem
> > >
> > > I'd love to do that. Step one to this seems to be to increase the
> > > awareness that there's something wrong with DRM.
> >=20
> >=20
> > Note that I suspect your idea of "fixing drm" is going to break some
> > userspace assumptions about the hw (ie. userspace isn't expecting
> > crtcs/encoders/connectors to suddenly appear/disappear.  And the funny
> > thing is, on all of this hw, that isn't going to happen anyways.
>=20
> I was talking about all SoC DRM drivers implementing variants of the
> same glue between drm and the multidevice nature of the components.
>=20
> To make that sure: I never had the intention to implement hotplug for
> drm. Also what the imx-drm driver does is not for hotplug, but only for
> binding different components together.

I think we should be able to solve that problem generically. Essentially
we need some sort of composite device that subdevices can register with.
The composite device can keep track of what devices are needed (this
works well by walking the device tree, looking for nodes that match by
compatible and see if their status property is set to"okay") and once
all of those have been registered do whatever the specific subsystem
requires.

I'm not familiar with what exactly the requirements are for other SoCs,
so I'd be interested in hearing if there's anything beyond the above.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaOHGAAoJEN0jrNd/PrOhe7oQAKHHmOWp+MfBH8rvka+v/IQv
mfXr2LQGEi96sWglseSQlMgmjmCMATDANu82dt6dM/T5h9G0lZVYXBZTg6ixthI6
XUMGE7lI/+THlG6p6NROTGrYt1OAfvxCSXvZnXyRkP5LuWCsLXQAuUMDMAffZraU
crnRzC9cgHdkvLEtXSVg1WDQCm7ZuwBTN+zycAAuEuuSerulZStpSoFoJMrUT875
snqliO0gxX0mVP7yRancx5J7vCWF4EaKYrEuB1o6sqhYpQcqFO1pW0Ja7qh89CzA
bYf9ZLId35cVgZpz98eWL9V7/chAf3AEzVIrLxJRyDWehxusUjmvrZWWBONW4RBM
NGbfftHtPCixuKbZ2s/UuDqJjVCIlyRLVkDwIN3s5R9qholYI8FD1d6yltiHIl8e
uBdZqfkkTWsUsJygms7eOq+7qM0t/8zPme4CHMp5LCh4GsTzwoB6isJEFAhZx+ig
gtGzUts43Li6bjMg/BO4LEB+rcqONVo9k+BOCsUF0XjGktZYVCdzvqrcJ/acHE+k
joV1gcQrqjBIt682iKkCcsQLzGcjWnPKaCLcgymi/ZJeg/5Uj+nFoKR+qxaeglYn
+NJOgo0pEQDWK4hpuqFsP2Sd/xqJGmHwJ1P1jtsPKrgMOdjmojxIfonpA5pVnWqZ
AIKYbfZkxXDv3Y+ku8bL
=FoVb
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
