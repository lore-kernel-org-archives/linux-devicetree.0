From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Thu, 29 May 2014 17:54:37 +0100
Message-ID: <20140529165437.GM1954@lee--X1>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1401211721-19712-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401211721-19712-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Add binding for the Qualcomm Resource Power Manager (RPM) found in 86=
60, 8960
> and 8064 based devices. The binding currently describes the rpm itsel=
f and the
> regulator subnodes.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,rpm.txt | 284 +++++++++++=
++++++++++
>  include/dt-bindings/mfd/qcom_rpm.h                 | 142 +++++++++++
>  2 files changed, 426 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,rpm.tx=
t
>  create mode 100644 include/dt-bindings/mfd/qcom_rpm.h

[...]

> diff --git a/include/dt-bindings/mfd/qcom_rpm.h b/include/dt-bindings=
/mfd/qcom_rpm.h
> new file mode 100644
> index 0000000..277e789
> --- /dev/null
> +++ b/include/dt-bindings/mfd/qcom_rpm.h
> @@ -0,0 +1,142 @@
> +/*
> + * This header provides constants for the Qualcomm RPM bindings.
> + */

Proper header please.

> +#ifndef _DT_BINDINGS_MFD_QCOM_RPM_H
> +#define _DT_BINDINGS_MFD_QCOM_RPM_H
> +
> +#define QCOM_RPM_APPS_FABRIC_ARB		1
> +#define QCOM_RPM_APPS_FABRIC_CLK		2
> +#define QCOM_RPM_APPS_FABRIC_HALT		3

[...]

> +#define QCOM_RPM_SYS_FABRIC_MODE		131
> +#define QCOM_RPM_USB_OTG_SWITCH		132
> +#define QCOM_RPM_VDDMIN_GPIO			133

Are you sure you don't want these in 0xXY format?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
