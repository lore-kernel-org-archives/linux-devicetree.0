From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 2/6] ARM: dts: sun7i: Enable USB DRC on
 Bananapi
Date: Sun, 11 Oct 2015 18:47:13 +0200
Message-ID: <20151011164713.GO2278@lukather>
References: <1442928966-6418-1-git-send-email-hdegoede@redhat.com>
 <1442928966-6418-2-git-send-email-hdegoede@redhat.com>
 <20150929080453.GN7104@lukather>
 <560A4B3D.4040007@redhat.com>
 <20151001083242.GB7104@lukather>
 <56162B53.8020800@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVcb4xucqmsYUpQy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56162B53.8020800-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kVcb4xucqmsYUpQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 09:37:39AM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 10/01/2015 09:32 AM, Maxime Ripard wrote:
> >Hi,
> >
> >On Tue, Sep 29, 2015 at 10:26:37AM +0200, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 29-09-15 10:04, Maxime Ripard wrote:
> >>>On Tue, Sep 22, 2015 at 03:36:01PM +0200, Hans de Goede wrote:
> >>>>Enable the otg/drc usb controller on the Bananapi.
> >>>>
> >>>>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>
> >>>Applied all the other patches but this one.
> >>
> >>Thanks, seems you did not push this to your git.kernel.org repo though ?
> >
> >I think I did, but maybe not at the time you sent the mail.
> >
> >>>Since we dropped the patch adding the regulators support on the
> >>>Bananapi until we figure out why the board crash, it doesn't compile
> >>>anymore.
> >>
> >>How about me doing a v2 of the regulators patch which removes the
> >>
> >>&cpu0 {
> >>         cpu-supply =3D <&reg_dcdc2>;
> >>};
> >>
> >>So that we do not get cpu voltage scaling, then the regulator
> >>changes should be a NOP, everything should just keep the u-boot
> >>set voltages, and we can enable oth support.
> >>
> >>And then when we've figured out a safe way to enable cpu voltage
> >>scaling we can do so with a follow up patch ?
> >>
> >>Is that a plan ? If so say yes and I'll do a v2 of these patches :)
> >
> >Yep, it sounds like a good plan :)
>=20
> With the new v3 of the regulators patch with the corrected opp-s which
> was just send this should no longer be necessary, can you apply the
> original "ARM: dts: sun7i: Enable USB DRC on Bananapi" after applying
> v3 of the regulators patch please ?

Sure, I just did it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--kVcb4xucqmsYUpQy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWGpKRAAoJEBx+YmzsjxAgJgoQAIcu8PG5bo7yIksHnkGwkGNR
gcIqxCs49mDon16rGar3ztZavwubuRmFXzC+nnWeYnJMbYJDVZd5VzmGpiPIkEJp
fy6wOcAn7lB/7Ni0ugwXvegDkp/MxSXN1AIGbsN4vDGyXDGtAkmXYz8Ju9ODG1Ye
oLV8vfxFYgKVKzz4V5UzjWp6AxNqz+KP24vyFPfbJlbFYC0EUKOJmNZuAOybq6H6
IgpmMWn3naDQaJBn2mmW588flIRwO1aaA63IHlHvgCTsmiwIVQLlxmF260jaNpke
vfj5Ni7fMG98w0cElgCxOurX3Yv7BJzQhU4oJXDXnC8f08xErfTfBfdWZ2j9sXVk
Id0XXkxWPtvbvQhkdwav4KAUDDoLNPUk7siq9teXaC2DUhi93L+ENGRvx2TGyAXt
rDr4bFNvZj0gsbPbj+HnkYw4dtiolhCehdjxUQb8ie5PBnKMPvbv9UlsPywGY6Yg
nuFf9NM0Amlgl3nvyf8YVgOIUEAWC0lGIaaK+XXrwzt1Kauy8eqwyBkTze/vUOcr
jvmYh4yFMpnOoayjxnCAm/V+HRV/v/zqxfodYa4Wj4Ozydntzr3JFqotB9V7g38Y
qqRL5vy6AGu102zE8UDiP5qFhCm6Rv2vq9hvXifdpYeq8F4Sjo9yAWSKyW6B6vao
dypGWyxWz5loaxZUjVIr
=TAVZ
-----END PGP SIGNATURE-----

--kVcb4xucqmsYUpQy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
