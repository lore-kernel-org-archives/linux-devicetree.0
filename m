From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 2/5] DTBO magic and dtbo format options
Date: Thu, 26 May 2016 10:10:40 +1000
Message-ID: <20160526001040.GO17226@voom.fritz.box>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464112239-29856-3-git-send-email-pantelis.antoniou@konsulko.com>
 <5745F42E.9080100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9kDAZ2EyO0AcRYa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5745F42E.9080100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s9kDAZ2EyO0AcRYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2016 at 11:51:26AM -0700, Frank Rowand wrote:
> On 5/24/2016 10:50 AM, Pantelis Antoniou wrote:
> > Introduce a new magic number for dynamic plugin objects,
> > which is enabled by selecting dtbo/input output options.
>=20
> Why is a new magic number needed for .dtbo?  Isn't it the
> same format as the existing .dtb, just with some added
> nodes?

I insisted on that.  Yes, the encoding format is the same, but in
order to properly interpret the content, you have to know that it's an
overlay rather than a full tree.  So, it should have a different magic
number.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s9kDAZ2EyO0AcRYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRj8AAAoJEGw4ysog2bOS05AP+QEqUUrXz2bXbdxk/wHR0+wx
4O0OSb64MwFEG3gEJYRfK3pzBku1+z5Zzm5cHDNHuzZ23SPSTuhFZDiEhcdP8PHA
EZRlNchVD52E76RrTvdhGNUAb0e7npIMykZowy4vGN3s2qvSxGcvLY1UvPHbLX2c
B6jSbaT6vUr04g36/U7JIJxiEyih9ZZ7Kb8YyiJ3l5SmPtnF1J2oLdlqWadwagJR
tBU4mNEDBxlpt+6FLCUxAwQDPNRYbQdeGfkpzO+DPZTn4WqxlgP9dnvVf7BGR9jr
CZS6fsPhLVp6ScgSfUvrVmL/Bo3Qg/Qgk2If9Ih3P5nQw9/6RKyg8dbjUfeKCt4s
amtTXROuYnqHGEK8JkW2S1P+N0IXBUs7kIGMEzbfkxm/GA7hIW2SGit5ZDgkclVd
THtN2np/6fzUWPEgq4qq33+VWPd8nmhmKwwAI2/OXMA1UXV2+J7n0XxcPTH9Ptyd
Uy3RTnBXZzakwrZuBgmfMPiFPUD6LmhuYj9dxiut/s+mr74r4Pw7+9AmC3Y0D6eK
x/hohgQP9do+MYoZRTfmJsxl6wZZRvup8or0QBC2ug5JiZayULKG3Fnjaa5lhfyU
TmHeIU0KmSxDldKAn650cOSeKUVxrnA5rDQNGwTGJFtgbbYo2DsKsXqgplk7AR6m
er8QgKu4keTMeOxtaL0A
=a9bq
-----END PGP SIGNATURE-----

--s9kDAZ2EyO0AcRYa--
