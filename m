From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v3 3/3] regulator: mcp16502: add regulator driver
 for MCP16502
Date: Thu, 13 Dec 2018 16:21:41 +0000
Message-ID: <20181213162141.GQ10669@sirena.org.uk>
References: <1544522876-15967-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544522876-15967-4-git-send-email-andrei.stefanescu@microchip.com>
 <20181211164706.GL6686@sirena.org.uk>
 <6a35df06-1309-f069-9b22-8c2cc5cca56e@microchip.com>
 <20181212155502.GD6920@sirena.org.uk>
 <2f24d81a-5271-6ea7-32a2-bc2e708521fa@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KHqYxKoy+XnO4RVf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2f24d81a-5271-6ea7-32a2-bc2e708521fa@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, Cristian.Birsan@microchip.com, Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andr3i.stefanescu@gmail.com
List-Id: devicetree@vger.kernel.org


--KHqYxKoy+XnO4RVf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 13, 2018 at 12:19:16PM +0000, Andrei.Stefanescu@microchip.com wrote:

> I tried with both suspend_late/resume_early and suspend_noirq/resume_noirq.
> Everything seems to work ok.

> Which one do you think is more appropriate? I am guessing that during
> suspend_late some devices may still need to be turned on and that it would
> be the safest during suspend_noirq.

I agree, noirq is going to be the safest option.  Can you respin with
that please?

--KHqYxKoy+XnO4RVf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwShxUACgkQJNaLcl1U
h9C/zwf/Q9S+epb2YtPqpjlyCkUDkJehQHR8TCNGVpUBk2xmCbAb2Fl9ggO3wMFA
l7rsBe74p6O9e3j0eKXlCXhK/t+PwgLYDnF5s8a9mTRtCxJ5o36xQ2HaNd9RiONu
gglSeDYP2j9GSvwj5phIBYSe2YlhIm616SHLOTMx8GMZCwtU1Vf0HxO5itpelnuM
3EJOd/jE31Jzmjsmd2c0hneaAReu8S8NaC28wX8gRPtF7nVFyVHxKhGlWTRCWxWr
tTpfIMyuN2RPdWRYM0HbLH1qfFpfdDHHe/vQbF8H8Euw/RWFIciEprNfWuoN4en4
PiX/rGxZYtRyD1/3Sk96iufnjs74XA==
=9cSY
-----END PGP SIGNATURE-----

--KHqYxKoy+XnO4RVf--
