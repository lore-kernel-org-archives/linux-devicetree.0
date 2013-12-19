From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: Start using standard gpios property and
 deprecate some custom properties
Date: Thu, 19 Dec 2013 13:26:02 +0000
Message-ID: <20131219132602.GB31886@sirena.org.uk>
References: <1386965234-26461-1-git-send-email-tony@atomide.com>
 <20131216183615.GK3185@sirena.org.uk>
 <20131216194023.GE26293@atomide.com>
 <20131216201102.GP3185@sirena.org.uk>
 <20131216210512.GF26293@atomide.com>
 <20131216214057.GG3185@sirena.org.uk>
 <20131216230622.GH26293@atomide.com>
 <20131216233737.GL3185@sirena.org.uk>
 <20131217153727.GI26293@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q1SX3yAxAkj1z+aD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131217153727.GI26293@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org


--q1SX3yAxAkj1z+aD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 07:37:27AM -0800, Tony Lindgren wrote:
> * Mark Brown <broonie@kernel.org> [131216 15:39]:

> > No, that's a different thing - the PMIC will typically be able to use
> > some pins as GPIOs so most expose a GPIO controller.  The functions that
> > are an issue here are things like voltage selection, voltage transition
> > completion status, sleep mode, enable control or whatever that may need
> > to be tied to the SoC for interaction (usually not just limited to the

> OK. Maybe the best way to deal with that is to have the driver specific
> regmap (gpiomap? :) configuration describe that? And then the driver
> GPIO configuration is picked up just based on the compatible flags and
> the gpios property?

Possibly.  I'd need to see the resulting code and DTs - I'm not 100%
visualising what's meant here.

> > Oh, OK.  Yes, standardisation of the names has benefits though for some
> > of the features (especially voltage selection) the implementation gets
> > rather chip specific and there are also advantages in having the DT
> > binding correspond to the chip documentation.

> > Things that really are very standard probably ought to be being done by
> > the core anyway (like we've done with all the factoring out of standard
> > voltage map and regmap operations).

> Agreed. And a lot of that can be configured automatically based on the
> compatible property.

Hopefully not even the compatible property - we ought to just be able to
pick standard names for some of the standard functions and just support
them without any effort from drivers at all.

--q1SX3yAxAkj1z+aD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsvPnAAoJELSic+t+oim9gW4P/1AZnbfJrlUS8g5KxFswDbyL
BlPnRzO6SvKAkuLh9sHA/J9SGAyXFu8PJghFa/Hd9UXrKaKhlfh1Km2FcyJaKRb1
5j7uMj42CoZUDu5kElyIsWi5tyWRcCvD7u1BioGH+bgFRrwI9w9XHuWeJmlasqBb
63aAKj/BP1NtzIlYLPyhKl35Yl+/iqxdCigZX8Ph3WsBjxz7Aks0PBmwlnAKX5+q
wf9u2u7Ych3Nt5c6x3BB4aFrJV20Wtu3uqgtP39FWQfYKfe+5T6X3cuCaoaOPlaX
sGjGgFKRAi9gvNvF2BFhpoZUzC0VhBok2K2MYAQfplMqEBhtPkKJBfh0SwZrUou+
50XJxkPFugRXV+EZy8da5RY/fChUmEU10a8ztM9OEgJKJ8ed7vn+SX5tQJLUD+ZU
iQNI/QDvP3K2gVCa0JKOnL49UuYAsqZ5wCJmHss02a8mtyuzMDLfNeIb7Ji5yPOE
7DeHHM7whyIZuOrBpYnkNDWfdS+ze+Ggmbs73FYdtrTt9UU+CkdP864b39ejZcYT
3ys4MG67es+K9XsnIR0a2k4jo/o5Qmj+S1H9gaYTecwMwPFb7fCfIXwuLavbQdu8
s+lx/EZTBnboNU6MDiTU6QLdZP0LAoFpzwQRY54a9bQWUYsuewDLUEqIL8rzzLMr
ViDMav4jJc8OdgozlCxS
=D/M/
-----END PGP SIGNATURE-----

--q1SX3yAxAkj1z+aD--
