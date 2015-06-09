From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: dw-hdmi: support optional supply
 regulators
Date: Tue, 9 Jun 2015 09:53:32 +0200
Message-ID: <20150609075331.GA28198@ulmo>
References: <4184159.j0iXe39dFB@phil> <2619686.csNBBFyt8W@phil>
 <20150605110159.GA16254@ulmo.nvidia.com>
 <23123577.mOoqGCAPdL@diego>
 <20150605231058.GQ7557@n2100.arm.linux.org.uk>
 <20150608140256.GA10354@ulmo.nvidia.com>
 <20150608142926.GY7557@n2100.arm.linux.org.uk>
 <20150608154448.GA11103@ulmo.nvidia.com>
 <20150608163420.GZ7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1185588662=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150608163420.GZ7557@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1185588662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2015 at 05:34:21PM +0100, Russell King - ARM Linux wrote:
> On Mon, Jun 08, 2015 at 05:44:53PM +0200, Thierry Reding wrote:
> > On Mon, Jun 08, 2015 at 03:29:26PM +0100, Russell King - ARM Linux wrot=
e:
> > > You're asking questions we have no real answers to - all we have is t=
he
> > > available documentation provided by Freescale - we don't even have the
> > > Rochchip documentation.
> > >=20
> > > From the Freescale documentation, which documents the HDMI transmitter
> > > entirely separately from the HDMI phy, I would say that the IP is
> > > structured as two entirely separate blocks, and the chip designer is
> > > free to choose an appropriate phy from a range of HDMI phys.
> >=20
> > Does it associate any of the registers with the HDMI PHY? According to
> > the register definitions in drivers/gpu/drm/bridge/dw_hdmi.h the PHY
> > registers are interleaved with other registers that are likely part of
> > the HDMI transmitter proper (there are things like HDCP and CEC engines
> > in that IP as well).
>=20
> The protocol stuff is handled by the HDMI Tx - the phy is the conversion
> from the internal digital to the interface domain.
>=20
> I could write lots to describe it, but really, the best thing to do is
> to download the iMX6 documentation and take a peek at it...
>=20
> https://community.freescale.com/docs/DOC-101840
>=20
> Particularly, look at the HDMI 3D Phy section, the system level block
> diagram (34.1.5.1), and 34.2.1 which has the top level I/O diagram for
> just the 3D phy.
>=20
> The previous section (section 33) covers the HDMI Tx.

Okay, that matches the picture that's been forming in my mind after
reading the code.

> > > Moreover, in the feature list for the HDMI transmitter, it says (thou=
gh
> > > this is not applicable to iMX6 - and is probably lifted from the
> > > Synopsis documentation):
> > >=20
> > > "* Option to remove pixel repetition clock from HDMI TX interface for=
 an
> > >   easy integration with third party HDMI TX PHYs"
> > >=20
> > > So - here's the question: what do we do when we find something using =
the
> > > Synopsis design-ware HDMI transmitter with a different HDMI phy?
> > >=20
> > > Remember, VP, VPH, VP_FILT_* are all part of the HDMI phy according to
> > > the freescale documentation, and not part of the HDMI transmitter.
> > >=20
> > > > I
> > > > see register definitions for a "source" PHY and a "master" PHY, whe=
re
> > > > the latter seems to be an I2C controller rather than a PHY. Perhaps=
 it
> > > > is used to communicate with an external PHY?
> > >=20
> > > I'm not sure where you get that from.  Maybe you could give a chapter
> > > reference?
> >=20
> > That's just from skimming drivers/gpu/drm/bridge/dw_hdmi.h (register
> > offsets 0x3000 and the following). The large gap between them and the
> > preceding FC registers could be an additional indication that they are
> > indeed separate IP blocks. Then again, the AUD registers start at an
> > offset of 0x3100, so maybe it's no indication at all.
>=20
> Ah, you're getting slightly confused.
>=20
> All those registers are to do with the HDMI Tx itself.  The block at
> 0x3000 to 0x3007 is to do with the HDMI Tx receiving various status
> signals from the HDMI Phy, such as HPD, rxsense, and whether the phy
> PLL is locked (which I'm fairly certain is mis-described, as there is
> no output signal from the phy to indicate this, but there is a TX_READY
> signal.)
>=20
> The set at 0x3020-0x3032 are to do with talking to the HDMI phy over
> the dedicated I2C interface integrated into the HDMI Tx.  All the
> HDMI Phy registers are accessed through this I2C interface.

Good, that also matches what I understood from reading the driver code.

> > > What if someone designs a chip with their own HDMI phy which uses
> > > different supplies?
> >=20
> > That's really one more reason to write proper drivers for the PHYs. If
> > you really ever have to deal with a different PHY chances are that more
> > than just the supplies will be different, in which case you'd need to
> > somehow also abstract away the interoperation between HDMI transmitter
> > and PHY.
>=20
> Exactly, but that didn't happen before this code moved out of
> drivers/staging, which is rather unfortunate, but everyone was too busy
> to put much thought into that.
>=20
> This is one of the problems when drivers are taken from BSPs rather than
> going away and writing something from documentation: if you start afresh,
> you can model the code according to the documentation without any of the
> original BSP decisions in place.  If you start from the BSP code, you
> have a whole pile of changes you need to identify, and it's very easy to
> overlook something, because what you have works.
>=20
> It's something which _should_ be done nevertheless.  The problem is
> finding someone with the time and motivation to do a good job.

Interestingly, though, it seems like the PHYs for both i.MX and Rockchip
are register-compatible because they work with the same driver code. It
could be coincidence, or simply that they both use some standard PHY as
provided by DW along with the HDMI transmitter IP.

Most importantly, like you said, any "damage" has already been done and
in order to keep devices working with existing DTBs we'll have to add
fallback code for backwards-compatibility. I'm thinking instantiating
I2C clients for drivers matching the i.MX/Rockchip code directly from
the HDMI bridge driver if no child nodes are found in DTB.

As for finding somebody with the motivation and time to do it, I suspect
we could just wait for the next user of DW HDMI IP and let them deal
with it. Perhaps documenting our findings in the driver would be helpful
if that time comes.

For the matter at hand, I think we all agree that keeping the supplies
Rockchip-specific for now is the right thing to do.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVdpt5AAoJEN0jrNd/PrOh8PsP/iVZdX4a1SJ7NijJisPfGK3c
anb0Gj5/xS0VvAFsXhRUvIKLFtVCn5mAeVnWsIcKoD8ZZ1+WpCrC0eoEWXfMHMNZ
asn2tpIFVbY5JARz2tQap2u3Dn5hS+tkhS4OIY78S3r28qbE5xeABzfLHWTSX51U
VqTV9cMN2SJjJOYh+qpRdkWS5UhfntKqFmwIA65+VdXB2Lr0tvoYXa6eek4wfyw8
s3jij8RHlsRNNWCpYKVil0qmTFymKR79bQ+NURRW39KchOj1L58B/PJMpwatuNDe
seCm4GmLZu/2EfFqAACYZg33399rdQiSBiOYBY42LrUA1/nKqIA0Rkt4hzlI7u3f
Tf8fzsQ326OJQE3MS/re7t5MRr8wj+pWfkBZx6B5J7yVjvZ1K5Nr9/IBG5/2QTRH
uT+UMKDOvXPSA8gaJQli9FConylFGKHK+pjpL0akDvfDORUcdlDDCfb+885asiOx
L4zJG0j2KTHAVdi0czIIaoxH5EQFqjUyavc1gghDmAO5IBFOUBMunmkGZ7XATEfp
eSFngdMXIpeoYi8OKW7peawbX4E2W50Wa1ylQDQc7CvosOhLmuS/MtPYl/fi3jaY
rX7twYaDPKKleCPfuVBXSgPBigmmh8BrCGDZw9FDlJEwY8Tvlhf9Y3Ghd//Zw6F6
d03oW1kDk2YiwCDGUazz
=aZ+q
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

--===============1185588662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1185588662==--
