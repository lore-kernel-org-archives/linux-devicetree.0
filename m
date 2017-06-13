From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: use cs-gpios for cros_ec_spi
Date: Tue, 13 Jun 2017 19:22:25 +0100
Message-ID: <20170613182225.smahsf3jzvbc7w7z@sirena.org.uk>
References: <1497331543-8565-1-git-send-email-jeffy.chen@rock-chips.com>
 <1497331543-8565-4-git-send-email-jeffy.chen@rock-chips.com>
 <20170613175043.GC9026@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qjfl6r4m36ew2l7k"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170613175043.GC9026-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qjfl6r4m36ew2l7k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2017 at 10:50:44AM -0700, Brian Norris wrote:
> On Tue, Jun 13, 2017 at 01:25:43PM +0800, Jeffy Chen wrote:
> > The cros_ec requires CS line to be active after last message. But the CS
> > would be toggled when powering off/on rockchip spi, which breaks ec xfer.
> > Use GPIO CS to prevent that.

> I suppose this change is fine. (At least, I don't have a good reason not
> to do this.)

> But I still wonder whether this is something that the SPI core can be
> expected to handle. drivers/mfd/cros_ec_spi.c already sets the
> appropriate trans->cs_change bits, to ensure CS remains active in
> between certain messages (all under spi_bus_lock()). But you're
> suggesting that your bus controller may deassert CS if you runtime
> suspend the device (e.g., in between messages).

> So, is your controller just peculiar? Or should the SPI core avoid
> autosuspending the bus controller when it's been instructed to keep CS
> active? Any thoughts Mark?

This sounds like the controller being unusual - though frankly the
ChromeOS chip select usage is also odd so it's fairly rare for something
like this to come up.  I'd not expect a runtime suspend to loose the pin
state, though possibly through use of pinctrl rather than the
controller.

--qjfl6r4m36ew2l7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllALWAACgkQJNaLcl1U
h9Dqmwf9HaNrRklDm4miRUa0QtYMw0s/qZU13AQX4bgUcYBuF/c9RvDfPT2/0UYJ
nTRutT7n600AduZHzNIYskTiIXmo3r4pOP4n7zXzKmz3lJJv1xxDmAZNq0hGsFYA
4G/UfQZdyHRhT9UF4QRE1No1E/LVo0GCVePuMc3qK3t9VzUAFsP6Yn49x5iErdMt
JpONzslvoP2uitfA4g6nw1l02+FNZoyOhGo4bme7QJ7/bbLE9QV7JHf6gxEIR5DM
AsuADLgrTz7hLC6KJNoT8Lxe8Po7J40whtfW6pnWyX1V0GjdokjKZ75YUoiFfInN
o+/BzRt8ebcITMqedJ3Dx2W+MCuGLA==
=1m4/
-----END PGP SIGNATURE-----

--qjfl6r4m36ew2l7k--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
