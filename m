From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 13/13] ARM: STi: DT: STih407: Add clk_ignore_unused to
 kernel bootargs
Date: Mon, 10 Nov 2014 10:04:06 +0000
Message-ID: <20141110100406.GL21424@x1>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-14-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415361475-6218-14-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014, Peter Griffin wrote:

> At the moment we don't take a reference on some core interconnect
> clocks which means when CCF turns off unused clocks the SoC will
> hang. As a temp soltuion we will boot with clk_ignore_unused
> parameter for all b2120 boards.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stihxxx-b2120.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts=
/stihxxx-b2120.dtsi
> index 862bb2f..7280b6d 100644
> --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> @@ -8,7 +8,7 @@
>   */
>  / {
>  	chosen {
> -		bootargs =3D "console=3DttyAS0,115200";
> +		bootargs =3D "console=3DttyAS0,115200 clk_ignore_unused";

Acked-by: Lee Jones <lee.jones@linaro.org>

Although, hopefully we won't require this for too much longer.

>  		linux,stdout-path =3D &sbc_serial0;
>  	};
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
