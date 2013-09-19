From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 5/6] extcon-gpio: Describe devicetree bindings
Date: Thu, 19 Sep 2013 19:35:06 +0100
Message-ID: <20130919183506.GJ21013@sirena.org.uk>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
 <1377836978-24082-6-git-send-email-linux@roeck-us.net>
 <20130912164100.GF22013@e106331-lin.cambridge.arm.com>
 <20130912165304.GA12202@roeck-us.net>
 <20130916142147.GF30650@e106331-lin.cambridge.arm.com>
 <20130916151953.GA5801@roeck-us.net>
 <20130918153828.GB17453@e106331-lin.cambridge.arm.com>
 <20130919164245.GG21013@sirena.org.uk>
 <20130919182850.GA22775@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PPcTO7KkkZ/DEnPS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130919182850.GA22775-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--PPcTO7KkkZ/DEnPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2013 at 11:28:50AM -0700, Guenter Roeck wrote:
> On Thu, Sep 19, 2013 at 05:42:45PM +0100, Mark Brown wrote:

> > Many of the things described only have passive components attached, or
> > things that otherwise don't need drivers - things like power inputs or
> > headphone connectors, they're mainly providing information to allow
> > userspace to behave differently (eg, display a charging indicator in the
> > UI).  It's not 100% true but by and by large if detection is being done
> > using a GPIO it's probably something like that.

> Correct. However, gpio based 'detect' pins typically need debounce support
> which is not directly available through the gpio userspace API. I tried to add
> that earlier, but was told to use extcon instead as it provides the necessary
> infrastructure. Now it almost looks like I can not use it either because the
> required devicetree bindings may be considered unacceptable.

Yes, I'm trying to explain to Mark why there are drivers just purely for
the connector without any software for the connected device.

--PPcTO7KkkZ/DEnPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSO0PXAAoJELSic+t+oim9oUMP/26unBLbw5V+rqTsD1Qov8f/
zWs1/WBqOSIRClNCPRfIKSbT8kD0GqHgasB8aJvND8JkHRSLJAq1nvdGL8IS6V1/
UCtkAjII4auLwsh8o3gwrMsuNM7CuAaLJuEXg05TB6nU1Qjx+qpuMUTfbJZG411u
JNoxYr9IA7ROIs1wPDcMyRT54RQEV90GQ/yOWJ0aamfE9bTY+FzPqg46PBEk0jn5
l2xbVv/PpTKmxGQZYEZVYAJ5snJzf9Fjr8lLstzsCStRFlIazuEESl7EDTNhxvdR
SES58htyugQkavU73mhbMhOJfKZC7HlSYJUdSEc+kZXomT9rBsVzFZBkg/tcuM++
IBjJMhHLseWqkhgsE+4ExtfNTW+TexRbvn4sX0t66EiRN/akNW5spKkWFsvYiyc9
IU1PIo+v/Io0aOTv2Jo9pjUrZeIH0ibufD24u9qm7fU/dgReXVw/X3FXTrJpupt6
Z702x427pWvFwnGy8DsVoRRDc+XG/0IAoGDRvkmjQ/uNLrDfjRgKf+l7AkR4kPig
22A5/ofjSDoFsz8P/i7Gcow28rcjnybhGClL5T8r453vH1qvTFYCekltpwerrgFu
Xpat+GOWoC5aXEERGdHf6DzVhry5jp/takq0ligglujKH6nHEA5nnpSKNxRTxpNy
Q/epTLiX3xQ17ukbx9YA
=XYpv
-----END PGP SIGNATURE-----

--PPcTO7KkkZ/DEnPS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
