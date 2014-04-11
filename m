From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/3] rtc: Add APM X-Gene SoC RTC driver
Date: Fri, 11 Apr 2014 10:28:56 +0100
Message-ID: <20140411092856.GL6518@sirena.org.uk>
References: <1397155678-26607-1-git-send-email-lho@apm.com>
 <1397155678-26607-2-git-send-email-lho@apm.com>
 <1397155678-26607-3-git-send-email-lho@apm.com>
 <20140410224244.GH6518@sirena.org.uk>
 <CAPw-ZTns1EOT0inn0hq0Xh+CdjMkxhOkvL+_BnRThnm7HQC=BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ai6NJizWfpRUKxSm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZTns1EOT0inn0hq0Xh+CdjMkxhOkvL+_BnRThnm7HQC=BQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Ai6NJizWfpRUKxSm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 10, 2014 at 09:22:43PM -0700, Loc Ho wrote:

> I was modeled after driver rtc-coh901331.c. It seems like all I need
> here is to call clk_disable_unprepare() instead clk_disable for
> suspend. For resume, call clk_prepare_disable() instead clk_enable().
> No need to split them up. Am I correct?

Yes, the only reason the two operations are split is to support enabling
and disabling in interrupt context but you're not doing that.

> Given that Andrew Morton applied v2, should I post an patch against v2
> going forward?

Yes, once something has been applied you should only be sending
incremental patches.

--Ai6NJizWfpRUKxSm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTR7XVAAoJELSic+t+oim982oP/2o+CzYx0aZdwSuoHmcLeyYi
SED1DrWo1+AYjSaR7oQttGJsqG2Alh6DEGjmLfkb7eBk3CG8kTZ085f5lSzGEDpx
vWUOj+Ha1BcN4JNx7/EXcYgZ37BG3kWtNduIEI4LPNm/h5h8YiywENylUYySLtI4
Kl+G5r+pC8OeGPZ0rmMa4w08DNjg6vX0OMOvAI9iqIs4f/5dip+LXKwvy12MCW60
+89SP8bXT5xI0wNCxGyVJRztMpDYp4+7Gh1VUDyFZHn7Pme7+x2Bsr6pwEG5jvPw
9NJNQ4fVP1MiZj+0ycvqB5WgjrL46vwdGHHVwEfg7XFPFNelZNqn44354tF4YPgp
0Nxp7N0naVOv409EPL+hMhlBgryjp0HYAF9AJrIhLygvDwLjPTYo/5Z2DwQCJ4Bc
5hn7vZwiASh7CC+CeP96v1huT18Jabf5XJ7AxXRHU3EoAH5P6K1tAuyY6VvjnGIz
riFHuWab+TQd67/7FmiwES6ZarIxKmEoqvSHnxgbvH3g86XYcMcq4/17bojFBHuj
LR/GHs8WU2dqUbdCPT4FCHyNVIv1Ymr+/9WTOCHnXKFXH5FXR4q4PJUnL8dwOz/C
P2gEt3JEMaBVa4xlbTvKnaLoAUWTZBqfKj+U6IgRmUeRLBoL17WVSE+PJbOHlqfv
aUy1a9hfxvZ6l9TIYDQa
=IUhv
-----END PGP SIGNATURE-----

--Ai6NJizWfpRUKxSm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
