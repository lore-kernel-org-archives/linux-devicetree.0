From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 2/3] ARM64: dts: sun6i: add dma node for a64.
Date: Tue, 8 Nov 2016 19:47:15 +0100
Message-ID: <20161108184715.x5kjhjthmuxor2xz@lukather>
References: <20161107182247.GA3669@arx12>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8789798629269140898=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161107182247.GA3669@arx12>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hao Zhang <hao5781286@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8789798629269140898==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="blsduocvkwalq6g6"
Content-Disposition: inline


--blsduocvkwalq6g6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 08, 2016 at 02:22:47AM +0800, Hao Zhang wrote:
> This adds the dma node for sun50i a64.
>=20
> Signed-off-by: Hao Zhang <hao5781286@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index e3c3d7d8..855ae2c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -227,6 +227,15 @@
>  			};
>  		};
> =20
> +		dma: dma-controller@01c02000 {

Please order the nodes by base adress, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--blsduocvkwalq6g6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIh2zAAoJEBx+YmzsjxAgcEwP/1jS2TVF2oacnbYiRvDCwgnx
i+GEKb5VQOoceEztK3cnm5fSHxpKxl/id4H3ogu+XTsMOuTRel2gbbNF8qgWmfMd
FYG9rl3mK8HYzpuhr6f1juIRkrpq6nkDoTRnLzSC1Zaao7zH6laxDfBxa0GjTrPa
iIvymMI6GOM0FgdJ36WiIb42oVJyH5VhjidviWCcof9ATpHRpgHQ0AfootZFxiu6
Ytssl0OyzpvakqaseDspBnx844RRk1vJW916SdP7N7nRuG2s7Sv2e0/4jDnxc2YG
qDTBdFwLWK2i0PfgC4AFALuv7m7TqPUhPOm5FiVQ/7RG6ztwMX2TNrLJ4f4EAdh0
JSB2JKVFIlt1NmSAWlZk+vu/8ZQAoCFpZmY8LuCMh1f1OU2ksx4Ol7AbpXhFJ/RJ
eAdWtT1OZo7PR0NGFyVsNqtcCVacjfMmyi+8dkaf/hyaa3ZcFWY+7IEDTwwxFxGH
n5IT64ldldTx5InwfFn9tiMsc44clgjt5iyN8J3XaumFoENiGAdgTL8XbCMZLaR1
yfc49jHRFMZ6JIMiSS3CVIiL5yBPs7H33lei9lHFARfq0MdybShLVvPxV+ASHrx+
yWjAUUTzLSqrst6y6sckx7CTW1gt66bH+DD+PGB9gbJsrDCK4zKGwfqpQIa+h4JK
NIrG7ScO5Nftrnjwy4R3
=jqcV
-----END PGP SIGNATURE-----

--blsduocvkwalq6g6--


--===============8789798629269140898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8789798629269140898==--
