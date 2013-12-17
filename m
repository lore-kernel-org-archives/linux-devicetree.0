From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/5] regulator: s5m8767: Add symbols for hard-coded
 DVS_RAMP register
Date: Tue, 17 Dec 2013 13:51:53 +0000
Message-ID: <20131217135153.GI19810@lee--X1>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
 <1387286601-21646-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387286601-21646-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

> Add symbols for hard-coded values of BUCK_RAMP field in DVS_RAMP
> register. This simplifies a little the code as register update is cal=
led
> only once.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/regulator/s5m8767.c         |   22 ++++++++++------------
>  include/linux/mfd/samsung/s5m8767.h |   15 +++++++++++++++
>  2 files changed, 25 insertions(+), 12 deletions(-)

<snip>

> diff --git a/include/linux/mfd/samsung/s5m8767.h b/include/linux/mfd/=
samsung/s5m8767.h
> index 9198377ee859..2ab0b0f03641 100644
> --- a/include/linux/mfd/samsung/s5m8767.h
> +++ b/include/linux/mfd/samsung/s5m8767.h
> @@ -186,4 +186,19 @@ enum s5m8767_regulators {
>  #define S5M8767_ENCTRL_SHIFT		6
>  #define S5M8767_ENCTRL_MASK		(0x3 << S5M8767_ENCTRL_SHIFT)
> =20
> +/*
> + * Values for BUCK_RAMP field in DVS_RAMP register, matching raw val=
ues
> + * in mV/us.
> + */
> +enum s5m8767_dvs_buck_ramp_values {
> +	S5M8767_DVS_BUCK_RAMP_5		=3D 0x4,
> +	S5M8767_DVS_BUCK_RAMP_10	=3D 0x9,
> +	S5M8767_DVS_BUCK_RAMP_12_5	=3D 0xb,
> +	S5M8767_DVS_BUCK_RAMP_25	=3D 0xd,
> +	S5M8767_DVS_BUCK_RAMP_50	=3D 0xe,
> +	S5M8767_DVS_BUCK_RAMP_100	=3D 0xf,
> +};

Why do these have to be enums?

> +#define S5M8767_DVS_BUCK_RAMP_SHIFT	4
> +#define S5M8767_DVS_BUCK_RAMP_MASK	(0xf << S5M8767_DVS_BUCK_RAMP_SHI=
=46T)
> +
>  #endif /* __LINUX_MFD_S5M8767_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
