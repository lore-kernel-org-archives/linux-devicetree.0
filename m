From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] regulator: pwm: Prevent falling too fast
Date: Thu, 1 Sep 2016 20:51:06 +0100
Message-ID: <20160901195106.GM5967@sirena.org.uk>
References: <1472617277-30814-1-git-send-email-dianders@chromium.org>
 <1472617277-30814-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5401415086689464727=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1472617277-30814-2-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5401415086689464727==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WuedheRyq6FDfQ9j"
Content-Disposition: inline


--WuedheRyq6FDfQ9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 30, 2016 at 09:21:16PM -0700, Douglas Anderson wrote:

> In this patch we actually block returning from the set_voltage() call
> until we've finished delaying.  A future patch atop this one might
> choose to return more immediately and let the voltages fall in the
> background.  That would possibly to allow us to cancel a slow downward
> decay if there was a request to go back up.

We already have mechanisms in the core for drivers to tell the core how
long a ramp they need for a given voltage transition - you should extend
them (probably needs a set_voltage_time() operation adding) so that
anything like this can be done in the core rather than open coded in
drivers.

--WuedheRyq6FDfQ9j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXyIapAAoJECTWi3JdVIfQH/sH/019NSsj2ZkhigUIIiffZnKR
ZuP/Oi0cmEQcG87Pyn7ENVPDdvbiKzq2kx72tVNKjNBSFnNKHL1e8ZVWO0hGi7xp
YUxL+KhFFC5pKSHppjvsfY3UxawTaC3IBRX9eVBHfysLtaQmPhouk6pKyXuiqL99
nbB/ktvjR4EVGNh8PFCINlzvJPUvfj7/mVz+v/dx1MYql0lwU0+1e0AO27lkCjCi
FbOtt5GSWp1EyIkbD+jCmeeqwhVgHp9IRCG/oe92GFJ8zlJu2dRLCd6e04pPcocf
66/kdGXqC5VTkdnDYA8JqjU/zm1hPmXkS39g1IZssqbjnx2QxP7IyKyT26R7LNc=
=Xidr
-----END PGP SIGNATURE-----

--WuedheRyq6FDfQ9j--


--===============5401415086689464727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============5401415086689464727==--
