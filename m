From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: fix uart1 CTS/RTS pins at PG on
 A23/A33
Date: Tue, 23 Aug 2016 11:54:06 +0200
Message-ID: <20160823095406.GG2598@lukather>
References: <20160823055826.20591-1-icenowy@aosc.xyz>
 <20160823064755.GA2598@lukather>
 <CACRpkdaHY=TFE3H=CM2fu3etHcWq569MDOE2cJY=PGZauHwO2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3852953016822946332=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaHY=TFE3H=CM2fu3etHcWq569MDOE2cJY=PGZauHwO2g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============3852953016822946332==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline


--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 11:27:10AM +0200, Linus Walleij wrote:
> On Tue, Aug 23, 2016 at 8:47 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Tue, Aug 23, 2016 at 01:58:25PM +0800, Icenowy Zheng wrote:
> >> PG8, PG9 is said to be the CTS/RTS pins for UART1 according to the A23=
/33
> >> datasheets. However, the function is wrongly named "uart2" in the pinc=
trl
> >> driver. This patch fixes this by modifying them to be named "uart1".
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >
> > This looks good, but could you send it to stable?
>=20
> If that is an ACK I can tag it for stable when applying.

Yes, it's an ACK. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvB0+AAoJEBx+YmzsjxAgmhMP/jzwVLVuULLiBnft5sx9TQA6
VNiFGK6cldL6vWSdkiHqr43qHkIXbfyotanjFZFJHnXWITlDGEufUOc0UTXPf1kM
9Pv5Ri7dI7+pg/4JqrdN6+RkmhfTtVKitjBvI9E0RXBOoNggg4NiMja86iwAp/WA
TTgWVK7ozdgYSlnELa0BV9RvnhHBngAYOdITvoKOYuqEnBp4Cd1z92d3LnILe09N
FktmFecFLzdF7IIS7JKWEFYZYiFSu0/elJ4KOz3DTlA7CohXNkGtMsWhV1xwpFUX
1Oa4y8FdAxE4/ohNjPF5YwJ359JmA1klsoG3DdKvl/oNsYvqHPs72KxuA/GGvT7D
ElcwpOK82KXwH6X2uz8wa3H3yjLa8WuMV/xjN0u02/9Eg0MlpgNRYxkmi//guYou
RgFM3FE5SD810rcAR0ns97Sipt9Hiao9X2XNhTf376/wzBjKnXpxp0QBbq8HWieJ
bqu3elCKdBz9ln3li4nXtAX+IGvpumtHiweAhv5vrZ+47flmTOtDpvX8emVDvBl+
n2Lhj+DkMLfqC8iEt0ZT3HldO2qkOM5ZjqOHQHlKabVAxyRLMjz7cZWlbpD7KbZB
De8R5WIDbZyO3QCrFsPDlB61U6L2OB8lOJa0jjd/oe8xpTAPKIU5H9iGfcxx6dR+
Puhv3BZwKj+IKwyXU8OZ
=n5qn
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--


--===============3852953016822946332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3852953016822946332==--
