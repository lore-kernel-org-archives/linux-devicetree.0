From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 12/22] arm64: dts: qcom: pm8150l: Add Base DTS file
Date: Wed, 14 Aug 2019 10:10:14 -0700
Message-ID: <20190814171014.DA226208C2@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-13-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-13-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:02)
> PMIC pm8150l is a slave pmic and this adds base DTS file for pm8150l
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150l.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/=
qcom/pm8150l.dtsi
> new file mode 100644
> index 000000000000..e61ae6c6dab5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +       qcom,pm8150@4 {

pmic

> +               compatible =3D "qcom,spmi-pmic";

Update compatible string too.

> +               reg =3D <0x4 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +       };
> +
> +       qcom,pm8150@5 {
> +               compatible =3D"qcom,spmi-pmic";
> +               reg =3D <0x5 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +       };
> +};
