From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] regulator: arizona-ldo1: Move setup processing from
 arizona-core
Date: Tue, 15 Apr 2014 13:13:25 +0100
Message-ID: <20140415121325.GX12304@sirena.org.uk>
References: <1396340845-24060-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1396340845-24060-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20140415101200.GC27091@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OtXN0xDA1zr/oUEL"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140415101200.GC27091@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OtXN0xDA1zr/oUEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 15, 2014 at 11:12:00AM +0100, Lee Jones wrote:
> On Tue, 01 Apr 2014, Charles Keepax wrote:

> > +#ifdef CONFIG_OF

> I think "if (IS_ENABLED(CONFIG_OF))" is preferred now, but I guess
> that's up to Mark.

Yes, it doesn't matter for booleans though.

--OtXN0xDA1zr/oUEL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTSJiAAoJELSic+t+oim9Me0QAJTrUpGzSbRISrS+gCHNkSPl
6WLtN6Zi2MbdvAwvDtfZhbUse1aw7SvZNU3uLUhDDs4EdXLsrJNzyo3V6TH2sbF2
l2JXTKUbkZu4Dsc8Y2RCBkASEI5CA2ngmjEqReU0sr5zAqx0+9pext/u3PbPJAWo
pwo35aWk+jV6CHiDhgoMerQmOgg7dkkJvgyd8iSx5ViNl2QRq6OX1oFjIL8RJP/+
VglJZiMI9VOOFPTqklTwOiJ1Y0DDVg+k3RM5KkleUhLslSpukh7z65Rhfl2hS9uu
TJfJiPL9VYsb5pdWnH9sDi2Ry3i9gOZDnSHKhMsAcbsLgwTzDwgg8vskzj0UDceo
QRA4S89dQjH1bsmB2O6+UDqZAicpcCvuMJeXuGau0ioFLU0UYjGekdHHxJ/TKknz
UZ618SB5VS0giQMlF2uqUW150Nj3fV6KqkfVYKNf+Km40MRjAITcROI1NGY3B+yE
J3SfwPgvXj2YxYROuvMquvel7+6AjwsH9eFJcoWQe9TYhm51u7Jul+OR/zeY0uNE
iSZSMDccu0mVfQW9BY2MEFgtmOHfWF7frJawmM2/nb1aVjBrNcOaS+PxzyHN8phQ
mh5zZEBPmNxO3RvmDFZ5Iq+OY/6QmRTGha79/UT+Jw5x5+NZu+Ql0nQ7eCw7sB1I
lpqa5aBvwEr3BhaBjFC8
=+lY2
-----END PGP SIGNATURE-----

--OtXN0xDA1zr/oUEL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
