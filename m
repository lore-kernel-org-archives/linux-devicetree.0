From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: 88pm800: Update the header file with 32K clk
 related macros
Date: Thu, 23 Jul 2015 16:52:33 +0100
Message-ID: <20150723155233.GT3436@x1>
References: <1437476823-3358-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1437476823-3358-2-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437476823-3358-2-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jul 2015, Vaibhav Hiremath wrote:

> Update header file with required macros for 32KHz buffered clock
> output of 88PM800 family of device.
> These macros will be used in clk provider driver.
>=20
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/mfd/88pm80x.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.=
h
> index 05d9bad..680e4eb 100644
> --- a/include/linux/mfd/88pm80x.h
> +++ b/include/linux/mfd/88pm80x.h
> @@ -91,6 +91,7 @@ enum {
>  /* Referance and low power registers */
>  #define PM800_LOW_POWER1		(0x20)
>  #define PM800_LOW_POWER2		(0x21)
> +#define PM800_LOW_POWER2_XO_LJ_EN	BIT(5)
> =20
>  #define PM800_LOW_POWER_CONFIG3		(0x22)
>  #define PM800_LDOBK_FREEZE		BIT(7)
> @@ -138,6 +139,13 @@ enum {
>  #define PM800_ALARM			BIT(5)
>  #define PM800_RTC1_USE_XO		BIT(7)
> =20
> +#define PM800_32K_OUTX_SEL_MASK		(0x3)
> +/* 32KHz clk output sel mode */
> +#define PM800_32K_OUTX_SEL_ZERO		(0x0)
> +#define PM800_32K_OUTX_SEL_INT_32KHZ	(0x1)
> +#define PM800_32K_OUTX_SEL_XO_32KHZ	(0x2)
> +#define PM800_32K_OUTX_SEL_HIZ		(0x3)

Why do these need to be in brackets?

>  /* Regulator Control Registers: BUCK1,BUCK5,LDO1 have DVC */
> =20
>  /* buck registers */
> @@ -208,6 +216,10 @@ enum {
>  #define PM800_PMOD_MEAS1		0x52
>  #define PM800_PMOD_MEAS2		0x53
> =20
> +/* Oscillator control */
> +#define PM800_OSC_CNTRL1		(0x50)
> +#define PM800_OSC_CNTRL1_OSC_FREERUN_EN	BIT(1)
> +
>  #define PM800_GPADC0_MEAS1		0x54
>  #define PM800_GPADC0_MEAS2		0x55
>  #define PM800_GPADC1_MEAS1		0x56

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
