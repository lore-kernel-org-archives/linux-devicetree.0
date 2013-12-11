From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Wed, 11 Dec 2013 16:16:58 +0200
Message-ID: <52A873DA.9070608@ti.com>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="01XBwUk99luM05tHb6WFXHsB1dqGHt1Tq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385145714-3022-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--01XBwUk99luM05tHb6WFXHsB1dqGHt1Tq
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2013-11-22 20:41, Thierry Reding wrote:

> +Example:
> +
> +	panel: panel {
> +		compatible =3D "cptt,claa101wb01";
> +		ddc-i2c-bus =3D <&panelddc>;
> +
> +		power-supply =3D <&vdd_pnl_reg>;
> +		enable-gpios =3D <&gpio 90 0>;
> +
> +		backlight =3D <&backlight>;
> +	};

I'm somewhat torn with this, as I agree with Thierry that it's correct
to have a panel database in the driver, but, on the other hand, it does
seem impractical.

In my experience, there are lots of panels out there, and each board I
have has a different one. So, while just a gut feeling, we could end up
with lots of panel, each used only on one board.

With a quick thought, things would work fine if we just added the
videomode data to the DT data, instead of a driver database, as Laurent
suggested.

However... I don't think the panels are usually as simple as that. With
the panels I've worked with, the driver has to know things like:

- Does the power supply need to be enabled before the enable gpio, and
if so, how long before? And the same for power off.

- Does the video stream need to be enabled before the enable gpio, and
if so, how long before? And the same for power off.

- Is the gpio enable, power down, or reset? If reset, what are the timing=
s.

Where will those be defined? This goes back to the power sequence stuff
again... (Was the power sequences series forgotten?) And defining such
sequences in DT data is, I think, bad idea. But having them in the
driver would be fine. If we have those in the driver, it's better to
have the video modes there also.

The sequence for power, gpio and video stream is most likely common for
most panels. Power-on is done with enabling, in order: power, video,
gpio. And power-off is vice versa. But we need delays in between, and I
don't know if we can have some kind of common delays that'd work for
most of the panels.

If we can, we could perhaps define in detail our "common simple panel"
spec, which would contain sequences, timings, powers, gpios, and so on,
so it would be easy to see if a particular panel fits into our simple
panel spec.

 Tomi



--01XBwUk99luM05tHb6WFXHsB1dqGHt1Tq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJSqHPaAAoJEPo9qoy8lh718sUP/iVYHsQHY9/Hd4TdCHtzxgkK
AgBrCC1fvahQqHrnFAihQtH3H9d8UseH5MMfglmbDYTlzEhHpv0oYmjWRButcGwm
o7sTsO2kwxJO12Tz064MIzyQG14eutr9OJGcMZcs2hh2571hH8FpvP1nH13fZItD
mKLmZlQjwocZECXBJibiuvcCsetLrK73Ae73To65mkhU1L3SQOytmEtuaiKL+C0a
HfllUVZ9Wspi/L54upnZBZF0WuKmUjEs7SHwj1Jq/bezBM6fCMOkwLEFEzBbSgXX
CuRackBHhtmHaa2dcJdwaMn7rJRNR3hOXQnnrxN8Ba0bCFjPxUHvjToAWhLfLzU6
CARz1+X1K8zoyRVm4suDLfQGVXVH1opC+VywLgcSme0NO0ZaX8JjBazkwIldyuRN
BCb6G6v4wA0+Ji4jGDHPl2FcCIyr9K+oPGccsWst7S7xvgU8JGJqy0lCQONV3csN
/Pl+UDEBHFbfjsEL2tIr+YZzIKgN2DHNJW1owcg0DdgXkVMEzvI1l2C17xc1GV1G
gYFwI9zy2dDaUzVtLfhU0Lejtj1BQJBEWOqgSjUBTCL/kCdrobTNSGjGWfS9ocnM
rRPgDhun29hu2CrPSn72kEoqmtgsFRgKw+1NRwy8ssj/mfzyOQe87YwT+GnVo7HR
B5v7fH/IgcQ473VeLptu
=cqik
-----END PGP SIGNATURE-----

--01XBwUk99luM05tHb6WFXHsB1dqGHt1Tq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
