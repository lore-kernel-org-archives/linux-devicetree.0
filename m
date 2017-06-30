From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 6/6] ARM: sun4i: Convert to CCU
Date: Fri, 30 Jun 2017 11:52:59 +0200
Message-ID: <20170630095259.publzn56jy3ru5qb@flea>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <f4b2bbc20ca8afa9cc918ba8f781bd69ec3c6d00.1498422562.git-series.plaes@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4barowp35roet375"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f4b2bbc20ca8afa9cc918ba8f781bd69ec3c6d00.1498422562.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4barowp35roet375
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 25, 2017 at 11:45:47PM +0300, Priit Laes wrote:
>  		osc24M: clk@01c20050 {
>  			#clock-cells =3D <0>;
>  			compatible =3D "allwinner,sun4i-a10-osc-clk";
> @@ -187,487 +176,12 @@
>  			clock-output-names =3D "osc24M";
>  		};

This should be a fixed clock now.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4barowp35roet375
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVh97AAoJEBx+YmzsjxAgvNUQAL2YavHx6f00MJFhgG1N8kr3
/NBAHvkYmbpgN2HRNkyNeaD5KeXTgbxlOy7Qr+YqGGXEsEGiCAxsfEaUOzZUF9Tb
7ftx+qcUOTMNZv1hMQgptgMdS9EvtrjEVIpEOugno7MOZaIJiZ2Hv1kG3W6kDGXV
3xawBesdj/QPMc740EhkPa/rBcGdd/8pAVXGGGdhCgHs4fIo5xN/SPPhfvoL95Bj
yh7glPYez97BREaXhNvYaEaIcikkT7XNi1kOtkkq9Aw/ybA0mcUaudvLX76zwMX6
V6qSlWzYoSuPOeyhsvCJ9R39/jcPeoDCGZY1YUmHF2BxBhNn4HpaXzBEr5YuDKx6
19wbqyT8RXykjpyeUa/dF2R9OtJuwqhTjeaXkyF6plFBbabO5gSG1vU6v8sZBokk
7RIOjzvFXI14tyZAZjTzh35lgQ0J9a7X5uKRa37vxbb8lYWTygSjS9q4+fSIC8VS
U4dGcluS/35qaeigPHjrG2WOSth5Pf/mI/+uh1ArAULxrgqIgwC3bfbV6qctF3Cu
L7qyfAuFjyTfr/ak/FTAseX8H43RS93ogjhGS8tunYaH+R2VDkMoNHCu7BB9noij
FTks2WcH+J/qb6lMAs8pcXzKoE7cD9oxIrb/41iyFwma6cM7UEXfHOSzgSs4wEG5
jMqP/C7cxcZkVPcQ5GYC
=ldHl
-----END PGP SIGNATURE-----

--4barowp35roet375--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
