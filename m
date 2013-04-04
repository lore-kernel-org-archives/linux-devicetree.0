From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add MFC clock entries for exynos4
Date: Thu, 04 Apr 2013 12:49:24 +0200
Message-ID: <515D5AB4.5000501@samsung.com>
References: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, rob.herring@calxeda.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On 04/04/2013 08:26 AM, Sachin Kamat wrote:
> Added MFC related clock entries in exynos4.dtsi file.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
> Based on Kukjin's for-next.
> Dependent on the below patch:
> https://patchwork.kernel.org/patch/2349361/
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exyno=
s4.dtsi
> index 59e6730..4061f48 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -150,6 +150,8 @@
>  		reg =3D <0x13400000 0x10000>;
>  		interrupts =3D <0 94 0>;
>  		samsung,power-domain =3D <&pd_mfc>;
> +		clocks =3D <&clock 170>, <&clock 273>;
> +		clock-names =3D "sclk_mfc", "mfc";
>  		status =3D "disabled";
>  	};
> =20
>=20


--=20
Sylwester Nawrocki
=EC=8B=A4=EB=B2=A0=EC=8A=A4=ED=84=B0 =EB=82=98=EB=B8=8C=EB=A1=9C=EC=B8=A0=
=ED=82=A4
Samsung Poland R&D Center
