From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [RFC PATCH 1/5] of: introduce the overlay manager
Date: Thu, 27 Oct 2016 16:03:42 +0200
Message-ID: <20161027140342.kidk4gqxwbtphrbs@kwain>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com>
 <20161026145756.21689-2-antoine.tenart@free-electrons.com>
 <CANLsYkyszsn2TLYhUjHMt2ZnEUmE9eSc71W2KWBL0fWhh3PPBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7370374090581139409=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANLsYkyszsn2TLYhUjHMt2ZnEUmE9eSc71W2KWBL0fWhh3PPBw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, pantelis.antoniou@konsulko.com, Antoine Tenart <antoine.tenart@free-electrons.com>, sboyd@codeaurora.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============7370374090581139409==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6hgzb4napxgrvdnd"
Content-Disposition: inline


--6hgzb4napxgrvdnd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mathieu,

On Wed, Oct 26, 2016 at 10:29:59AM -0600, Mathieu Poirier wrote:
>=20
> Please find my comments below.

Thanks for the comments. I expected more distant reviews, on the overall
architecture to know if this could fit the needs of others. But anyway
your comments are helpful if we ever decide to go with an overlay
manager like this one.

> On 26 October 2016 at 08:57, Antoine Tenart
> <antoine.tenart@free-electrons.com> wrote:
> > +
> > +/*
> > + * overlay_mgr_register_format()
> > + *
> > + * Adds a new format candidate to the list of supported formats. The r=
egistered
> > + * formats are used to parse the headers stored on the dips.
> > + */
> > +int overlay_mgr_register_format(struct overlay_mgr_format *candidate)
> > +{
> > +       struct overlay_mgr_format *format;
> > +       int err =3D 0;
> > +
> > +       spin_lock(&overlay_mgr_format_lock);
> > +
> > +       /* Check if the format is already registered */
> > +       list_for_each_entry(format, &overlay_mgr_formats, list) {
> > +               if (!strcpy(format->name, candidate->name)) {
>=20
> This function is public to the rest of the kernel - limiting the
> lenght of ->name and using strncpy() is probably a good idea.

I totally agree. This was in fact something I wanted to do.

> > +
> > +/*
> > + * overlay_mgr_parse()
> > + *
> > + * Parse raw data with registered format parsers. Fills the candidate =
string if
> > + * one parser understood the raw data format.
> > + */
> > +int overlay_mgr_parse(struct device *dev, void *data, char ***candidat=
es,
>=20
> I'm pretty sure there is another way to proceed than using 3 levels of
> references.  It makes the code hard to read and a prime candidate for
> errors.

Sure. I guess we could allocate an array of fixed-length strings which
would be less flexible but I don't think we need something that flexible
here.

>=20
> > +
> > +               format->parse(dev, data, candidates, n);
>=20
> ->parse() returns an error code.  It is probably a good idea to check
> it.  If it isn't needed then a comment explaining why it is the case
> would be appreciated.

So the point of the parse function is to determine if the data read from
a source is a compatible header of a given format. Returning an error
doesn't mean the header won't be recognized by another one.

We could maybe handle this better, by returning an error iif different
that -EINVAL. Or we could have one function to check the compatibility
and one to parse it, if compatible.

> > +static int _overlay_mgr_apply(struct device *dev, char *candidate)
> > +{
> > +       struct overlay_mgr_overlay *overlay;
> > +       struct device_node *node;
> > +       const struct firmware *firmware;
> > +       char *firmware_name;
> > +       int err =3D 0;
> > +
> > +       spin_lock(&overlay_mgr_lock);
> > +
> > +       list_for_each_entry(overlay, &overlay_mgr_overlays, list) {
> > +               if (!strcmp(overlay->name, candidate)) {
> > +                       dev_err(dev, "overlay already loaded\n");
> > +                       err =3D -EEXIST;
> > +                       goto err_lock;
> > +               }
> > +       }
> > +
> > +       overlay =3D devm_kzalloc(dev, sizeof(*overlay), GFP_KERNEL);
>=20
> Function devm_kzalloc() can sleep but you're holding a spinlock - I'm
> surprised the kernel didn't complain here.  Allocate the memory before
> holding the lock.  If the overly is already loaded simply free it on
> the error path.

Right.

Thanks,

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6hgzb4napxgrvdnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYEgk+AAoJEFxNi8it27zYSr8QAIdiZDGzcBm7vktO2uVkCjUb
qh1eID01a6KBOQihfWftD0mv+1eAhHIDVLjoqJhg9aD+1XLW92ORPAd3bfi4fqzZ
vN8Wlc+LOJekEKqNnFDyZ4iCB2AmWuRq7iTzQbfa81ZWWfQ0JXVSuqQ3MHQmyzH7
mkMya6bRv93D6cSHDdnuWUue9Qm0CAXb9VPkwzI8ml5Kl1zQYkuv2CP9/CjMYiQs
5lYPosIHTph7lvZdMzknFrofFKfme0CAskZ7yOIKE95u8w9c5ImlGHaBIiDMNLbL
r1FVfmgbs0speQRllPaU0JCPS2wyPkA9oiI+nNeSQ0CSfV903+5nny4203TLBIEF
IjSQAPWtkURn6DKC922zytmUV3Sh1bvazjEi1jUjCR8ZJ5bJg4i1PhZE/aDC8dBn
8x9ofYpPerS2bbmdHPRql4GwduDObuy3Yma6WuyjSHaNXz4Yjr0C0VH1bWlM1JH5
ZCPhOy1CnTL5ZtYesRHS0soqNHzOZ3SCarVjFkWIuFHHViQo5ZnS1FXkkZkMzcBd
S0aMAtil4sjIFvak9/9jpg2adAbQ15DsVZiQtz3pyRMGdMWJJDBfrEVK/bxNi+Ke
vKLRhcMQQAYs4ThNwlorkjJVQMoXGHkyrOaYhGSfS/tLH7iNeZaebSrtcEZT/Dsm
/eLXQ9Cq4EYinz6ZFqqm
=QltX
-----END PGP SIGNATURE-----

--6hgzb4napxgrvdnd--


--===============7370374090581139409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7370374090581139409==--
