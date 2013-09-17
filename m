From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Tue, 17 Sep 2013 20:13:19 +0100
Message-ID: <20130917191318.GJ21013@sirena.org.uk>
References: <20130912205644.GW29403@sirena.org.uk>
 <52329AD3.2050608@freescale.com>
 <20130913102127.GD29403@sirena.org.uk>
 <52366F97.5030402@freescale.com>
 <20130916101912.GY29403@sirena.org.uk>
 <5236DD17.5090203@freescale.com>
 <20130916110634.GC29403@sirena.org.uk>
 <5237BB01.3080700@freescale.com>
 <20130917105142.GO21013@sirena.org.uk>
 <20130917150548.GE14747@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tez2gqrut5pn4jhH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130917150548.GE14747-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, "thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org" <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tez2gqrut5pn4jhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 05:05:48PM +0200, Gerhard Sittig wrote:

Please consider writing smaller, more focused e-mails - I suspect quite
a few people have tl;dred this...

> On Tue, Sep 17, 2013 at 11:51 +0100, Mark Brown wrote:

> > This is what the delay_usecs field in the spi_transfer struct is for,
> > the flash code should be using that to ensure that the minimum delay
> > requirement is met.

> Not quite.  You talk about 'delay_usecs' which is about letting
> time pass by between partial transfers.  The "dummies" mentioned
> here in this thread are "bit times with _clock pulses_" that get
> inserted between transfers with single and multiple data lines.

So just a normal transfer then...

> Compare this with M25P opcodes READ 0x03 vs FAST_READ 0x0b, where
> the latter "communicates" a dummy byte before real data is
> returned.  So far (AFAICS) those dummy bit cycles always were
> multiples of 8 bits, i.e. complete bytes.  So they could be done
> with bitbang as well as get simulated with "traditional" SPI
> transfers by just sending another byte without looking at the
> received data.

It's not even being simulated really, it's just a transfer - lots of
devices have some dead space during their transfers to allow the device
time to react.  Doing it for less than a byte is an interesting design
choice to say the least but doesn't seem hard to deal with.

> which is why the flash chip's capability alone does not suffice
> to enable the use of such an optional feature.  And users or
> admins may want to control the use of optional features for
> development, or diagnostics, or compatibility, or whatever
> reason.

There's a reason why there's a DT property (or platform data) that needs
to be set when registering the flash device.  I don't think
administrative runtime control of this stuff is a terribly useful thing
though, either the hardware works or it doesn't.

> [ generic support for enhanced SPI communication ]

> And the datasheet had "sequence diagrams" (section 4.2.1) which
> one may use to check whether those "phases" in the course of
> communicating "a command" can get expressed by means of the SPI
> message submission API (struct spi_message, and struct
> spi_transfer).  Currently "use DDR", "use single/dual/quad data
> lines", "append dummy _bits_" appear to be missing, but might get
> added similar to the existing "control the CS line".

Dual and quad support is already present upstrem.  I don't know what DDR
is.

> - make SPI masters (controller drivers) support those optional
>   additional features _if_ the hardware supports it (read: do
>   nothing for existing drivers, and only add optional support to
>   new drivers)

No, I imagine some existing devices support this stuff - the bitbang
driver trivally does for example, if with questionable utility - and=20
most systems will be able to bitbang a few extra cycles on the clock
line if they have to.

> - announce the SPI master's optional support for enhanced
>   features (do we have such a query API already? or is this
>   another leap in quality for SPI?  I think bit order and SPI
>   modes 0-3 may already get matched but are not explicitly
>   queried)
> - make SPI slave drivers optionally query those master
>   capabilities (plus other sources of configuration information)
>   before they may adjust the SPI messages which they create and
>   emit (which again is to do nothing for all SPI slaves, except
>   for another translation layer in those MTD drivers which happen
>   to use SPI for communication to the chip)

Things like quad support that depend on the board need to be enabled by
the board anyway.  For everything else we should follow the existing
approach of advertising capabilites in the master structure.

> [ potential "LUT" optimization, implementation details ]

AFAICT the big issue with the LUTs in this controller is that they are
expensive to reprogram so things are going to work better if there is a
small set of known operations that will happen repeatedly.  Otherwise
walking the transfer list at runtime isn't too hard.

> There's a question whether an SPI master's
> .transfer_one_message() callback (or common code which dispatches
> messages to SPI controllers) should actively reject messages
> which require features that aren't supported by the controller.
> Or whether these flags need to tell "required, reject if not met"
> and "optional, please use if available" apart.

This stuff gets checked already, more or less.  We could probably add
more checks but it's not been a big issue, by the time you're erroring
out it's too late anyway.

--tez2gqrut5pn4jhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOKnLAAoJELSic+t+oim93ncP/j/IbCpnZzU2QOOfQG/ICiO2
P7PX6l9YNy/bQ1Vkd/qHN0iTzpL73o0aUWyUD+1VtVHQy31wKZEgyjFvKEA8Gltq
dvXi3Q/GFNHsUoOsvVYur5wlLzxEPIbQZDwB1SzMsQLeqfx7kFdv/P+IvXauEZOV
iNoEZUcamw5bY+vfzGwB4OwV1OETx7juhUi5UMr4i4WN5Lx8Yy8mflvXsmamh1wv
JkMiKGxYzDdoKFVDAox+xszK4Tcm/sd4QfICk0e/6SZVjBArCxGY4qq1T+5IOKa3
DBxFuDcskBSs1zlm1qu2lLwGp4xmfV/S0GpTIBaOpE5PAGZr/nFmDHUbAq/0NeC7
GXWUEfadZzsPWNP/B4mGtENx7C+gqwEIroImtl+gFi7K27ziwgtyr3BXTPmE+rw4
ABe30fucT1ASFISVya8kR4hmgkkS8nr5PqtwHXepEr5hRXqPD+p+LPBG8fibKFTu
6G6ipON/LXibeYzHtDaIFOw7tgplBEhWj7LjkjOj9e4k4S6Rakg0SFuToHYS6ZPz
BsMFa4vmOYaH8kUX49GWnAa42OSeh50PboHoyYCStpqSX4b12AKBZ7vrePKDrN98
BEBChu3NKQ55QgqLv3mlkSXjzYizuJ8nr7JupmraYT3CLGFMAQ4SCG9IFHCfnTTw
aM24IXirsENaCzo1Lmx3
=zCvI
-----END PGP SIGNATURE-----

--tez2gqrut5pn4jhH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
