From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Fri, 16 Sep 2016 17:31:56 +0200
Message-ID: <20160916153156.GE12753@ulmo.ba.sec>
References: <1473311672-20782-1-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ey/N+yb7u/X9mFhi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473311672-20782-1-git-send-email-simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ey/N+yb7u/X9mFhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 10:44:22AM +0530, Vinay Simha BN wrote:
> Add documentation for lt070me05000 panel
>=20
> Cc: Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> ---
> v2:
>  * incorporated rob herring and thierry reviews
>    gpio to gpios, gpio to regulator using fixed regulators
>    and pwm backlight is removed, since it is controlled by
>    dcs commands
>=20
> v3:
>  * incorporated thierry reviews
>    - Added gpio polarity details for reset-gpios
>    - proper naming conventions and sequence wrt panel datasheet
>      (vddp-supply, iovcc-supply,
>       enable-gpios, reset-gpios, dcdc-en-gpios)
> v4:
>  * pinctrl-names, pinctrl-0 removed, not required for
>    reset-gpios
> ---
>  .../bindings/display/panel/jdi,lt070me05000.txt    | 31 ++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,l=
t070me05000.txt

Applied, with a modified commit message.

Thanks,
Thierry

--ey/N+yb7u/X9mFhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX3BBqAAoJEN0jrNd/PrOhBbkP/AxH1dv4G5vsQSqIzrPcxXWz
metTeqY26nKbJp941CjCcbcbfo7moUayhNsdYqP9CIOAB85Nj8RKg+7T8P1fuWqF
Qxb5rthH9ZFE7nHQLdGi0euQyLD66Ko0MhpkrIp1ZowiEEH1bIUTaYfqBqWQ/bsB
Ho1n5QdJftK6h8IdqfE98xJyHyV0VHBN+2ovAmLnfzyo1x0cfnbNfYthz9BbxUi5
jc/LW+vLjUIXhQbv7b+cl+8x1DTpvRP8ikdo7imRP1lrkMnDJ4KlmrUyjHjxnpHn
MhTD4eDO8vfy7xCnQnohM6fI3uAZKWrkNxGePn8Gaxqp2yalmLubNOXBE/oPUq05
LjiT2kTkCmdo0JZVP6PEPZR8x2LeR1unx8y+xAA9IfBwAGeaqbvBhfgvt8wwq4RB
jj5/kAUSABI2ah1ZQ/8Gj8yv83VNLI3GpeZ+ZaGXrkNDlPnSnfxI0q4wl5YkLszo
WS/41b7vv1rqeKf7E68HGz0vpbodQ759aFMj0G+osjfMmYbdRpqZyhlzuRzwvXS9
n/rssGUcYR1KYgRvhtovX0gN/K4Hrz3bJAqDYMNhQNdvtMP3dGoVGmIHXuWEZkjG
tbWEYmoaKQoh006IAuqg0uy7HbUAef6MpJNRfJ1k4Y9pKmUINC86qQkQqiN8hJ/1
NMPb1hvQCAR/L/VDQ5OT
=+R08
-----END PGP SIGNATURE-----

--ey/N+yb7u/X9mFhi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
