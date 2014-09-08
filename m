From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] RFC: add function for localbus address
Date: Mon, 8 Sep 2014 22:21:43 +0100
Message-ID: <20140908212143.GN2601@sirena.org.uk>
References: <540E1014.8090102@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1540210485977394504=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <540E1014.8090102@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Stanimir Varbanov <svarbanov@mm-sol.com>, Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1540210485977394504==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FhKpTYimqQF2+bfE"
Content-Disposition: inline


--FhKpTYimqQF2+bfE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 08, 2014 at 01:22:44PM -0700, Stephen Boyd wrote:

> Where is this described? From the commit text that introduces
> IORESOURCE_REG I see:

> "Currently a bunch of I2C/SPI MFD drivers are using IORESOURCE_IO for
> register address ranges. Since this causes some confusion due to the
> primary use of this resource type for PCI/ISA I/O ports create a new
> resource type IORESOURCE_REG."

> And the comment next to the #define says "Register offsets". I don't see
> anywhere where it mentions these are CPU addresses. Certainly the
> current IORESOURCE_REG users aren't CPU addresses because they're
> SPI/I2C device drivers.

Right, the intention was specifically to handle things where
IORESOURCE_MEM wasn't appropriate as it wasn't ever going to be memory
mapped I/O and should be in a separate address space.

--FhKpTYimqQF2+bfE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUDh3mAAoJECTWi3JdVIfQh9cH/02T4h6Y6ZA1T3XlNeTSvIJ+
tZ8O95PRWz4Kjiu9m6ZrbR12uZ+yNFZfWq4CXS+X8nUhR71u3qa+kyiun0VEQ2wc
xEPWL/p5+DO8hWgG1Xr3qejbpAGj115fwZMHuWM3oXp0AmnFf/qdzgRvGm2EcLW1
QeVWIyYEN6EGPu0KjCaBL0nIBIacxHTSZK05WO+pjrLgXOfknlmKOZt2pHOIs9i8
WkQK0Wg9GO/B8g6R1sVgLeD3NHzOJY8dvgzhB/yc6s43zmGHV2ankKoI0jnYkUEs
4EWGQnpvcLMhGMVor00qfq3vQEO7TziZGrWY+aehc4LOqHYGlWYAUNHAxVb3bN0=
=h2Dc
-----END PGP SIGNATURE-----

--FhKpTYimqQF2+bfE--


--===============1540210485977394504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1540210485977394504==--
