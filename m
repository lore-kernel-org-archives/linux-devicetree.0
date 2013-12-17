From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/5] regulator: s5m8767: Use GPIO for controlling
 Buck9/eMMC
Date: Tue, 17 Dec 2013 13:49:28 +0000
Message-ID: <20131217134928.GH19810@lee--X1>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
 <1387286601-21646-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387286601-21646-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Dec 2013, Krzysztof Kozlowski wrote:

> Add support for GPIO control (enable/disable) over Buck9. The Buck9
> Converter is used as a supply for eMMC Host Controller.
>=20
> BUCK9EN GPIO of S5M8767 chip may be used by application processor to
> enable or disable the Buck9. This has two benefits:
>  - It is faster than toggling it over I2C bus.
>  - It allows disabling the regulator during suspend to RAM; The AP wi=
ll
>    enable it during resume; Without the patch the regulator supplying
>    eMMC must be defined as fixed-regulator.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/regulator/s5m8767.c         |  120 +++++++++++++++++++++++++=
+++++++++-
>  include/linux/mfd/samsung/core.h    |    2 +
>  include/linux/mfd/samsung/s5m8767.h |    7 ++

So long as they fit in with the rest of the changes, the MFD adaptions
look fine to me:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
