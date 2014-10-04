From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] hwmon: ltc2978: device tree bindings documentation
Date: Sat, 4 Oct 2014 10:53:49 +0100
Message-ID: <20141004095349.GB4609@sirena.org.uk>
References: <1412275071-6417-1-git-send-email-atull@opensource.altera.com>
 <1412275071-6417-2-git-send-email-atull@opensource.altera.com>
 <20141003122736.GH26643@leverpostej>
 <542EDCDB.6040406@roeck-us.net>
 <20141003231334.GA4609@sirena.org.uk>
 <542F2FE3.60507@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <542F2FE3.60507-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "jdelvare-l3A5Bk7waGM@public.gmane.org" <jdelvare-l3A5Bk7waGM@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 03, 2014 at 04:23:15PM -0700, Guenter Roeck wrote:
> On 10/03/2014 04:13 PM, Mark Brown wrote:

> >Nope, nothing to do with regulator that I'm aware of and I've not seen
> >any examples (but I don't tend to review users too often).

> Many examples, really. Just picking one.

> Documentation/devicetree/bindings/mfd/tps6507x.txt

OK, that's not an actual DTS...  I'm not seeing anything in the code.

> 	regulators {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> 		...

> This also uses the reg property for the regulator index
> (without explaining it further). Seems to be pretty common.

If it's doing that it's nothing to do with the regulator API.

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUL8OsAAoJECTWi3JdVIfQl3QH/0XbMyh3/nBelRTyQ/tU2svk
p/F7bdWEU9Ffx96qOP6RjM78I/MmXPE8EdHOKi76V6ri1bhzTCPvzEEnSj34E/Ha
zQWQastXpG8D8I/0qjf2NMc19QkpfA8dM4dGPq+TCedZJPpwrikN2USB1/Myq2jW
cfZcTfolj8iemnjLlPacYTEGgGrh9mSdPbOj2UDFd6jXaHHo+DTCXOVxwpdC8UqB
gvpySGfbcQSxeUfaKvpBnu+sJh2zKvxWkb9XJNUY+yOaI7dyCbCDPfyugg56KRcq
Bxctz+XKALuiDT5DenerWQ08PNJA8pewCvMnt6PA/TfXufEm03Rj//cNB6IbS3Q=
=906O
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
