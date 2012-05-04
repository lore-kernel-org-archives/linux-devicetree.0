From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Fri, 4 May 2012 13:17:30 +0100
Message-ID: <20120504121730.GG14230@opensource.wolfsonmicro.com>
References: <20120503132004.GB14296@sirena.org.uk>
 <4FA2881B.6010902@ti.com>
 <20120503145248.GJ3955@opensource.wolfsonmicro.com>
 <4FA2A08C.5000403@ti.com>
 <20120503152643.GM3955@opensource.wolfsonmicro.com>
 <4FA3958A.4080206@ti.com>
 <20120504090856.GA14230@opensource.wolfsonmicro.com>
 <4FA3B182.5060001@ti.com>
 <20120504112204.GE14230@opensource.wolfsonmicro.com>
 <4FA3C3B9.3030009@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hcut4fGOf7Kh6EdG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FA3C3B9.3030009@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org


--hcut4fGOf7Kh6EdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 04, 2012 at 02:55:37PM +0300, Peter Ujfalusi wrote:
> On 05/04/2012 02:22 PM, Mark Brown wrote:
> >> The OMAP platform related drives has been already converted to use
> >> irq_alloc_descs(-1, 0, nr_irqs, 0); to map their range (including GPIO,
> >> twl6030, etc).

> > How does this work for interrupts on things like SPI and I2C devices?

> You mean on devices like twl6040, twl6030, twl4030 (I2C MFD devices)?
> Or "irq expander" type of devices?

The latter, and also just any driver that delivers an interrupt via a
GPIO on OMAP - if the GPIO IRQ numbers are all dynamically allocated
then it gets hard to register an off-chip device and tell it which
interrupt to request.

--hcut4fGOf7Kh6EdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPo8jNAAoJEBus8iNuMP3d49wP/1APiZ/L0/M3Q7cyCZ/XFNKw
3jTXpAWKcrW+6tzTdue6Wqa+EpquJq+6kBW5lFWP6488PKQmnkniTaX+pqKoGDFI
l0mHDGFRpVHYvRO8GGmbXlUez/OixlA2dwZ52SlnRDeiognFeiRePhv7hJQOR5x2
ZcV2E36ImZX88mJGc4NUx9nBNfIq3PlGFTQswNPdTf1ULTis+V8S2TsSXxEQ1TE+
3vxjT5X/755MINABx/FFna3cucewCjInbhzwwL3BqSOcFTzV9rhh3mu/ZVCs9QEv
WSRTcZHxvB15aq40us9LAA2vyBlvePnSLFpytHbqgejg1d3Gu+GH6ICwHpXbaLwu
YAg5v+sU+K9OW/CeuYRd8glqz5xA7xnuxjgNj0AVg3i1GFfRjd7xcaMNZvuXUt60
XlqaziMEklpBCVtiAj+XPsueDhDIvYE6+VV0+NPadcAikBg32zdsr80plEkNZez9
tavgZpmKLvULr3o7GveIt2+tzJVdbjW9+FDf+yd54zkzriDYmqyKeezuwgrdMzgu
FG1sVqVSrjBNMVOXf3CvXUNs5VmLBf1PVBMbdwYb/rxmJfBwgeFUmxivbB3df4To
17oe0gRoT4BoEBUvny8l9UjnzOhOXHi0fhfSyQoo1+FWNJuPDTuJvBM2VXyPCSvN
1V5gw4EWsH7Encxon3uU
=3bWX
-----END PGP SIGNATURE-----

--hcut4fGOf7Kh6EdG--
