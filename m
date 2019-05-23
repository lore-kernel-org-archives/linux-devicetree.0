From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Thu, 23 May 2019 14:16:41 +0100
Message-ID: <20190523131641.GD17245@sirena.org.uk>
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
 <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
 <20190503062626.GE14916@sirena.org.uk>
 <229823c4-f5d4-4821-ded1-cc046dd0bd20@linaro.org>
 <20190506043809.GL14916@sirena.org.uk>
 <a89763cb-5d50-0927-7912-6ccf38ae1d66@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6152281657868454929=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a89763cb-5d50-0927-7912-6ccf38ae1d66@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vinod.koul@linaro.org, linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org, lgirdwood@gmail.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, niklas.cassel@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============6152281657868454929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 10:35:46AM +0200, Jorge Ramirez wrote:

> Would you accept if I wrote a separate driver specific to pms405 or do
> you want me to integrate in qcom-spmi_regulator.c?

> I am asking because none of the ops will use the common functions (I
> wont be reusing much code from this qcom-spmi_regulator.c file)

I don't really mind, if there's nothing really shared then making it a
separate driver is probably best but it's not a strong opinion either
way.

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmnTgACgkQJNaLcl1U
h9CDcAf8DL+MyQPT/4yQxHXXQBs5IDMiS1xz5/mDyBccppntbLrOEa47PK9HkXBd
1OOgkPuGEIYd74ad4Oue+CWFYQJhofrt4PSHoq0qfciBgho8cgZGRKI5twUI5P68
lQP7WMcri9askjAXIzykFfbdNoSQVoCsWi2mONsSDJXQqZg5C8VAdH1wpJjBe27Z
we9oiZ+JQi0NvANUAHq3IqEHk3q9EP2p1IpvMzLRJHIv96kmHD8IJXoF5eZC2Hs1
QRv7RA+EgX1/mT2JhVE+FaFvDbb4Ur4oLU2u/387E5ImIQ+ltcADQq2KUbsbl4LN
sJRpd1qX9AEPMdyAnm2K18I0slbCRg==
=5f7d
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--


--===============6152281657868454929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6152281657868454929==--
