From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i-q8-common: Add support for SDIO wifi
 controllers
Date: Thu, 1 Sep 2016 22:37:33 +0200
Message-ID: <20160901203733.GI20462@lukather>
References: <20160826145236.30210-1-hdegoede@redhat.com>
 <20160826145236.30210-4-hdegoede@redhat.com>
 <20160829065620.GC7612@lukather>
 <724a6222-36e3-e230-5071-a7cb23c51697@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2456093220483561363=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <724a6222-36e3-e230-5071-a7cb23c51697@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2456093220483561363==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="boAH8PqvUi1v1f55"
Content-Disposition: inline


--boAH8PqvUi1v1f55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Aug 29, 2016 at 11:46:14AM +0200, Hans de Goede wrote:
> On 29-08-16 08:56, Maxime Ripard wrote:
> >On Fri, Aug 26, 2016 at 04:52:36PM +0200, Hans de Goede wrote:
> >>Most of the sun8i q8 boards have an usb wifi controller, on the
> >>variants which use an USB wifi controller, this will result in a
> >>couple of error msg-s in dmesg when proving the sdio bus and
> >>an used mmc controller.
> >>
> >>The best way to deal with wifi on this boards really is to simply
> >>let the kernel auto-detect usb or sdio wifi controllers, so we
> >>will just have to live with the few errors in dmesg.
> >
> >No, because that grabs PINs that might or might not be supposed to be
> >used for that, it leaves clocks and regulators enabled, which draw
> >power, to no end. And that's even worth since most boards will not use
> >it.
> >
> >You can put the definition of the nodes in the DTSI, but the final
> >status will have to be in the (relevant) DTS.
>=20
> This is again the q8-tablet thing where china produces a new variant
> every 2 weeks. So we've sun8i-a23-q8-tablet.dts and sun8i-a33-q8-tablet.d=
ts
> which try to be generic dts files for these tablets, since creating
> a custom dts per variant is madness.

This is almost unrelated, and probably some wishful thinking, but I'd
really prefer to support *one* board properly, with all its features,
rather than supporting every random Allwinner device with half baked
support, because no one ever updated the DT, or there's simply no
driver. But hey, I can't force you to work on something either :)

> This commit puts the node in sun8i-q8-common.dtsi because the
> A23 and A33 are pin compatible and we've tablets where the
> only difference is the SoC soldered on there, the use the _exact_
> same PCB and components otherwise, so we have all the sun8i q8
> stuff in a common place for sun8i-a23-q8-tablet.dts and
> sun8i-a33-q8-tablet.dts, those are the only users of this
> dtsi file.
>=20
> You've already merged the bits which handle the variants with
> an USB attached wifi module (enabling ehci0 also on boards
> where nothing is connected). This is the counter-part for
> PCB's which use a sdio wifi module (about 90% of all boards
> in my experience).

I'm confused. Are most boards using an USB wifi chip, like you were
stating in your commit log, or an SDIO wifi chip like you just said?

> As for turning a regulator on unnecessary, both the wifi and sdio
> wifi solution use the same regulator, so that is already turned on
> through the usb bits and it needs to be in either case.

Ok, so indeed, that's not as bad as it sounds.

> The only downside of this approach is that we either have
> the USB controller turned on unnecessarily (in most cases)
> or the mmc controller (in the rare A23 tablet which still
> uses an USB wifi module).
>=20
> This all actually fits neatly into the plans to do hardware
> autodetection for these tablets which I'm working on, in
> this case we can just let the kernel handle things without
> additional code (think the beaglebone capemanager) since
> both busses are discoverable.
>=20
> Once we have the q8-hardwaremgr I'm working on and hope
> to post an RFC of soon, we could even make that turn off
> the unused controller (as a future enhancement).

If that's on your to-do-list, that's fine by me.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--boAH8PqvUi1v1f55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXyJGNAAoJEBx+YmzsjxAgcoQP/2+7+dqloXufLSV8UQTX5C/W
0eNzrlUPgWFqTvbYOZ99sf263RVKwLPnV8SevvBl+MNAYZQy5KDIaHPKUvyGTv26
TVQ1drepbGq+XcA+T7l4CnVXwczd9BRhcHZeeq0Hm6SvILveWEpR8rfhumDSFInV
+VWJ2tDTuguV8BAUcux9ErO6HpYmNVgVYVRLJ5rlctdpeOONcLtIxv0NAXmn7QMi
kfEkUmY0Ld0Lz9WaA4Apc/V+ytAvvoaR2akZJKnJEfTPNZNK5fNlkVqux3ol5lf/
MNA454SXjg1yHXQDin3c99oKadlEJ0r+ehTJ9sbRIp8M3R63dYq+qQBiIePnHKaC
gUKyYVpIxInhy3CGRs74OKQEU9rcCFfpA4O0VctW32pnWjvth1IXGrTZzL3QNIZf
JHw9HMO5AHQiT4e9XEriFLmwhjfS3Ad5ymDom2bUJba/7Or8WmcizLJf53iSM7JH
VcbBYqgET0ug2acQaDnLR/bCMvwNCsZEFDemOPjYwRMJ6dKqZRUV04O14/iB0nM5
Cc4xUd6WWyPuhnod1vXpvLVHu/QUfBrqaNgQtc8hQSaVS7PqbI3Gvql0rjD8udNL
pb00rAfJRqMLw+lE7N35piS5P/q7A8loE/Plq0Mia7M/5qaO4VIjdhTRUfRcN9FV
/HszC2swhOBPpZ2CEZiu
=wJl0
-----END PGP SIGNATURE-----

--boAH8PqvUi1v1f55--


--===============2456093220483561363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2456093220483561363==--
