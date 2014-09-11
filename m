From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/7] clk: sun6i: Unify AHB1 clock and fix
 rate calculation
Date: Thu, 11 Sep 2014 22:36:23 +0200
Message-ID: <20140911203623.GJ31276@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TC23+W66xmFESAX"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBD4SZCQAKGQEZUXSWUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410000448-9999-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6TC23+W66xmFESAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sat, Sep 06, 2014 at 06:47:21PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This series unifies the mux and divider parts of the AHB1 clock found
> on sun6i and sun8i, while also adding support for the pre-divider on
> the PLL6 input.
>=20
> The rate calculation logic must factor in which parent it is using to
> calculate the rate, to decide whether to use the pre-divider or not.
> This is beyond the original factors clk design in sunxi. To avoid
> feature bloat, this is implemented as a seperate composite clk.
>=20
> The new clock driver is registered with a separate OF_CLK_DECLARE.
> This is done so that assigned-clocks* properties on the clk provider
> node can actually work. The clock framework arranges the clock setup
> order by checking whether all clock parents are available, by checking
> the node matching OF_CLK_DECLARE.
>=20
> However, the sunxi clk driver is based on the root node compatible,
> has no defined dependencies (parents), and is setup before the fixed-rate
> clocks. Thus when the ahb1 clock is added, all parents have rate =3D 0.
> There is no way to calculate the required clock factors to set a default
> clock rate under these circumstances. This happens when we set the
> defaults in the clock node (provider), rather than a clock consumer.
>
> I can think of 2 ways to solve the dependency issue, but neither is
> pretty. One would be to move the root fixed-rate clocks into the sunxi
> clk driver. The other would be separating all the clocks into individual
> OF_CLK_DECLARE statements, which adds a lot of boilerplate code.

I don't know what Mike thinks of this, but I'd prefer the second.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--6TC23+W66xmFESAX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEgfHAAoJEBx+YmzsjxAgIJUP/3ja2sF/gJFyt47UunSFS38b
iQQE+nk+12M4Ozg7wEuRZyuGPeOTkA7SVNyrcQ7ZZhcDYTbaI5dFZ2FkfWLBg8cM
zRc64tVeLZVmZJKc+PPmcXbY3uSggTE3bkoAbVcD1ZFFKMkD5GTGObOOe9YP7S9b
D3Y0cW9Ae1db2UmeRiTrpjdCqT8uyCRj14nkYYFHiUnF5ax66R3bFZOrpD5/HB9p
hx4GGyVd1Qf5lu4DMaXJTvP6XtarZC0GpqtddzkTtLHZwDxQSLTYHn0IL8CEEdb2
rklaSyybE+SjruF5leIZaLTM3pD2Gkdn8gp2ecprclSTKAfVHfLjQa04Y+E9RmCL
9k3iUrZHAboN22w1B5IPfL5YO51p2fqz5NI2s/dIeyvLp+/VEXUhfFCVj0jRiR/i
kwxHheZxq6JARvMHooZb5YA4Q9KtdEZ9qMpuNwEbOWyeY8sHkxuKr8zwJKeJonNi
aWXkCwdGt+4N4h5B3m7XjaiqXuFODdzV6vS4eM8q/7UZXkypPnl/7OqXUWKxvcIb
+N4YRGSulbTieyjBh/rsSytE4taNxaaRwqVnYUWuMxjgSqIeTiH0EByVlbbx45Lw
NlXKw/bGFTG7AQN78UvgirmRkQ2/D+NkMTGU9rvpxFwdYeTlp2skRKCnhSIotuei
S17JSbLTsTE0WCykCo8S
=RazR
-----END PGP SIGNATURE-----

--6TC23+W66xmFESAX--
