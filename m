From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] regulator: st-flashss: Add a regulator driver for
 flashss vsense.
Date: Thu, 14 Apr 2016 16:25:30 +0100
Message-ID: <20160414152530.GH18024@sirena.org.uk>
References: <1460474204-5351-1-git-send-email-peter.griffin@linaro.org>
 <1460474204-5351-3-git-send-email-peter.griffin@linaro.org>
 <20160413061514.GI14664@sirena.org.uk>
 <570DFC44.8060408@st.com>
 <20160413172318.GC29471@sirena.org.uk>
 <570FA606.4070908@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TKYYegg/GYAC5JIZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570FA606.4070908-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Giuseppe CAVALLARO <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Youssef TRIKI <youssef.triki-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--TKYYegg/GYAC5JIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 14, 2016 at 04:15:34PM +0200, Giuseppe CAVALLARO wrote:
> On 4/13/2016 7:23 PM, Mark Brown wrote:

> 	/*
> 	 * After resetting, the CONFIG_REG_PSW_<xxx> are set, this
> 	 * means 3v3 operating voltage.
> 	 * The CONFIG_LATCHED_PSW_<xxx> must be used to fix the previous
> 	 * bits so operating at 1v8 if this is the real HW configuration
> 	 * at boot time.
> 	 */
> 	if (!(value & TOP_VSENSE_CONFIG_LATCHED_PSW_EMMC))
> 		value &= ~TOP_VSENSE_CONFIG_REG_PSW_EMMC;

That's definitely better.

--TKYYegg/GYAC5JIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXD7ZgAAoJECTWi3JdVIfQte0IAIHDo79a4T9y2CWCDA8zsJtq
MB++ioZhvDEzRPfh1esHIEDEsVyfB7sYtJzTk5L0e4v38gvpHc8him/sMkUtjbNN
S1ouxHYhJ2XfH5AaukRvDajabexm+DOFV5UQ5MqrxYTowJ5a/uZ4O2gJJOBarZvo
fSc160M36/U1LbTuGXD9Y0oo7WPt1bPDeBHYfs/mwMRii1uIKY2MNenW/XDU18sm
X7rVgWE44vG4/6X/RerDdLGj2D4asn1GrMuFeDbHRLZ9ZOSd8dEmURn8nJiS2A+C
w8EoqwSDgpcmUyVNPflijyfuqzGGnSFmb9IwlL06Uldt9oyUr/BQg/AzDZRMDTQ=
=/IO5
-----END PGP SIGNATURE-----

--TKYYegg/GYAC5JIZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
