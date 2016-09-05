From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i-q8-common: Add support for SDIO wifi
 controllers
Date: Mon, 5 Sep 2016 21:58:14 +0200
Message-ID: <20160905195814.GA8596@lukather>
References: <20160826145236.30210-1-hdegoede@redhat.com>
 <20160826145236.30210-4-hdegoede@redhat.com>
 <20160829065620.GC7612@lukather>
 <724a6222-36e3-e230-5071-a7cb23c51697@redhat.com>
 <20160901203733.GI20462@lukather>
 <1efbd549-a05b-713e-cbe2-7a5458beaaeb@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1efbd549-a05b-713e-cbe2-7a5458beaaeb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 03, 2016 at 01:33:50PM +0200, Hans de Goede wrote:
> >On Mon, Aug 29, 2016 at 11:46:14AM +0200, Hans de Goede wrote:
> >>On 29-08-16 08:56, Maxime Ripard wrote:
> >>>On Fri, Aug 26, 2016 at 04:52:36PM +0200, Hans de Goede wrote:
> >>>>Most of the sun8i q8 boards have an usb wifi controller, on the
> >>>>variants which use an USB wifi controller, this will result in a
> >>>>couple of error msg-s in dmesg when proving the sdio bus and
> >>>>an used mmc controller.
> >>>>
> >>>>The best way to deal with wifi on this boards really is to simply
> >>>>let the kernel auto-detect usb or sdio wifi controllers, so we
> >>>>will just have to live with the few errors in dmesg.
> >>>
> >>>No, because that grabs PINs that might or might not be supposed to be
> >>>used for that, it leaves clocks and regulators enabled, which draw
> >>>power, to no end. And that's even worth since most boards will not use
> >>>it.
> >>>
> >>>You can put the definition of the nodes in the DTSI, but the final
> >>>status will have to be in the (relevant) DTS.
> >>
> >>This is again the q8-tablet thing where china produces a new variant
> >>every 2 weeks. So we've sun8i-a23-q8-tablet.dts and sun8i-a33-q8-tablet=
=2Edts
> >>which try to be generic dts files for these tablets, since creating
> >>a custom dts per variant is madness.
> >
> >This is almost unrelated, and probably some wishful thinking, but I'd
> >really prefer to support *one* board properly, with all its features,
> >rather than supporting every random Allwinner device with half baked
> >support, because no one ever updated the DT, or there's simply no
> >driver. But hey, I can't force you to work on something either :)
>=20
> The q8 tablets are somewhat special, to the end consumer they
> are one board, but they differ a lot per badge. These are 40 (or less)
> usd tablets, which get whatever wifi / touchscreen-controller /
> accelerometer which is cheapest on the Chenzen market when the
> badge gets produces.
>=20
> For the end user to actually figure out what is in there requires
> opening the tablet, or poking around with adb to learn the exact
> internals / drivers used by android.
>=20
> I actually own 10 of these (3 a13, 5 a23, 2 a33) and have access
> to 2 more a33 models which friends of me have, and they are *all*
> different. For a list of all tablets I've see:
> https://github.com/jwrdegoede/sunxi-fedora-scripts/blob/master/hansg-tabl=
et-info
>=20
> Given the price of these they are really nice to thinker with /
> turn into a little normal linux touch device, so I would like to
> support them as best as we can in a somewhat user-friendly
> way. Also see the RFC patch for the q8-hardwaremgr I posted
> recently. In the end these tablets are the "*one* board"
> which I'm trying to support properly, except that they are
> only one board on the outside not on the outside.
>=20
> TL;DR: q8 tablets are special, but also quite popular and
> I would like to support them properly, which requires
> some special handling.
>=20
> >>This commit puts the node in sun8i-q8-common.dtsi because the
> >>A23 and A33 are pin compatible and we've tablets where the
> >>only difference is the SoC soldered on there, the use the _exact_
> >>same PCB and components otherwise, so we have all the sun8i q8
> >>stuff in a common place for sun8i-a23-q8-tablet.dts and
> >>sun8i-a33-q8-tablet.dts, those are the only users of this
> >>dtsi file.
> >>
> >>You've already merged the bits which handle the variants with
> >>an USB attached wifi module (enabling ehci0 also on boards
> >>where nothing is connected). This is the counter-part for
> >>PCB's which use a sdio wifi module (about 90% of all boards
> >>in my experience).
> >
> >I'm confused. Are most boards using an USB wifi chip, like you were
> >stating in your commit log, or an SDIO wifi chip like you just said?
>=20
> My bad, the commit msg. is wrong of the 9 sun8i q8 tablets I've
> access to only 1 uses usb wifi.
>=20
> So the first part of the commit msg should read
> "Most of the sun8i q8 boards have a sdio wifi controller"
>=20
> >>As for turning a regulator on unnecessary, both the wifi and sdio
> >>wifi solution use the same regulator, so that is already turned on
> >>through the usb bits and it needs to be in either case.
> >
> >Ok, so indeed, that's not as bad as it sounds.
> >
> >>The only downside of this approach is that we either have
> >>the USB controller turned on unnecessarily (in most cases)
> >>or the mmc controller (in the rare A23 tablet which still
> >>uses an USB wifi module).
> >>
> >>This all actually fits neatly into the plans to do hardware
> >>autodetection for these tablets which I'm working on, in
> >>this case we can just let the kernel handle things without
> >>additional code (think the beaglebone capemanager) since
> >>both busses are discoverable.
> >>
> >>Once we have the q8-hardwaremgr I'm working on and hope
> >>to post an RFC of soon, we could even make that turn off
> >>the unused controller (as a future enhancement).
> >
> >If that's on your to-do-list, that's fine by me.
>=20
> I've just added it to my to-do list :)
>=20
> So I assume with that done, that you are ok with taking this
> patch now ? Please fixup the commit msg mistake, or let
> me know if you want a v2.

Yeah, I just applied it and fixed the commit log.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXzc5WAAoJEBx+YmzsjxAgYboP/A8jbgTFMDQfOnFljESHwq2d
BanBVEPsNZdy/I7XmN2Xz/8IBSBTaLVy3PBtJKfSdNQf674ZZhk1u7zK2HJS7Hc7
oy6Rk0PeidppFy5GLIDY2tDyRyKmy8XTdYraohxq1OZvRzWcaDfCWdW0Qf+5zVCD
WnoYROeG+jumj11c/vnzkkJSHQqe6qFElNhLC5dlPFh5i+WA2sMqrtdJj6j/aUNf
wvtbXpM6kvdUqV0kOfE9X3kO1n3Al3BeKS9wIytg9yTF5Hlt+CIqWkwUcM2ArocQ
2dimZh4M3VPmwwvf97Jr+COb8wPVRtk9BpkNW3IR4NjsVAIgTwbSXbOuhoIBXj1S
o8K3fnuc0P2lRSA3cbsmot3cCO5AWsGdQLmuP60ZLeQb9UQvu1oM0iaRN4XHHFpR
nAzEyoi3lRvFMk7kEjF69mHFxp8caYge/+6KJMs0uZl+K68x7BkM3fWGuUUD5JPr
XQb8oE1Za4P1LadGn9Usbn/VdOMGE/IsyeSFGWL2O/g/rz+wTilodwnYzCX8MBA3
uEYJ9wOpymFeI5Tqf5HCYhOuUkSLavDoZGPTlTkwy9LMdOj/22qb+kIXXHK173Zn
GuL8rdAIChjKTHR1VAGAl4lEkXVbtZLKtfZsNf1Q9fFuMbo3RzwgFMtq//nuD7ZT
04ZAH9A+5hQS8dVZymI+
=C05n
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
