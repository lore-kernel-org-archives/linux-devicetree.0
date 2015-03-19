From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: devicetree: qcom_rpm: document IPQ8064 resources
Date: Thu, 19 Mar 2015 10:04:37 +0000
Message-ID: <20150319100437.GZ3318@x1>
References: <1416512485-7292-1-git-send-email-joshc@codeaurora.org>
 <1416512485-7292-2-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1416512485-7292-2-git-send-email-joshc@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 20 Nov 2014, Josh Cartwright wrote:

> The IPQ8064 SoC has several RPM-controlled resources, an NSS fabrick
> clock and four regulator resources.  Provide definitions for them.
>=20
> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 6 +++++-
>  include/dt-bindings/mfd/qcom-rpm.h                 | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)

Applied with Stephen's Ack.

> diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/Doc=
umentation/devicetree/bindings/mfd/qcom-rpm.txt
> index 4264021..6d4e3ec 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> @@ -12,6 +12,7 @@ frequencies.
>  		    "qcom,rpm-apq8064"
>  		    "qcom,rpm-msm8660"
>  		    "qcom,rpm-msm8960"
> +		    "qcom,rpm-ipq8064"
> =20
>  - reg:
>  	Usage: required
> @@ -67,6 +68,7 @@ of valid subnodes that can operate on these resourc=
es.
>  		    "qcom,rpm-pm8901-ftsmps"
>  		    "qcom,rpm-pm8921-smps"
>  		    "qcom,rpm-pm8921-ftsmps"
> +		    "qcom,rpm-smb208"
> =20
>  - reg:
>  	Usage: required
> @@ -76,7 +78,9 @@ of valid subnodes that can operate on these resourc=
es.
>  		    QCOM_RPM_PM8058_SMPS0 - QCOM_RPM_PM8058_SMPS4,
>  		    QCOM_RPM_PM8821_SMPS1 - QCOM_RPM_PM8821_SMPS2,
>  		    QCOM_RPM_PM8901_SMPS0 - QCOM_RPM_PM8901_SMPS4,
> -		    QCOM_RPM_PM8921_SMPS1 - QCOM_RPM_PM8921_SMPS8
> +		    QCOM_RPM_PM8921_SMPS1 - QCOM_RPM_PM8921_SMPS8,
> +		    QCOM_RPM_SMB208_S1a, QCOM_RPM_SMB208_S1b,
> +		    QCOM_RPM_SMB208_S2a, QCOM_RPM_SMB208_S2b
> =20
>  - bias-pull-down:
>  	Usage: optional
> diff --git a/include/dt-bindings/mfd/qcom-rpm.h b/include/dt-bindings=
/mfd/qcom-rpm.h
> index 388a6f3..13a9d4b 100644
> --- a/include/dt-bindings/mfd/qcom-rpm.h
> +++ b/include/dt-bindings/mfd/qcom-rpm.h
> @@ -141,6 +141,12 @@
>  #define QCOM_RPM_SYS_FABRIC_MODE		131
>  #define QCOM_RPM_USB_OTG_SWITCH			132
>  #define QCOM_RPM_VDDMIN_GPIO			133
> +#define QCOM_RPM_NSS_FABRIC_0_CLK		134
> +#define QCOM_RPM_NSS_FABRIC_1_CLK		135
> +#define QCOM_RPM_SMB208_S1a			136
> +#define QCOM_RPM_SMB208_S1b			137
> +#define QCOM_RPM_SMB208_S2a			138
> +#define QCOM_RPM_SMB208_S2b			139
> =20
>  /*
>   * Constants used to select force mode for regulators.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
