From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 10 Sep 2013 22:37:18 +0100
Message-ID: <20130910213718.GH29403@sirena.org.uk>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de>
 <52279524.8090006@wwwdotorg.org>
 <20130909161924.GT29403@sirena.org.uk>
 <2052193.CMUEUJFRgS@lem-wkst-02>
 <522F78CB.2020507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKFWEirOtDILsmKV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522F78CB.2020507@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Lars Poeschel <poeschel@lemonage.de>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org


--DKFWEirOtDILsmKV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2013 at 01:53:47PM -0600, Stephen Warren wrote:

> Doesn't this patch call gpio_request() on the GPIO first, and hence
> prevent the driver's own gpio_request() from succeeding, since the GPIO
> is already requested? If this is not a problem, it sounds like a bug in
> gpio_request() not ensuring mutual exclusion for the GPIO.

Or at the very least something that's likely to break in the future.

--DKFWEirOtDILsmKV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL5ELAAoJELSic+t+oim9dtUP/0AWFWgw5UlR17/czrgfnULO
Oc0TTfMHE326k97TeOhvFAcMgSQPf82ltO8hXsHonxeBEuycL+f9Vx775DFKGF/G
+bIx1IX4TVn0fmWlmXie2Y9bHhRlZRWzoOaQQX0gxLwdlGJ+v8gT+xizPqCdJ5rV
shkiLwgKMniP1vVJD8KuJI3KyP2hn18ouK7oxj7CXZ2HPtK3hnIyGpZUgdzJhjZ+
EssOu5WC1qk0ZaJckXhKBmFBjgULXUBDkKob/btYFW25LlOs8x0ksxZeO1darvq0
3mcD9MRjufPsHI8L3B3oGVfsw0q34te9cxweVJf+OYYCY46QcHtdC3pogESGDNUV
rKkjawM0HczPPC60fjl5He5ytPbtI02QiD2X7ZEGIRYBiQRoRtElw9ZVWR4fzL1k
kCLMfBeS6f8QUzAwRILwgjq+YT30uty5gL7ZxF3ypTGrrnnyEQdnuKV5oP+E6GwN
3OjWuYa+M54l55DWDnEV66obCRfsAGDVp5Y11PaAxPayEl4gdS/JAtpq0iede783
ikg1kGG7sbLDVDX/MWMFpomDoyjzOUJqI/IdDaYJ/Z9C9iggEAI0HYlo2o898c3W
mYhjgjfhOEcXeWWnAwyNNHzA1hyNfx+MqsgfJtysDtpNAoQXn4AFpjifyUSJxNOU
DPueTs/Eh0aX+ZJkabKh
=CE4Z
-----END PGP SIGNATURE-----

--DKFWEirOtDILsmKV--
