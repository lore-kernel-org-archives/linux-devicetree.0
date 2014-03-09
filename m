From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH RFC 1/5] dtc: Add helpers for various message levels
Date: Sun, 9 Mar 2014 22:43:19 +1100
Message-ID: <20140309114319.GF20356@voom.redhat.com>
References: <1392919611-10746-1-git-send-email-t.figa@samsung.com>
 <1392919611-10746-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392919611-10746-2-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 07:06:47PM +0100, Tomasz Figa wrote:
> This patch adds three helper macros to print errors, warnings and
> informational messages using standard format.
>=20
> Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  dtc.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/dtc.h b/dtc.h
> index 20de073..e95bed7 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -43,6 +43,9 @@
>  #define debug(fmt,args...)
>  #endif
> =20
> +#define pr_err(...)	fprintf (stderr, "ERROR: " __VA_ARGS__)
> +#define pr_warn(...)	fprintf (stderr, "WARNING: " __VA_ARGS__)
> +#define pr_info(...)	fprintf (stderr, "INFO: " __VA_ARGS__)

So, there are already several message helper functions in dtc.
They're not all that consistently applied, so I can see an argument
for cleaning things up, and replacing them with ones modelled on the
kernel versions like these.

But.. this patch doesn't do that, it just adds yet another variant to
the mix.

In addition, what we want for messages in dtc is a bit different from
the kernel - the kernel's expexted to keep running, and the messages
log events of interest.  For dtc, for each warning/error you should
also be deciding whether that should terminate the program or not -
these helpers don't address that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTHFPXAAoJEGw4ysog2bOSdKcP/1YJdzsC8PWXKoPkj+QO24Aj
YmpiDCvEvvBYaVAxVAw5mXYhQj/DSN/iDcsYj6fXz9a3lOXRpoyYVRMROR4tTc9A
lA/MYrYEko474fVMPhwT1K48z8iKY/j2BaFm4MCCEFblPUvhPAj0h2mn+D09lFe9
pPza4ReJBMluqESV8Fg1tW/rbTlbr1ESLTmna0fwoQhiB0SaIKfpRvyFDnQwtm0k
GPkr+d6ZdPC2CDTXTTEcQob7P1gf3lZV8G004oyVLkbr5GfEape90zpuNw75Qook
T61O0jNwWxNpeF5ln7UmAv1lbWaCIOfh5LdsR5KWAMfEBs0ilvUUOWeBLR4SSgXW
xtdYV4NOvHIeDZ9+n0dcOkTMO2ztBVkPDz3SUBezLe6HY6vsXbqa+bdgjQ6sOu2Y
S5r5ytSivcNbE/DstL5bI5vtWXROjINJDl9lGdR5Zth2kIGYQjV4w+YmGyfwQYln
xpaxS5KDAiaXRoFDRE0zpZQQr27M1RFwljjlCSAUwMK+ybkwi/kmOr6uHMeE9QjH
lCT8On7T75Pa8Re8+FgQLRHIOuxkWxGfnZx7GrYwpl09dMqfiRAVIx4Q1Zl7gbjs
5TUVem42wuq73km5HuTQlUOiFZtrgx8Zm1s1EL8jiufAnngVUZw/By6t43P7WLnG
7Jw6cK9Pe+eq+gCzgJs2
=GGOC
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
