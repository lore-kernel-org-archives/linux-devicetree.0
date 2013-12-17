From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/5] regulator: s5m8767: Do not use sec_reg* regmap
 helpers
Date: Tue, 17 Dec 2013 15:03:28 +0000
Message-ID: <20131217150328.GB32283@lee--X1>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
 <1387286601-21646-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387286601-21646-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Dec 2013, Krzysztof Kozlowski wrote:

> Replace calls to sec_reg* helpers with direct usage of regmap API. Th=
e
> sec_reg* helpers are error-prone as they mix u8 with unsigned int and
> order of some of parameters (val and mask in sec_reg_update()).
>=20
> Also the helpers do not give any way of useful abstraction as they ju=
st
> call corresponding regmap function.
>=20
> This patch replaces:
>  - sec_reg_read() with regmap_read(),
>  - sec_reg_write() with regmap_write(),
>  - sec_reg_update() with regmap_update_bits().
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/regulator/s5m8767.c |   71 +++++++++++++++++++++++++--------=
----------
>  1 file changed, 41 insertions(+), 30 deletions(-)
>=20

Mark,

As this is heavily reliant on the previous patch, feel free to
take it through the Regulator tree.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
