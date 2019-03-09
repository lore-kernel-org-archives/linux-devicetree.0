From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH/RFC 05/15] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Date: Sat, 9 Mar 2019 12:23:08 +0100
Message-ID: <20190309112308.rbuqwvvvxgihmj7d@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
 <20190308164925.jwgq4rdqh6mmwwtf@uno.localdomain>
 <20190308175739.GA11318@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0864398012=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190308175739.GA11318@pendragon.ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org


--===============0864398012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wrhg5c4tjjfmcuvy"
Content-Disposition: inline


--wrhg5c4tjjfmcuvy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

HI Laurent,

On Fri, Mar 08, 2019 at 07:57:39PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Fri, Mar 08, 2019 at 05:49:25PM +0100, Jacopo Mondi wrote:
> > On Thu, Mar 07, 2019 at 01:23:35AM +0200, Laurent Pinchart wrote:
> > > The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> > > dual-link. In dual-link mode both input ports are used to carry even-
> > > and odd-numbered pixels separately. Document this in the DT bindings,
> > > along with the related rules governing port and usage.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  .../bindings/display/bridge/thine,thc63lvd1024.txt         | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > > index 37f0c04d5a28..4ff6eb9bbc19 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > > +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > > @@ -28,6 +28,13 @@ Optional video port nodes:
> > >  - port@1: Second LVDS input port
> > >  - port@3: Second digital CMOS/TTL parallel output
> > >
> > > +The device can operate in single-link mode or dual-link mode. In single-link
> > > +mode, all pixels are received on port@0, and port@1 shall not contain any
> > > +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> > > +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> > > +endpoints.
> >
> > You know, I'm not sure this is helpful, as if we have to go and
> > describe what the chip supports, a paragraph for dual ouput mode would
> > be required as well. The bindings already document that the chip
> > supports single/dual input/output modes, maybe you can just add rules
> > that prescribes how to populate the endpoints, for both input and
> > output modes?
>
> That's what I was trying to do :-) How else would you like to see it
> described ?
>

I wonder if it won't be enough to expand the Optional endpoint
properties description as in:

 - port@1: Second LVDS input port, to be used for dual-input mode
 - port@3: Second digital CMOS/TTL parallel output, to be used for
   dual-output mode.

If you prefer providing more context, it's fine what you had, just
keep in mind there's also dual-output mode and not just the dual-input
one.

Up to you, feel free to add my
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
if relevant.

Thanks
  j

> > > +
> > > +
> >
> > You can drop this empty line.
> >
> > >  Example:
> > >  --------
> > >
>
> --
> Regards,
>
> Laurent Pinchart

--wrhg5c4tjjfmcuvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyDohwACgkQcjQGjxah
VjztpQ/9F5yBiWZaYawkngfnWMnB9ivF8Y4K6Xu1WfD7xp2QWQgtf6jBcmG0yuu1
+5ZxdM9K94Ontuj9mCxxwy4gYtd5FPNkSuZpqvfov0mWCqFfcuMDoXDhaCydIIEq
ZRtV0VkyHnVqHGr57TlhaLZfaA83C6etJ1cqxk/BgLMYv2INbEUQiLoJUAEk0fry
WniCuhymfOl1ZiDO4ipYbHHsQIfSLqRaoS0J2vW2h/PgKMBSaYJNtc6UCnI9r6oK
be6SzuiPZyS8OIJQKC4Wt54YZJUpbYKKa7hqIgmO84LXqv5W3JUdY0KxaKuf9SwD
osdxinDiUk0WZ45XLkq8csPZPmvEWxsNaZILC0V+39kAtPuzW8pIO6skN9JucZOj
h3c4CFrdfMXGKjMh5wDJU/DYKqUA0RTMFKLMTg5dEUOTQW/8132YhwGHLDPHatOj
2obiudSTbpwctt0J1rbEgvYV6QDlw9n9so+OLyiLZqKIo4ryTS/ZCiyhU9LbZVLd
bHuYeb5KHekeZZ0TLE/3mk77ArNYOCvqRWx7XG80mlkv1Id6wB4SIIUdc9ajWEB7
GVYPh02ekI2t+3QRs9DMRxrPX0ODVaExvXPY13JVqTAvYLrdw4rPm45UtjUMW8ms
HkVrsowjogpxY37g5/vKgTVwn0/uTFIqMEijm10EdtimB4/+bhg=
=ZGvw
-----END PGP SIGNATURE-----

--wrhg5c4tjjfmcuvy--

--===============0864398012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0864398012==--
