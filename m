From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/6] dt-bindings: media: rcar-vin: Document data-active
Date: Thu, 17 May 2018 10:25:52 +0200
Message-ID: <20180517082552.GU5956@w540>
References: <1526488352-898-1-git-send-email-jacopo+renesas@jmondi.org>
 <1526488352-898-3-git-send-email-jacopo+renesas@jmondi.org>
 <20180516215538.GC17948@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0599149252801942837=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180516215538.GC17948@bigcity.dyn.berto.se>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============0599149252801942837==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HACzHn9G0kmbdSJa"
Content-Disposition: inline


--HACzHn9G0kmbdSJa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, May 16, 2018 at 11:55:38PM +0200, Niklas S=C3=B6derlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2018-05-16 18:32:28 +0200, Jacopo Mondi wrote:
> > Document 'data-active' property in R-Car VIN device tree bindings.
> > The property is optional when running with explicit synchronization
> > (eg. BT.601) but mandatory when embedded synchronization is in use (eg.
> > BT.656) as specified by the hardware manual.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/rcar_vin.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Doc=
umentation/devicetree/bindings/media/rcar_vin.txt
> > index c53ce4e..17eac8a 100644
> > --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> > +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> > @@ -63,6 +63,11 @@ from local SoC CSI-2 receivers (port1) depending on =
SoC.
> >  	If both HSYNC and VSYNC polarities are not specified, embedded
> >  	synchronization is selected.
> >
> > +        - data-active: active state of data enable signal (CLOCKENB pi=
n).
>
> I'm not sure what you mean by active state here. video-interfaces.txt
> defines data-active as 'similar to HSYNC and VSYNC, specifies data line
> polarity' so I assume this is the polarity of the CLOCKENB pin?

Yes, I can change this if it feels confusing to you.
>
> > +          0/1 for LOW/HIGH respectively. If not specified, use HSYNC as
> > +          data enable signal. When using embedded synchronization this
> > +          property is mandatory.
>
> I'm confused, why is this mandatory if we have no embedded sync (that is
> hsync-active and vsync-active not defined)? I can't find any reference
> to this in the Gen2 datasheet but I'm sure I'm just missing it :-)
>

Not exactly, it becomes mandatory IF we have embedded sync.
Here it is my reasoning:

In the documentation of CHS bit of Vn_DMR2 register [1] the following
is specified:

"When using ITU-R BT.601, BT.709, BT.1358 interface, and the
VIn_CLKENB pin is unused, the CHS bit must be set to 1."

And setting the CHS bit to 1:

"HSYNC signal (VIn_HSYNC#) input from the pin is internally used
as the clock enable signal"

So, if 'data-active' property is not specified I assume CLCKENB is not
used, and set the CHS bit. What if we are using BT656 and there is no
HSYNC? Then specifying 'data-active' becomes mandatory, as otherwise we
set the CHS bit and wait for HSYNC pin transitions that won't happen.

This is probably wrong, as in the Koelsch case, there is no guarantee
that CLKENB is connected, and what I should have done is probably set
the CHS bit only when running on V4L2_MBUS_PARALLEL, and leave CHS
(and CES, if 'data-active' is not specified) untouched, as we're doing
today when running on V4L2_MBUS_BT656. Does this work better in your
opinion?

This also makes patch [6/6] (where I was adding 'data-active' to Gen-2
boards) not required.

Thanks
   j


[1] 26.2.18 Video n Data Mode Register 2 (VnDMR2) Datasheet version,
R19UH0105EJ0100 Rev.1.00 Apr 30, 2018

> > +
> >      - port 1 - sub-nodes describing one or more endpoints connected to
> >        the VIN from local SoC CSI-2 receivers. The endpoint numbers must
> >        use the following schema.
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund

--HACzHn9G0kmbdSJa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa/TyQAAoJEHI0Bo8WoVY8qIMP/2LFs0lyKtRCt9G7gEkiyg71
JiKiycx3R6DsRoylPnvxVX1FELJb2VLKUe4AHsx2UuIQ7MrZ5idzQZc3aQcVLOTF
3IOIn3Be7Qb29dCg/orsrT2SH63UMiQ5FzAvzm2MaWuVlXdk1iL70+xMcF2+KDNc
ftluKwdParGJO+IN5b6mejhonciX/eDAVFdMCPqSaKjI3Es1U6lPj/d1CeCQRlIs
pjpuEN/yoERVzuMHRs0iyop03nQ2yJzVE5dBSWyrjlHFLmiElp7OGXowV5bTE0cQ
ItbLqxYbCnNy0vUoJGsB+8j76holYuePUS/MNvoVd3SPtJwgKFW6hDSqSCZwDzFf
P65o6zNrJUKkNXMcJOUS3tOh7ZynPASvlKkzaCPjNpoG0iOV7WuO0s+P8tXglDs/
+69a2cvQXgBNaYv7xJuRxZvt77iT9gVW4nABINvH939yBp9cTjmYSCiietck0Zca
yyNAR7BkM/LtS3fkWFg+/urKXECJGI3nmHH1MTl3RFJJloUIgc3q6HvN9c1/uILA
Iv0Y2pqUhjk06uFgDUGnOyKfb+lOrUFE8aOjP6zuQlLjyeAvZwxZCDYz2j96Nmrq
kl3fwe88KT4qW0vLZMndC0Wv2db7SaTwWubvg5n78jGUUB7MWmV/qHnvKxngDCA+
xAGQZhu4aeVfM9u5uJEs
=tEzF
-----END PGP SIGNATURE-----

--HACzHn9G0kmbdSJa--


--===============0599149252801942837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0599149252801942837==--
