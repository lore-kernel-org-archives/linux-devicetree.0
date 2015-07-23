From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH-v2 2/2] regulator: 88pm800: Add support for configuration
 of dual phase on BUCK1
Date: Thu, 23 Jul 2015 16:54:32 +0100
Message-ID: <20150723155432.GV3436@x1>
References: <1437495782-15767-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1437495782-15767-3-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437495782-15767-3-git-send-email-vaibhav.hiremath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jul 2015, Vaibhav Hiremath wrote:

> 88PM860 device supports dual phase mode on BUCK1 output.
> In normal usecase, BUCK1A and BUCK1B operates independently with 3A
> capacity. And they both can work as a dual phase providing 6A capacit=
y.
>=20
> This patch updates the regulator driver to read the respective
> DT property and enable dual-phase mode on BUCK1.
>=20
> Note that, this is init time (one time) initialization.
>=20
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
> ---
>  drivers/regulator/88pm800.c | 31 +++++++++++++++++++++++++++++++
>  include/linux/mfd/88pm80x.h |  3 +++
>  2 files changed, 34 insertions(+)

[...]

> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.=
h
> index a92d173..05d9bad 100644
> --- a/include/linux/mfd/88pm80x.h
> +++ b/include/linux/mfd/88pm80x.h
> @@ -295,6 +295,9 @@ enum {
>  #define PM860_BUCK4_MISC2		(0x82)
>  #define PM860_BUCK4_FULL_DRV		BIT(2)
> =20
> +#define PM860_BUCK1_MISC		(0x8E)

Why the over-bracketing?

> +#define BUCK1_DUAL_PHASE_SEL		BIT(2)
> +
>  struct pm80x_rtc_pdata {
>  	int		vrtc;
>  	int		rtc_wakeup;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
