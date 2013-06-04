From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/11] drivers: Add Pinctrl PM support
Date: Tue, 4 Jun 2013 19:37:54 +0100
Message-ID: <20130604183754.GT31367@sirena.org.uk>
References: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
 <20130531170437.GA17591@core.coreip.homeip.net>
 <CACRpkdYnhjpFp1CM=P_hddBe4qVigtE0c+CN9NKvk3nFgJS-ig@mail.gmail.com>
 <87k3m92148.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5905154056644430137=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <87k3m92148.fsf-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, sudhakar.raj-l0cyMroinI0@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hebbar Gururaja <gururaja.hebbar-l0cyMroinI0@public.gmane.org>, Vaibhav Bedia <vaibhav.bedia-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============5905154056644430137==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4A5jqvouPF9zMMhx"
Content-Disposition: inline


--4A5jqvouPF9zMMhx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2013 at 11:15:51AM -0700, Kevin Hilman wrote:
> Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> > I think this will save a *lot* of identical code in all the
> > drivers, that will just have to call
> > pinctrl_select_pm_sleep(), pinctrl_select_pm_default()
> > pinctrl_select_pm_idle() instead of all the complex code.

> > This is what I planned to do but never got around to.

> What about taking it one tiny step further, and having it done by the PM
> core itself?

> Seems like something that should just be done as part of runtime PM
> transitions and the suspend/resume process.

Indeed, I remember suggesting this as part of the original discussion of
having the code do the default state setting.  It seems like there ought
to be very few devices which actively manage pinctrl themselves,
otherwise we'll get a lot of boilerplate.

--4A5jqvouPF9zMMhx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRrjP/AAoJELSic+t+oim9DmEP/3sP8FVKLoscMVCtMQc42wPF
bkIv73O08RRyFyiY6s6qonCXt9BgDqx2fEINZlKBq9XgngFTnFBSfmvK5xPSqwON
eZK3JNOHn9B3nFedspDc2ybVEjCdx6caW5OqR5ywShEFK6ZNI4cDpC15ploP8cGe
pFBXSKDVYbeisXz40peJxVnoGcu34gK0uQmX9FUc0R3zfnZsmUf2Z/IWTLs4sPPq
YWVZtsU+hIMnrpBEEW/xdYFQ23iGSVcYj5vGHNakXA5CkKQr11kXG5EbZ0qDbb27
BlVMEMKQYKD4CNd4C+s+5TYa381TeOT6ceLJwGArf6TBeagwByotJJT4ibS39er3
LGTtZHic4II/ARv9YSzIXTfHOk6EpWLYAvWcIZEf4d9yMabGVh15fK6gB6He9d7x
aW7c0qbnnoN/wDkjbGGExpf3V4fj5lt6uy0DpMZmzumfBFXizev+i4zbxnE9BLSy
Wk1czJ0ck02wnE1di/AeKAhuVAatIqClCDjSs97TzEWT2WYXrW+uBmkHOWWFS83s
z+m2C1vxWP61jpnv5spEGrjERrg2M5+AosQ9tYmj3waHPMD4YZtZhuTyFZcvD6Si
5ii8CBnwkpMIbUnHPRDP4d1K5nWy3qm06B8iC5UGtT4/8kcm+q3RUe5Juvc78AzJ
rjoDxyUTrkWh/MbsmLIt
=lnk6
-----END PGP SIGNATURE-----

--4A5jqvouPF9zMMhx--

--===============5905154056644430137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5905154056644430137==--
