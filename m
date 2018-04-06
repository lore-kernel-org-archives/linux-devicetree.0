From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: bridge: Document
 THC63LVD1024 LVDS decoder
Date: Fri, 6 Apr 2018 16:25:58 +0200
Message-ID: <20180406142558.GP20945@w540>
References: <1523018517-24121-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523018517-24121-2-git-send-email-jacopo+renesas@jmondi.org>
 <1664336.M7KDjLhzuK@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1003432265=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1664336.M7KDjLhzuK@avalon>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, sergei.shtylyov@cogentembedded.com, airlied@linux.ie, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, niklas.soderlund@ragnatech.se, geert@linux-m68k.org, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org


--===============1003432265==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qUsYCxAE223BCwdt"
Content-Disposition: inline


--qUsYCxAE223BCwdt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Apr 06, 2018 at 04:15:35PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Friday, 6 April 2018 15:41:56 EEST Jacopo Mondi wrote:
> > Document Thine THC63LVD1024 LVDS decoder device tree bindings.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../bindings/display/bridge/thine,thc63lvd1024.txt | 60 ++++++++++++++=
+++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.t=
xt
> > b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.t=
xt
> > new file mode 100644
> > index 0000000..1191f17
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.t=
xt
> > @@ -0,0 +1,60 @@
> > +Thine Electronics THC63LVD1024 LVDS decoder
> > +-------------------------------------------
> > +
> > +The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS
> > streams
> > +to parallel data outputs. The chip supports single/dual input/output m=
odes,
> > +handling up to two two input LVDS stream and up to two digital CMOS/TTL
>
> s/to two two/to two/
> s/stream/streams/
>
> > outputs.
> > +
> > +Single or dual operation modes, output data mapping and DDR output mod=
es
> > are
> > +configured through input signals and the chip does not expose any cont=
rol
> > bus.
> > +
> > +Required properties:
> > +- compatible: Shall be "thine,thc63lvd1024"
> > +
> > +Optional properties:
> > +- vcc-supply: Power supply for TTL output, TTL CLOCKOUT signal, LVDS i=
nput,
> > +  PPL and digital circuitry
> > +- powerdown-gpios: Power down GPIO signal, pin name "/PDWN". Active low
> > +- enable-gpios: Output enable GPIO signal, pin name "OE". Active high
>
> As Rob mentioned in a reply to v6, we currently use "enable" as the inver=
se of
> "powerdown". I would call this one oe-gpios instead. Quoting Rob:
>
> "Debating "oe" vs. "output-enable" is bikeshedding IMO. Anyone familiar w=
ith
> h/w design should recognize OE."
>

I got a different understanding of what Rob meant. I thought "anyone
familiar with h/w design should recognize OE" as that nobody would get
confused if a pin named OE in the chip manual is descibed by an
'enable' property.

But as discussed offline, enable has probably to be used as the
opposite of powerdown for complete chip sleep, not just for output
pad.

Anyway, we spent enough time on naming issues, starting from my first
stupid 'pdwn' permutations then on this semi-standard names.

I'll send next version with 'powerdown-gpios' and 'oe-gpios'
properties hoping that would be finally accepted by everyone.

Same on the mandatory/optional VCC supply thing. Let's try to make
next version the final one. If the optional property with the dummy
regulator doesn't satisfy you and it is preferred to have a fixed-regulator
anyhow in DT I'll do in next version, othewise let's try not to change
it again. I'll just remark here that in the current Eagle design vcc is
connected to a power rail with no regulator at all :)

Thanks
   j

> > +
> > +The THC63LVD1024 video port connections are modeled according
> > +to OF graph bindings specified by Documentation/devicetree/bindings/
> > graph.txt
> > +
> > +Required video port nodes:
> > +- port@0: First LVDS input port
> > +- port@2: First digital CMOS/TTL parallel output
> > +
> > +Optional video port nodes:
> > +- port@1: Second LVDS input port
> > +- port@3: Second digital CMOS/TTL parallel output
> > +
> > +Example:
> > +--------
> > +
> > +	thc63lvd1024: lvds-decoder {
> > +		compatible =3D "thine,thc63lvd1024";
> > +
> > +		vcc-supply =3D <&reg_lvds_vcc>;
> > +		powerdown-gpios =3D <&gpio4 15 GPIO_ACTIVE_LOW>;
> > +
> > +		ports {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			port@0 {
> > +				reg =3D <0>;
> > +
> > +				lvds_dec_in_0: endpoint {
> > +					remote-endpoint =3D <&lvds_out>;
> > +				};
> > +			};
> > +
> > +			port@2{
> > +				reg =3D <2>;
> > +
> > +				lvds_dec_out_2: endpoint {
> > +					remote-endpoint =3D <&adv7511_in>;
> > +				};
> > +			};
> > +		};
> > +	};
>
> --
> Regards,
>
> Laurent Pinchart
>
>
>

--qUsYCxAE223BCwdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJax4N2AAoJEHI0Bo8WoVY8rzkP/3SKO+s5txJfu3l8v/nisZ9l
e28Nfi/5BbzJVsMEDvLIAOCF8FoKsy8wnk6JxRB/IzYGPm05MzJo/AnndFv7Qp2/
IN9YLF5gRAFz0ANFyWgW2RbX223jp8Sul7qnADdDpu5NrrloB2/A5R8hC4AnGKz0
KmfSg5BTxD5FK/OHJzPA0btPTnl+h0BMbXjhsfsxZ+uZ2j1T/RxJ/zZuf1sQhhsy
TJQAAG2/P3P4e8J37yPWZGOUkx9I7/MqWYXLnQl2VZC3Kgv3p5fOgFk6u5W0ju+z
HRc2bh/y8budqw6itflUSQMXqI3vAa2D52Jt0k25H3MfsBN2yg+xomCOsTCs4bUO
ngqX2HZMd5EyUFmI1BLP7gmZ6Z82OzMdctb2ihrbdm5v1Belrb/Ot+DZCW2TO3FQ
OHvahWUK5ztzhnO4HJJaYPDjHRd5s/OpHuwYMqIgtE1IVQBVtvlkzBuxeIEp1RfC
2YQEi6kGziJDEaXN+HC96fghz6WjjkkvQGa53/EsneSX0v0c+QlSvwekoE0YLWrP
GTHD6P5iW91FnFXK/GYiej8VEwlZDFg4/MQbZQH0SYWiNZNoVU+xd1xdIMHT8k7f
MZCV9z+zCQlJueS0QShZIeEgZg1en/TT08OAd8KcExVvNOIwBWHfzymIXeGcTfja
cp45eN+HJhsjbi9SvRVW
=uoSA
-----END PGP SIGNATURE-----

--qUsYCxAE223BCwdt--

--===============1003432265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1003432265==--
