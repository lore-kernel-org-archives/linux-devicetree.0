From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/4] ARM: dts: sun8i: Extend Orange Pi PC dt to also
 handle the PC Plus
Date: Wed, 31 Aug 2016 18:28:19 +0200
Message-ID: <20160831162819.GK14379@lukather>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
 <20160713084505.GE4761@lukather>
 <bce2b340-a930-8771-4560-dc61bf5828d5@redhat.com>
 <20160725064033.GA7419@lukather>
 <74d3b5eb-601a-cc1d-a44e-fea2895fd8b2@redhat.com>
 <20160728181757.GD6682@lukather>
 <f71f9d2b-00d4-27b8-1535-1ddc58f04ca3@redhat.com>
 <b6636083-917e-cc3a-9107-401fbd483fb7@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1155198543418189867=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b6636083-917e-cc3a-9107-401fbd483fb7@redhat.com>
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


--===============1155198543418189867==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gWRamliw218YCZO9"
Content-Disposition: inline


--gWRamliw218YCZO9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Sorry for the slow response, it was burried in my inbox.

On Sun, Aug 07, 2016 at 04:25:20PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 28-07-16 22:36, Hans de Goede wrote:
> >Hi,
> >
> >On 28-07-16 20:17, Maxime Ripard wrote:
> >>Hi Hans,
> >>
> >>On Tue, Jul 26, 2016 at 11:07:23PM +0200, Hans de Goede wrote:
> >>>>>>Nothing prevents you from including the orange pi pc dts, from the
> >>>>>>orange pi plus dts.
> >>>>>>
> >>>>>>It prevents the duplication you were trying to avoid, and it doesn't
> >>>>>>create all those spurious errors and devices.
> >>>>>
> >>>>>That would solve the copy paste problem on the kernel side, but that
> >>>>>would still mean adding a new u-boot defconfig for this, which means=
 that
> >>>>>all the distro's which ship with prebuild u-boot binaries need to bu=
ild
> >>>>>for yet another board, something which I would like to avoid.
> >>>>
> >>>>Still, registering devices that are not present on the board is not an
> >>>>option.
> >>>
> >>>Ok, new version send.
> >>>
> >>>What about the other 3 patches in this series ?
> >>
> >>I guess the same comment applies for patch 2.
> >
> >The difference is that there really is no harm at all from
> >enabling the extra usb controllers used on the plus 2e
> >on the plus and plus 2 as well, no errors, no nothing, they
> >just sit their as usb controllers without an usb device plugged
> >in. But if you insist I can do a separate dts + u-boot defconfig
> >for the plus 2e as well (but I would rather not).
>=20
> Ping, what is the verdict on this, are you ok with the patch or
> do you want me to create a separate dts file for the Orange Pi
> Plus 2E, note that doing so is going to be highly confusing to
> users, there are 3 plus boards:

I still believe that enabling clocks, regulators, claiming pins for
device that are entirely unused on the board is not ok.

> Orange Pi Plus
> Orange Pi Plus 2   (same as the original plus but with 2G RAM, uses same =
u-boot defconfig / dts file)

Yes, that makes sense.

> Orange Pi Plus 2E  (drops the USB-hub instead using all 3 host controller=
s)

However, I'm really worried about this one. If we go this way, there's
essentially no going back. If for some reason we want to have a
separate DT in the future (some unforeseen quirk to apply, pin to
setup that conflicts on another board, etc.), we will be completely
screwed because our users will be expecting to use the common DT,
while it wouldn't be wise anymore.

The other way around is much easier to deal with.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gWRamliw218YCZO9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxwWjAAoJEBx+YmzsjxAgfjgP/2k/m2i2MYQOgHY6/VsrLdSi
EBwMn9Of+R482jMUG0i1L7jpxsaAVlfqb7S5oWB4VWLd5kupI0ifNUXS/8XM2stL
9RpTcQ9DYRAJxiDNXLD63aZbAkzJY78ssH/jb7jXSfaw8tuk4YMpXR2e00L+zWUr
ll4/Ll/SWWUHEKSt92k9PkXV8t/RHQQg5W8WM/wJ48p3KSBt6bqxLD5EjeYcetQh
7RLRogjcoAaOVUbnKInItPnPu5V6XsqdDoxkPtgBWkJJSUNlLbWcZJy4KExHIOVd
rj0ZqYlNdNOnA6koozKxSlENlftkNU7TUjtSJZapQVRYwosyIs+heuW/myfSpwW4
uA1BXvmWdjUL8rml+B61d4os9tpWKP2EUXJBEg/HzmhrhPNLx4w8rLs5yvkIIAyt
5DAUHq5KAwmdV3MtpgIO4IMuyFfBiZRUllmnFhiD39EXciqr3xrZCpAs+lmeWrHb
n6+QRnlMHzuHd9U9Vx9P5OGlnjpMOZ227CbMsxHfdmh47Spn0K1IS/BEvX3PCo7X
Nbt2NEuzpUjhNt9u4HBDFye7O2LelKFOy7L+oIHmpt2dqeRXPA912AB1paCV9niO
z5sWaGxEs4s+xaKp3cS9X+MuEGoeUEc9C2lcEnvlQ4ZBMh+E4iJtC0KwIFkBoM1A
5Ko4iIcEYjJWIWbx5fNc
=DSsu
-----END PGP SIGNATURE-----

--gWRamliw218YCZO9--


--===============1155198543418189867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1155198543418189867==--
