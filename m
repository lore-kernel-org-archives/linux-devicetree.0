From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support in tsens driver
Date: Tue, 27 Aug 2019 17:33:44 -0700
Message-ID: <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, agross@kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, marc.w.gonzalez@free.fr, masneyb@onstation.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:03)
> Define two new required properties to define interrupts and
> interrupt-names for tsens.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/D=
ocumentation/devicetree/bindings/thermal/qcom-tsens.txt
> index 673cc1831ee9d..686bede72f846 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> @@ -22,6 +22,8 @@ Required properties:
> =20
>  - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a descripti=
on.
>  - #qcom,sensors: Number of sensors in tsens block
> +- interrupts: Interrupts generated from Always-On subsystem (AOSS)

Is it always one? interrupt-names makes it sound like it.

> +- interrupt-names: Must be one of the following: "uplow", "critical"
>  - Refer to Documentation/devicetree/bindings/nvmem/nvmem.txt to know how=
 to specify
>  nvmem cells
> =20
