From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 5/5] regulator: RK808: remove redundant code
Date: Wed, 27 Aug 2014 10:01:46 +0100
Message-ID: <20140827090146.GU17528@sirena.org.uk>
References: <1409062737-12259-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q7cvAXluP2XyzQqh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409062737-12259-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--q7cvAXluP2XyzQqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 26, 2014 at 10:18:57PM +0800, Chris Zhong wrote:
> remove the redundant code, since pdata has been removed from stuct rk808

I've applied this but if there's further changes needed please wait
until the MFD changes they depend on have been accepted before
resending.  This will be less work all round.

--q7cvAXluP2XyzQqh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/Z52AAoJELSic+t+oim9A8gP/i//MAT/Sm3djBei7vBX27dJ
UZ65GhPPDSkDCyNDxjJ6FddpkB1hc8/qxSqOLspG+7C2Iawq46z45/rv4Zp2nqGW
4wd8WJ5pa55D6tJU/IV/j1rKnu7CECbuDU1fyoryXeY+VqVvnGUrRU7oVm3iLe9+
t1tWrLHPr6q7m/IUoQWIdPATxTBDB8KI8w/whwANfzEKF2Jiq22DoAgdxfLWtDdz
+fPm7+JXdzY8+6Tf9R2G/YMgojKi3lPkqxFfqBZn0KFSQChMuzF0gDWwhB2A1uhj
FUzIZdUSRnzGMvl4QXDNDWBkKUeKKafCizX0YRfklK+a0wbhzzJ40dEVpifEiOj7
dxXITUuoFteSFxyiaBsk+XUy5Ue0zSAY667vOh0H0osqm1BkJOCwj8vH9zhSVD/O
HY5FC3tbr6e+YdqPoMj1BT564DPWeaa+S01X3B2gjFHxk1Ti7oStqkURV+8zTHfY
xHdPe/Z6Df6oMk+hQnxvdOeYplAFxA66OcrQ4VIHiBjzbiTBLnXP6Lv7EdT/sE+s
sRGjzBwG+Eftt/fODVWDUhmXyMvgm9LRQTqszRFgnjLxsIn2Y2YQTY4/L39A7AJK
ua/FSLllSPG5DZvdt78KDTlARRVeB1gxYEDpEJSGpA/byh80UsAMrBi5LY00Ls+Z
ZoCOB+gSEzpRb44JhdZ6
=Yu4Y
-----END PGP SIGNATURE-----

--q7cvAXluP2XyzQqh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
