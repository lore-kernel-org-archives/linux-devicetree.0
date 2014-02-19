From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/5] mfd: add bcm590xx pmu DT binding
Date: Wed, 19 Feb 2014 13:47:26 +0900
Message-ID: <20140219044726.GC2669@sirena.org.uk>
References: <1392765432-9111-1-git-send-email-mporter@linaro.org>
 <1392765432-9111-2-git-send-email-mporter@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3538535890634627580=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1392765432-9111-2-git-send-email-mporter@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <mporter@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Christian Daudt <bcm@fixthebug.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============3538535890634627580==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3vG/4P2kj9ZtXmMR"
Content-Disposition: inline


--3vG/4P2kj9ZtXmMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2014 at 06:17:08PM -0500, Matt Porter wrote:

> +
> +				rfldo_reg: regulator@0 {
> +					reg = <0>;

What do these reg values mean, they don't seem to be documented in the
binding?

--3vG/4P2kj9ZtXmMR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTBDdbAAoJELSic+t+oim9hOMP/RqduJ03BXUpU15KXSJHwI+g
4HqBYU7j12zning05Kx1qeanV8eQuoXuLUMvphmJ+X/9zeBR2QrAwf2Abc3ypdLE
QaBEyDjge0+Koyxnbb0+dxrGZosqSdLedp5t6RelCrSSX7antTmx/M0myXVE2/wk
cf3+7WeGeVO1oOqNVh03BeoN4Xiujou0dYJQJstko3thyR9J/SLawuIxTLrTPab8
mfnD56+V6U0YeF2kO7gNyZOoSiF2Ix36TF8l/iP8yh+FiRVEZOuwASleVD4JM5IX
64tlF1BXUjF9/Lf8U9LD7Fa/xHprmecko06iDocugY0R0oRRUM3UVGEu2N0iNi1R
CjK5d9Jo0ipdBA2gZqhcv9KpVZKCiqB2xVXzlTjGKXVWhj0A+rajV0i1CU/PhfCp
aXTh8nrLfkWWBx6hMU6BUso77+kqxHN2BxT9ouds6MMnczm7EWLQR6CrBfWP/F/J
STlq0uoVQMDB+RMPi7RE/+I2X7qBmeEMbwkphmEifqahjP6fSq+soLq5WcIpZDHz
/ejJu4F+sPUJLdjKHiY8Lkap21t/yfLNLxGv/qw1aCq0gAIsjA4T+1zgjPuPVGPl
7r2T+kBuAVBaKAUQqt4q3kxAujQ5+FUuVPHJD+fEIlaOH9/VX00Cro1/KlCnpakx
dsXcwZAJ69cDhNV3NtJP
=sj8G
-----END PGP SIGNATURE-----

--3vG/4P2kj9ZtXmMR--


--===============3538535890634627580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3538535890634627580==--
