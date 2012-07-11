From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v2 07/19] tegra: fdt: Add LCD definitions for
	Tegra
Date: Wed, 11 Jul 2012 07:48:43 +0200
Message-ID: <20120711054842.GB10344@avionic-0098.mockup.avionic-design.de>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
	<1339604395-6621-8-git-send-email-sjg@chromium.org>
	<4FDA749D.2030201@wwwdotorg.org>
	<CAPnjgZ2MUpjGS-BwQ6yASahFiu2OTWx4RUrJ7bkSkq72QmX++Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0888557223=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ2MUpjGS-BwQ6yASahFiu2OTWx4RUrJ7bkSkq72QmX++Q@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org


--===============0888557223==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2012 at 06:44:10AM +0200, Simon Glass wrote:
> Hi Stephen,
>=20
> On Fri, Jun 15, 2012 at 1:32 AM, Stephen Warren <swarren@wwwdotorg.org>wr=
ote:
>=20
> > On 06/13/2012 10:19 AM, Simon Glass wrote:
> > > Add LCD definitions and also a proposed binding for LCD displays.
> > >
> > > The PWFM is in progress on the device-tree-discuss list, so only a
> > > very basic binding is offered here.
> >
> > I believe we have settled on a final representation, it just hasn't been
> > added into linux-next yet. See:
> >
> >
> > http://gitorious.org/linux-pwm/linux-pwm/commit/d3ce73e5dc86646a6302f2b=
0f7dd40e8c552fa04
>=20
>=20
> Thanks for the pointer. I suppose this doesn't address clocks as yet, but
> that's fine.

I was waiting for the common clock framework and DT bindings to get
ready. This should happen RSN for Tegra so I will probably look at
adding support for it in.

By the way, the PWM tree has now been in linux-next for a couple of
weeks and I plan to submit it for inclusion in 3.6.

> > > I am not sure if it is better to have the lcd within the display
> > > controller as with i2c/spi, or a separate node. From a hardware point
> > > of view the LCD is certainly connected to the display controller, so
> > > perhaps this version makes most sense. We could have a stand-alone
> > > top-level lcd node with a phandle pointing to the display controller,
> > > but these doesn't seem to be an obvious advantage to that approach.
> >
> > Equally, there's been extensive discussion re: how to represent the
> > NVIDIA display controller in DT. I strongly believe that U-Boot
> > shouldn't go ahead in isolation with a binding that's completely
> > unrelated to what's happening in the kernel. Please can you take what
> > Thierry is working on for the kernel, and/or contribute to that binding
> > etc., so we don't end up with multiple ways of doing the same thing.
> > Part of the whole point of DT is to have a single way of representing HW
> > that multiple OSs (or perhaps bootloaders) cna use. If everyone just
> > goes and does their own thing, we've lost.
> >
>=20
> I can see the email here.
>=20
> http://lists.freedesktop.org/archives/dri-devel/2012-April/021223.html
>=20
> I posted this series originally in January. That email is from April, and=
 I
> don't see activity in the last 2 months. As previously discussed it is not
> productive to chase a moving target.

I had hoped I could get this finished much faster, but then things
happened. However there has been quite some progress in the meantime.

I actually based that very first version on what you had in the earlier
Tegra LCD series with a couple of additions to support DRM
specificities. However the proposal was shot down pretty early mainly
because the display timing description was very Tegra specific. One
proposal was to include an EDID blob directly into the DT and pass it on
to DRM, which is what the current code does.

Lately there's been some work on adding a generic description for
display timings:

	http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html

I haven't tested that code yet, but it might turn out to be an
interesting replacement for the EDID blob.

> Thierry, have you settled on a binding yet? If not do you have something
> sort-of close that I could use in U-Boot?

The currently accepted form (as in "Stephen said it looks reasonable")
is here:

	http://lists.freedesktop.org/archives/dri-devel/2012-July/024899.html

It currently only defines the bindings for the RGB and HDMI outputs, but
that should be fine since from what I can tell your U-Boot driver
supports RGB only anyway. It is probably also way more than you really
need in U-Boot because it has DT nodes for all the graphics-related
modules.

Thierry

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP/RO6AAoJEN0jrNd/PrOhNjwQAKrZmjU9Y1x4SIBk5QGbbFIc
P7VDDajZ4BKtRXzOzIjJy6tFeLHd1XRdbuVtrmp641714pLRsYFHy6HzBUald7ak
MtLdd3ATmxpwfMZ8HRyf4YBEOaouIGfDGh8EdmrDemu7XpZZdtAmRuWQIvZgEeMY
gXJTv5r1Vk/8Q2nfwd1rWG0U/jybW9pfEEwp74Uv1mvn5kyUu4NNjm70c7la+Z6E
B/yO7A0iPx5uIxqEqP9/N0QHmVmU3nistak+iiKfzqZuctJsJaaJ0acaXPsZA9ib
ScbncHh8gYsx1jtsyTDalRq+qrvThFnV5kY0gXFQ0iHElo2ZkJNLuN1VRrn1uSyJ
4gRhDRc589M7fGdPpYotfBlQIlt26wo+n7lVzJggna3giYHdTZ9bIh3bmMvcScMQ
2AJ5g0W3nTizYi0DYolDrPgZ9xGplQPumzbiAhSkP/KEziYCW7FlXOB3sySKmLrR
IcwBStvr36FpONY9ulb8bI5ABZA0eYm+sDKz/uHVhJyqEj3JvC5xraSC+GzPSlB1
Bo1gdfsnXwclI0BRMEezA9mETOMzQmL22L5A3fzRbnTPavps4jW9GFZO1ZSetrmy
znA+A1Xq17Nl9Vwhko8aWcY9tr87EMdD5f4M0IOBEpQQexx8w5T1g8T0mjC7usu7
Q5ho/h9/EsCWc1O7sD1j
=xWdZ
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--

--===============0888557223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0888557223==--
