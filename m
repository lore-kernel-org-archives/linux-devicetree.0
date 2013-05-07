From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] extcon: Palmas Extcon Driver
Date: Tue, 7 May 2013 08:58:24 +0100
Message-ID: <20130507075824.GM7478@sirena.org.uk>
References: <1362662506-14823-4-git-send-email-kishon@ti.com>
 <1367846225-15685-1-git-send-email-kishon@ti.com>
 <20130506144010.GF13472@opensource.wolfsonmicro.com>
 <51888D55.3090907@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7941234340688201539=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51888D55.3090907-l0cyMroinI0@public.gmane.org>
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
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ruchika-l0cyMroinI0@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7941234340688201539==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bPrm2PuLP7ysUh6c"
Content-Disposition: inline


--bPrm2PuLP7ysUh6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 07, 2013 at 10:42:53AM +0530, Kishon Vijay Abraham I wrote:
> On Monday 06 May 2013 08:10 PM, Mark Brown wrote:
> >On Mon, May 06, 2013 at 06:47:04PM +0530, Kishon Vijay Abraham I wrote:
> >
> >>+		if (palmas_usb->linkstat != PALMAS_USB_STATE_VBUS) {
> >>+			if (palmas_usb->vbus_reg) {
> >>+				ret = regulator_enable(palmas_usb->vbus_reg);
> >>+				if (ret) {
> >>+					dev_dbg(palmas_usb->dev,
> >>+						"regulator enable failed\n");
> >>+					goto ret0;

> >This is very bad karma, why is the regulator optional?

> The platform can provide it's own vbus control in which case this is
> not needed.

So why is there no interaction with this external VBUS control and how
does the driver distinguish between that and an error getting the
regulator?

--bPrm2PuLP7ysUh6c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRiLQdAAoJELSic+t+oim9IcgP/REeNr48hy+v4SL4nbnVylm0
nnDouNmr9htqqqXgGxJsphHt6IhcS78yjFESwvcxe9m4YsYDZHjXNuW5oXVgPxwV
XdD3ExXDqkljbY0UtB7VQ7HGQPIqP38CEmPStwWKFKeOmlb0hvTFpKoMgUnYSeCV
1i5YadxZg4jtgczvL63feCE2yqX/+etQcesk8+rmFj+oJ/niegGLCXdcO+Y8wrl3
fJlbOBpud4/+NmnC3Q5wYLOyiQ9Idq+Bv/gcBF84kCijhprUOiqjabB9jkwyM37d
M3a6KbTJuY/LBCrhUcdADsD3dEvOXTOgQFV7/jOvAcJHqqqEuxANuO50yDmktxk1
u0KRxZVBdkXRaD7rrSJLVCY7tXnt4FBOSp3xknq6ZDwdDfxEQGvn2KSObmZxan5z
ugNErUiS/QVkspxG4OEuXc58CAP+XnIEkRNUPYs0DoGi4M6IKZKAzkxxuZ5HKg91
zS1aUNTGK4CNtD1cQ30Tn9TYMRmIcr6QTk+iIsVWJue3CdM2stW2LNr1yKrtpt7D
c7Uw4QmpEYW6ZRiHHv+4P+L2+x9FfEY2sx90TGyHNcPWL7vOQyQMpRwhN3wbCW+q
Tnrqd+UzqGCXHX2nYoRFSbcc9kXA2nelEWWQICCzpBLW6lvWm/7B3kBPa7lvXUKo
WPWjs52yEfwG+WK+P6j5
=lQrk
-----END PGP SIGNATURE-----

--bPrm2PuLP7ysUh6c--

--===============7941234340688201539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7941234340688201539==--
