From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: Add clock-frequency to model cpu nodes
Date: Mon, 9 Dec 2013 18:05:41 +0000
Message-ID: <20131209180541.GQ29268@sirena.org.uk>
References: <1386335683-11405-1-git-send-email-broonie@kernel.org>
 <1386611765.3380.70.camel@linaro1.home>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mX5f3I2XfUAeTwiv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386611765.3380.70.camel-K+mpW1F5uff9zxVx7UNMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mX5f3I2XfUAeTwiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2013 at 05:56:05PM +0000, Jon Medhurst (Tixy) wrote:
> On Fri, 2013-12-06 at 13:14 +0000, Mark Brown wrote:

> > The clock-frequency property is meaningless for the models but it's a
> > mandatory property so claim that all the cores run at 1MHz.

> Is it a mandatory property? I know we seem to get ugly warnings if it's
> missing but I see no mention of it at all in
> Documentation/devicetree/bindings/arm/cpus.txt (am I looking in the
> wrong place?)

It's mandatory according to ePAPR (see my separate patch copying the
definition into our copy of the binding documents).

> I think this attribute got merged into the kernel with the early power
> related scheduling efforts, but given the state of all that at the
> moment I was guessing it might be obsolete.

No, it's still being used.  At the minute mainline should in theory
balance tasks well enough between the cores when they're all enabled, it
just won't figure out that it's useful to shut one of the clusters down.

--mX5f3I2XfUAeTwiv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpgZyAAoJELSic+t+oim9cGgP/Rv7I28IShhIhDxu+hOV4UaP
Yr5REqP3SMFdQXUXs31hvjAR7W5NoN9q2wl5hBhZvrPCWk27sDLr18MgA8UKNApY
YsnPQiUxS8leRzScJVrhXDfbU8tE2ByiL97WDcuHwCRfuF1sErn/0boKjPDofaNT
mQ3621F0336UdbOzX2a6niikDnHyFO2G2jJ/yuDNsP6wERlMac62f6hfvO2+F9qf
DMc2fKOT2KFOo8OeME37MIKQirViWHCT8iu0zyTYnxztORpbnZ9VF2ZoLIw1fOn9
Knjl4zvyQBj+a7jmZgAmsCg+zIYqQrJJMEFzl4MFfTNUtE5LGd3lE/OTcPaNQxvf
0b4UyFQg1CIcUSMDwp7d8HWapWGYov7DhVmrB20uE+0YwZxT85CdrzqIxeuOCdsP
oQ8mwTBhOfsHvWjKkwiKhGqUtfWMkwD6f3eV9CkUmbKttCaAD2Odt6qXhLcl+sNV
9fsN/y05VuNxBhGbsWDwuh/4RmkupFOZZYIqZfCrBri1tGl18AQ7O9HqEbgJ02f/
rRIHxZYNrjCO1xjXMVzr+jPs6MsTw0uYywJxcsSgVoBBl8+vOq0FxALDpEkU9OMq
e0+aGZmh+IETEYbLm1hOy6PjicF5kYG7r/0a/qgcxlMYNYClyHKGUn3hfqgFum/D
BGWGC7sOxWJve0JDc3jv
=b/oi
-----END PGP SIGNATURE-----

--mX5f3I2XfUAeTwiv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
