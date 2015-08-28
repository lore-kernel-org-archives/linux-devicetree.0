From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 5/5] [media] c8sectpfe: Update DT binding doc with
 some minor fixes
Date: Fri, 28 Aug 2015 07:57:02 +0100
Message-ID: <20150828065702.GC4796@x1>
References: <1440678575-21646-1-git-send-email-peter.griffin@linaro.org>
 <1440678575-21646-6-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440678575-21646-6-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, mchehab@osg.samsung.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 27 Aug 2015, Peter Griffin wrote:

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/media/stih407-c8sectpfe.txt      | 16 ++++++=
+---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/stih407-c8sectpf=
e.txt b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> index e70d840..5d6438c 100644
> --- a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> +++ b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> @@ -55,21 +55,20 @@ Example:
>  		status =3D "okay";
>  		reg =3D <0x08a20000 0x10000>, <0x08a00000 0x4000>;
>  		reg-names =3D "stfe", "stfe-ram";
> -		interrupts =3D <0 34 0>, <0 35 0>;
> +		interrupts =3D <GIC_SPI 34 IRQ_TYPE_NONE>, <GIC_SPI 35 IRQ_TYPE_NO=
NE>;
>  		interrupt-names =3D "stfe-error-irq", "stfe-idle-irq";
> -
> -		pinctrl-names	=3D "tsin0-serial", "tsin0-parallel", "tsin3-serial"=
,
> -				"tsin4-serial", "tsin5-serial";
> -
> +		pinctrl-names	=3D "tsin0-serial",
> +				  "tsin0-parallel",
> +				  "tsin3-serial",
> +				  "tsin4-serial",
> +				  "tsin5-serial";
>  		pinctrl-0	=3D <&pinctrl_tsin0_serial>;
>  		pinctrl-1	=3D <&pinctrl_tsin0_parallel>;
>  		pinctrl-2	=3D <&pinctrl_tsin3_serial>;
>  		pinctrl-3	=3D <&pinctrl_tsin4_serial_alt3>;
>  		pinctrl-4	=3D <&pinctrl_tsin5_serial_alt1>;
> -
>  		clocks =3D <&clk_s_c0_flexgen CLK_PROC_STFE>;
> -		clock-names =3D "stfe";
> -
> +		clock-names =3D "c8sectpfe";

Are you sure you even need this property?  I'm thinking that *-names
properties are *usually* only required if there are more than one in a
single property.

>  		/* tsin0 is TSA on NIMA */
>  		tsin0: port@0 {
>  			tsin-num		=3D <0>;
> @@ -78,7 +77,6 @@ Example:
>  			reset-gpios		=3D <&pio15 4 GPIO_ACTIVE_HIGH>;
>  			dvb-card		=3D <STV0367_TDA18212_NIMA_1>;
>  		};
> -

My personal preference is to have a '\n' between nodes.

>  		tsin3: port@3 {
>  			tsin-num		=3D <3>;
>  			serial-not-parallel;

But these comments are pretty trivial, so agree or not, or fix-up or
not, it's that big of a deal.

Either way,
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
