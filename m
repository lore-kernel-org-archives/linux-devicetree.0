From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] regulator: wm8994: Use GPIO parsed from DT when
 registering regulators
Date: Thu, 11 Apr 2013 17:57:18 +0100
Message-ID: <20130411165718.GP9243@opensource.wolfsonmicro.com>
References: <20130411162315.GF9243@opensource.wolfsonmicro.com>
 <1365698217-17771-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1746003351211213970=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365698217-17771-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1746003351211213970==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt7EHN8kmSCh+bhe"
Content-Disposition: inline


--jt7EHN8kmSCh+bhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 11, 2013 at 06:36:57PM +0200, Sylwester Nawrocki wrote:
> Ensure the regulators are registered with a GPIO parsed from the device
> tree when available.

Applied, thanks.  Should be done more elegantly but I can't think of
something obvious right now.  Thanks for testing.

--jt7EHN8kmSCh+bhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRZutmAAoJELSic+t+oim9wWIP/1wEGAbocyuqm7ezZ/PCuHYs
tnVqg8Pv9HdLTdfoB2h/7i8CFEc8D3nPQYHygV5IrEznvKa99jv+hwQS724MNEQX
nsjMrJEDTNUCrsi1vN8qDZrsmQ5bAwXJkg88+1cLe9jwC9h7W9E2mu9B/zwu79/P
NntXRqATwjA8Fe6ASTvmZgDbRyg/LsmpX7zRTG5mJKF+AjAoC6HLBtRFauHbkipI
+6WivUDej2DsBwiL3k9XPtofyKuK6EFRoBiRWhrCSdT7KUFR9Wl7H22V3hfofbce
ASRDTH+zR/R2uEToPOY6rg590Je/XigFbFZA3AH3ip4F3xtIQCMybAucE5Yw1kfu
b7QqWhzicoJhy9ij15E92F44FMJ8Df+seEPYxPKZsyZ81x4Oxde59pUl1pwYJJZc
CEI6gYTqC5+110F4a9MYlHMkf/O4fjvAexc8n7+7Sm5FnxNvST62rQED4FdmPDR/
6Xmi3C1mCkaTfjhygTSXMPsghI9rXZhBXc0O/NqZrA0XXGS+HCbC9yQqTTANe6at
K7HsdmRrcMNVpXnQQYueAwwrs1L/1dc1bUMEO8I1Z2TiJCjdEGva3hoK46XmYUff
Ke/Gh/z9nNMEIzVudM+gNiKRAXhkvYYYo6VDm+d4mLGSnX053cxc19NhXnw0Ws/c
tz4l9d3ymTGEFVnl6Hzg
=+oIw
-----END PGP SIGNATURE-----

--jt7EHN8kmSCh+bhe--

--===============1746003351211213970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1746003351211213970==--
