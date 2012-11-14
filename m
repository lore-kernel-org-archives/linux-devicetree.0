From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v9 2/6] video: add of helper for videomode
Date: Wed, 14 Nov 2012 13:06:22 +0100
Message-ID: <20121114120622.GC2803@avionic-0098.mockup.avionic-design.de>
References: <1352893403-21168-1-git-send-email-s.trumtrar@pengutronix.de>
 <1352893403-21168-3-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5165376628185067679=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352893403-21168-3-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Guennady Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5165376628185067679==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 14, 2012 at 12:43:19PM +0100, Steffen Trumtrar wrote:
[...]
> +optional properties:
> + - native-mode: the native mode for the display, in case multiple modes are
> +		provided. When omitted, assume the first node is the native.

I forgot: The first sentence in this description should also start with
a capital letter as you terminate with a full stop.

Thierry

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIbBAEBAgAGBQJQo4k+AAoJEN0jrNd/PrOh2BMP93MAR+pS4eGgB5cunoapIzMl
7MOas914oB0++XF7Dte/7YaHwlkzdg2Nbm4At6rmqN8OE632iccgee8sNfG4XdGO
JWKlQ1z1fpuuDnfBzVpISE1s4jT94KCv+vZB/TBCAal5ZmOXfy0lQ03ej0vHPhWY
W1PRUTGxQINET6iM8nVnXMazWzufUxeRUBY+aiRW0Kv8WYO9m3Gxx4w9clNrEMKm
VBENWctOdv/IgUnSolTXd2dqrz5sfFGjMiR2yYzd7sZBhSiFllG9rUyc43YU0nNc
JdcIFQKi1UKIXreKmgqq29OUWNvO3RPLYrfGtnBV1tSEv1LrQANuziDjMFc6ZcbT
5SxNZMGJw3a2RU4vEj5z15p7NQ6J87bx9cknc8M6r3ldOizhwoaS2paOYUm1YoSC
8l6Ux8rjz1i2/+MUW473tiWpb1DASCoyWFax87N/U/fHnnME7TFnEvA7nCfuQ6bH
KK/Uwig44xndBWdj4JwSgCoej+POPpvQd4g6kHkfvRaA14nVgXlAqfJvOxs1LIYS
DUcjItrNFI+vPTXuOYq3AVFe1aTc2TNoNtbunKYHp+h3LDPy8ooUgIXnmN03tF/R
u1ewFIQFwluDDxoEDfGxP0sddEyRA7TYbb4PPS/hMGJNNIs5YzSqoSWjZ7BiyTCk
gh52oDykeaILepSy3f8=
=SfNW
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--

--===============5165376628185067679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5165376628185067679==--
