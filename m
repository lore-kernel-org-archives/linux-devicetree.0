From: Mark Brown <broonie@kernel.org>
Subject: Re: Moving ARM dts files
Date: Fri, 7 Dec 2018 15:16:25 +0000
Message-ID: <20181207151625.GC6510@sirena.org.uk>
References: <20181204183649.GA5716@bogus>
 <9c2b5528-679a-928e-3150-aa383a4f0405@suse.de>
 <CAL_JsqKO3v0pgVfNhVNOkpZ4sePrybDgZG0riN-tutvwOZ4zYg@mail.gmail.com>
 <2474284e-8a55-639f-2cfa-f811741099f3@suse.de>
 <CAL_JsqL4WoMqFCQ0vFd6z_i=9imnfVsQjeKOG8zxNwi5caneRQ@mail.gmail.com>
 <20181206200652.GB3084@sirena.org.uk>
 <CAL_JsqJuH4=Bq9ok3Trz4GgLam7gqWW5-gyHpG1XbShtQQuSJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6119980347678048259=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJuH4=Bq9ok3Trz4GgLam7gqWW5-gyHpG1XbShtQQuSJg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Michal Simek <michal.simek@xilinx.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Tom Rini <trini@konsulko.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Alexander Graf <agraf@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Architecture Mailman List <boot-architecture@lists.linaro.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux>
List-Id: devicetree@vger.kernel.org


--===============6119980347678048259==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline


--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 07, 2018 at 08:57:06AM -0600, Rob Herring wrote:
> On Thu, Dec 6, 2018 at 2:07 PM Mark Brown <broonie@kernel.org> wrote:

> > The issues with the existing install_dtbs sounded unrelated to this.

> Maybe, what are the issues? We can't change the source layout
> transparently if dtbs_install is not being used.

I thought that was the thing with adding -@ so overlays could be used?

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwKjsgACgkQJNaLcl1U
h9C6CQf8C0xpFJ5MgnYqKRIbk06eno0tDKs+W/eqttr5a380po4jWe2yGP1NAlhZ
BYPVRnISkn0qZzHxN7PitOKbYFmJm97wg3cYbrr/xyH2BILZhDyQFWPA5w/Knnwd
/lPJz7JB3GeiVR/MdFQScwB7O+097zVAdTwLDogQXgKZ+sxIutNAY4Jz27K03Scc
B3VioyMAKpxbcfipt612U5bE5HYqIfG/q9zBj24WRHSRuC6o1n1UYqPxrzsA/IhI
Sc74JmYmSNT+NTZbB6Np3iPMqwp0nqPvkZlkK7LFOqHDViCUFZ26hmK9mAVGOWWF
QayC1zgsdxfG9OlQWrxhM9NCR/rigg==
=w1n+
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--


--===============6119980347678048259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6119980347678048259==--
