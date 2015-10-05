From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH][RESEND] drm: panel-simple: add URT UMSH-8596MD-xT panel
 support
Date: Mon, 5 Oct 2015 13:01:12 +0200
Message-ID: <20151005110112.GA16920@ulmo>
References: <55E5AD23.8070309@maciej.szmigiero.name>
 <560EF9C0.7080407@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0407155744=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <560EF9C0.7080407@maciej.szmigiero.name>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0407155744==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2015 at 11:40:16PM +0200, Maciej S. Szmigiero wrote:
> Anybody here?
>=20
> I've already submitted this patch two times but received no response...
>=20
> Maciej Szmigiero
>=20
> On 01.09.2015 15:50, Maciej S. Szmigiero wrote:
> > This patch adds support for United Radiant Technology
> > UMSH-8596MD-xT 7.0" WVGA TFT LCD panels
> > (both LVDS and parallel versions) to DRM
> > panel-simple driver.
> >=20
> > Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
> > ---
> > This is a resend without changes.
> >=20
> > diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.tx=
t b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> > new file mode 100644
> > index 0000000..2990e6b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> > @@ -0,0 +1,11 @@
> > +United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
> > +
> > +Supported are LVDS versions (-11T, -19T) and parallel ones
> > +(-T, -1T, -7T, -20T).

Please don't use this kind of wildcard compatible values. If these are
different models then each of them deserves a separate compatible
string.

Thierry

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWElh4AAoJEN0jrNd/PrOhhuwQAJoegH4do+cC5jAPQXRDXvD5
kE+3swQ5IvDu/RFTcQHwZyDg8685eXt12c0pzSB9+xuukVSju0CvjlaJUKpoTvMc
nHx1YYWpekGoQxVE77PHG0lfpG4OCFCXAy7pIUqGr2v9k7XgpYGGYRcVxQAZzKnf
7ouZpCFaS0JEBDXvozV22YUNGXJ93qzfSKiMVMGCDUL3abeauyo9fPFNSeiRsgAg
7Auqyp9/2JhXvSTzw863p+ezxuaHOMemZYPCi22+LW1SPi9lwyYRrlL7WHqZlC32
bGOytfE7laQTTLXIg+2bFapvfkEIoumirQ5BbZUzrwSzthN3HhmJZRSYDizv9ZMo
0k+QTIOmcNeQ//y04FaPo8N5W8+gT+nIjWDjNu9vwMWg4xDqcTM+/LCmzI9blbUg
3tAIiLk1Ry6V1POliv/7FyR1ET0T8zqJY1u57+qqMB35A+KsYmZ9/FsBjrRoD+hW
kvIhPG5K6UyA8HBM+GuXVY+SdAybHNwuuDYpOrwhTxQ8mgu90ISd1IrPuz2yNLOX
SnwD8sICDpXLL39u5xqggn5CmS9tdUfZKRD/X8XMQjDWkrHg4OjRNxMg1634S4jL
aCjVL6sfYqERFy7Sv3EQyDtR7APLRVm7pL5KHpB7Oi7CFNutlH5yengFOha1BMZT
E+fbwPifbuqol+E2pRnW
=oMGv
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============0407155744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0407155744==--
