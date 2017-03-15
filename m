From: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: media / v4l2-mc: wishlist for complex cameras (was Re: [PATCH
 v4 14/36] [media] v4l2-mc: add a function to inherit controls from a
 pipeline)
Date: Wed, 15 Mar 2017 14:55:09 -0400
Message-ID: <1489604109.4593.4.camel@ndufresne.ca>
References: <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
 <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
 <20170311082549.576531d0@vento.lan>
 <20170313124621.GA10701@valkosipuli.retiisi.org.uk>
 <20170314004533.3b3cd44b@vento.lan>
 <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
 <20170314072143.498cde9b@vento.lan> <20170314223254.GA7141@amd>
 <20170314215420.6fc63c67@vento.lan> <20170315105049.GA12099@frolo.macqel>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7947588325951320460=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170315105049.GA12099@frolo.macqel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe De Muyter <phdm@macq.eu>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, Pavel Machek <pavel@ucw.cz>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, p.zabel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.orglinux-
List-Id: devicetree@vger.kernel.org


--===============7947588325951320460==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-7fq51Td7eGbeBp/kWBM3"


--=-7fq51Td7eGbeBp/kWBM3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 15 mars 2017 =C3=A0 11:50 +0100, Philippe De Muyter a =C3=A9cri=
t=C2=A0:
> > I would say: camorama, xawtv3, zbar, google talk, skype. If it runs
> > with those, it will likely run with any other application.
> >=20
>=20
> I would like to add the 'v4l2src' plugin of gstreamer, and on the
> imx6 its

While it would be nice if somehow you would get v4l2src to work (in
some legacy/emulation mode through libv4l2), the longer plan is to
implement smart bin that handle several v4l2src, that can do the
required interactions so we can expose similar level of controls as
found in Android Camera HAL3, and maybe even further assuming userspace
can change the media tree at run-time. We might be a long way from
there, specially that some of the features depends on how much the
hardware can do. Just being able to figure-out how to build the MC tree
dynamically seems really hard when thinking of generic mechanism. Also,
Request API will be needed.

I think for this one, we'll need some userspace driver that enable the
features (not hide them), and that's what I'd be looking for from
libv4l2 in this regard.

> imx-specific counterpart 'imxv4l2videosrc' from the gstreamer-imx
> package
> at https://github.com/Freescale/gstreamer-imx, and 'v4l2-ctl'.

This one is specific to IMX hardware using vendor driver. You can
probably ignore that.

Nicolas
--=-7fq51Td7eGbeBp/kWBM3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAljJjg0ACgkQcVMCLawGqBzWHACfQymBOSCSce0cthYH9b7XZ0jx
87wAnR09ioCl/7XxAg/iQxU6O3boR99I
=mn5/
-----END PGP SIGNATURE-----

--=-7fq51Td7eGbeBp/kWBM3--



--===============7947588325951320460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7947588325951320460==--
