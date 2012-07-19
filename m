From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH v3 02/18] fdt: Add header guard to fdtdec.h
Date: Thu, 19 Jul 2012 09:49:54 -0400
Message-ID: <201207190949.56104.vapier@gentoo.org>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
	<1342106718-3058-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0801043359=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1342106718-3058-3-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: u-boot@lists.denx.de
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

--===============0801043359==
Content-Type: multipart/signed;
  boundary="nextPart28582878.1xaIMIn2Pt";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart28582878.1xaIMIn2Pt
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 12 July 2012 11:25:02 Simon Glass wrote:
> This makes it easier to include this header from other headers.

Acked-by: Mike Frysinger <vapier@gentoo.org>

> --- a/include/fdtdec.h
> +++ b/include/fdtdec.h
>
>  const u8 *fdtdec_locate_byte_array(const void *blob, int node,
>  			     const char *prop_name, int count);
> +#endif

personally, i like seeing a blank line before the final #endif
-mike

--nextPart28582878.1xaIMIn2Pt
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJQCBCEAAoJEEFjO5/oN/WB54gP/Rndt0zJsrc0R44w1lbHk5b/
XDtOggeeDzl04uCiVBoBteFrIhFJ61jKKOo5aK28YY4HxM6umAU4dKLE0EGv3eLx
N/6rn/VM+HR3OJzIfnPg3zw8K2IjCOOGdSHXunHdVjDu6+RAHr5EurpFj5SvmBCk
PjvzMb315CUK3y9BLw5/TBKR8b6/Et3nnxF9iKvbwZHkiGRDOf5sr4j3mCY23ELp
lZfnFPH2HUa9u0FTO2tT9g/Vph5i61Iqknw28RbYAYT3wLzsDsGm2oft3NthRBSd
mqAAs9pespQ5rl2Y96S4t/CPrYo1Q6XRunOC5j4oUO95CkYLOlQT/MB9jzHAnOhE
Yh+QOCxQVh4+LFXEaCeL1xYiqNfUnrXUNHq2qHMlKRpoXmQKLrSUBQjRSAqBjW2B
aM6eYAdlK6tLGA8f08yJqUWwXyvyEnZ5xWF7VBlusJZyoE5pbTJlae9kmiFJ0sZu
YriMb0luqugSjxOfpNMU7SajUPPfBHrSJvn4ZTExFQ8QFeYu8ySOQKM2SrY7tQdQ
Qqyf/OJ+J0PC1NdbC7HJX3RXSQcmBaUOrOvk2UCh2xFVwrfl9UEu8RJvpFqJ+zrk
KqqaLoNBiHykFT6Zfog2a4jfI1DhRHV1nAjfWVLLT8wsInedjYK+SaC2ocb9Kn26
7aZRpgJG+n/M/43KTi5q
=2099
-----END PGP SIGNATURE-----

--nextPart28582878.1xaIMIn2Pt--

--===============0801043359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0801043359==--
