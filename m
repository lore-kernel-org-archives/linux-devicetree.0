From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 09/22] arm64: dts: qcom: pm8150b: Add Base DTS file
Date: Wed, 14 Aug 2019 10:05:57 -0700
Message-ID: <20190814170557.DB1F52084D@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-10-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-10-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:59)
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/=
qcom/pm8150b.dtsi
> new file mode 100644
> index 000000000000..c0a678b0f159
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +       pm8150@2 {

pmic.

> +               compatible =3D "qcom,spmi-pmic";
> +               reg =3D <0x2 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +       };
> +
> +       qcom,pm8150@3 {

pmic. Funny this one has qcom, prefix!

> +               compatible =3D"qcom,spmi-pmic";
> +               reg =3D <0x3 SPMI_USID>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +       };
> +};
> --=20
> 2.20.1
>=20
