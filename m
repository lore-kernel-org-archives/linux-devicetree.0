From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Tue, 26 Nov 2013 09:59:12 +0100
Message-ID: <20131126085911.GA27752@ulmo.nvidia.com>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
	<2120855.5UlavpPp2J@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1775981963=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2120855.5UlavpPp2J@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1775981963==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2013 at 02:54:41AM +0100, Laurent Pinchart wrote:
> Hi Thierry,
>=20
> Thank you for the patch.
>=20
> On Friday 22 November 2013 19:41:54 Thierry Reding wrote:
> > This binding specifies a set of common properties for display panels. It
> > can be used as a basis by bindings for specific panels.
> >=20
> > Bindings for three specific panels are provided to show how the simple
> > panel binding can be used.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > This binding has already been discussed earlier. Both Laurent and Tomi
> > seemed to be generally fine with this.
>=20
> That's correct, I'm generally fine with your approach, but there's still =
one=20
> point I'd like to see addressed.
>=20
> As I mentioned previously, I would like to avoid adding zillions of compa=
tible=20
> properties to the driver, when we could use a single property in the DT=
=20
> bindings that would specify the timings instead. This would lower the amo=
unt=20
> of changes made to the simple panel driver, while keeping DT simple enoug=
h (at=20
> least in my opinion).
>=20
> Specifying the full timings in every DT source file would be pretty verbo=
se=20
> and could be error-prone. However, using a single property to specify one=
 of=20
> the standard display timings, as orinally proposed by Hans de Goede (CC'e=
d)=20
> during a chat at the kernel summit would in my opinion be a good middle-g=
round=20
> solution.
>=20
> Would you consider adding such a property to the simple panel bindings, a=
nd=20
> define a common compatible string ? Each panel should of course list its =
own=20
> compatibility string in addition to the common compatible string in case =
the=20
> need for extensions arises in the future.

My gripe with this is that it duplicates information. By definition a
simple panel supports a limited number of display modes (typically only
a single one), so once you know the compatible value (which needs to be
there anyway) you can derive the mode from it. Adding a property that
specifies the display mode is redundant.

Dave Airlie proposed something else, namely to keep a list of common
modes within the driver and have each device reference that mode
instead. I think that could work similarily well. It still requires the
driver to be touched for each new panel, but the changes will be very
small. They'll be more of the "add a new table entry" sort of change
that we have in drivers like the 8250/16550-compatible serial. Most of
that could probably be wrapped into a macro to make it concise.

Thierry

--DocE+STaALJfprDB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlGLfAAoJEN0jrNd/PrOh9vQP/jRQt2pQ4IYuAi/n3J4L5de+
Pw+1yFHWNT8nsTLWyYb5vo9Lnk87pcj6L2YRCfKQQhrI8cjHsbWa+305piLbxRlz
EgylymRZZDFD1tFJ3Q3mO/h9p0RsX4M8iPqIF4LS2c4QYDlQR0/d9He3xpdDlXw9
nXH/TR6f3fjVM6NJ851v+gUJ6lHlnxD4FsmkMLIvzf2mAk2Sa26B5eubrFkshLZJ
SDDSU0qdSBkLJ9Vy01iHbjlHLbN4XoXah4SN5GGOajDj9ciu+Pih58h4aQrFQ9zu
aQFxXgRy9zJi9RtyHf//rHzMOJg4mDHktV3g5bLCD/G4iMOGh+dPk+RuSGcTqRBI
NtQpG6c9B/U8W3hXCVujh3rzxFXVYu5KyE+Wy232o0seGeRMk4kPKzQPnNAmbL5Z
LlpEjnC+VFn4vQLr7n/O8oajXy8WswRW9ytQk7Wvu18aN4/RNGijJ4QkC6Sxqqaz
gVQjim1/RJ00N802EkpnMWvVRwXErvNceCHPUBWg0Ze0FiUFn/wVbFFQLmclBDZh
26eK//l0F177vxv1xkUaO/cm6HGhuDBp4dfYVbHj5ZacNDGS0z6NTLCSx+gQG6zo
WeRCeUbo+d+2Xq4Pjp9VfsH+b4eUklY/v1yy8T/vQIcWAQ7epiKLiA1CVOuAaRBQ
maFISaLTn7CU/Vb6/iBe
=fF1X
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--

--===============1775981963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1775981963==--
