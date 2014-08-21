From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] Regulator: RK808: Add regulator driver for RK808
Date: Thu, 21 Aug 2014 09:47:43 -0500
Message-ID: <20140821144743.GG24407@sirena.org.uk>
References: <1408628104-16314-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+Pu8h6CsJtbukPM9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408628104-16314-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+Pu8h6CsJtbukPM9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 21, 2014 at 09:35:04PM +0800, Chris Zhong wrote:
> The regulator module consists of 4 DCDCs, 8 LDOs and 2 switches.
> The output voltages are configurable and are meant to supply power
> to the main processor and other components

I've already applied this, please send an incremental patch against the
current regulator tree with any fixes.

--+Pu8h6CsJtbukPM9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9gaHAAoJELSic+t+oim9U3EP/ibS1dvB262ySQoGhfaSpUsN
CnaeYGmrMeLcZp/eQ2G6Pvz4IQQSHFd7QSWxGbp8y42OhuTjmm6sqJysKikfrp4i
o4trMw8iQyMW1tP85cb/LdtEVdX2JySpes2tWRUCeWJ49Pu2cIXGuLi9rdwAO5H7
FATnBkhY6aN9iOWeS4DUL/9eMxoII5BwcFYenFYhOdD+5GZvNTfS2BXGlBkMUpLG
Bzq/VXUusEPlb4OLo/R5lB9My8IuMx/lFkW4asNHwb/y1P9/rt0UYwirtsTjx8CY
VPE6GuBKAWUkhR8XUOr8AASPlysZVPizJcU5xmEqPUIs+Dw/M2v1Y4MOq4uq+7qP
OP1lody6+pd6+5Oi4nGVBnXk1oVaJupvuwZI5j+p4AaYR5m7sWpyxDq0g70u8N/f
uqt+I7+Jv5gx28RoKy9ADTwnLOs0j/+RhNVCss/Usx7Un/CpVIdaiEfadzjU/tK/
xJjqEx5NXBtZV9vnJHtvGKBakv20CWKlVZszl7pabUoFtIlzHPcek+004IF8huPM
sgAgeGnZxDRsYj7LK+F/OvZaBKslDyOzudYAWQu+dPA0O7W4BA2ud0n4kUM8K0Fc
ely9g1on+mbCjspcC+AQExe798dSJpFz/J74NyRBUnvvsOw+8I4J7ZI+tcPL/vuS
IAvskd/VJcSVhaeczcHm
=6ZWY
-----END PGP SIGNATURE-----

--+Pu8h6CsJtbukPM9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
