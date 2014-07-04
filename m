From: pramod gurav <pramod.gurav.etc@gmail.com>
Subject: Re: [PATCH v3 2/3] soc: qcom-rpm: Driver for the Qualcomm RPM
Date: Fri, 4 Jul 2014 11:46:44 +0530
Message-ID: <CAMf-jSkvfE8miYk_JtTkEUd3AE-ze9E-1c3ourgbEm_SOkAPKw@mail.gmail.com>
References: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1402944372-31901-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1402944372-31901-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Tue, Jun 17, 2014 at 12:16 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> Driver for the Resource Power Manager (RPM) found in Qualcomm 8660, 8960
> and 8064 based devices. The driver exposes resources that child drivers
> can operate on; to implementing regulator, clock and bus frequency
> drivers.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  drivers/soc/qcom/Kconfig     |  14 ++
>  drivers/soc/qcom/Makefile    |   1 +
>  drivers/soc/qcom/qcom_rpm.c  | 573 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom_rpm.h |  12 +
>  4 files changed, 600 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom_rpm.c
>  create mode 100644 include/linux/soc/qcom_rpm.h
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 7bd2c94..a8c2a96 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -9,3 +9,17 @@ config QCOM_GSBI
>            functions for connecting the underlying serial UART, SPI, and I2C
>            devices to the output pins.
>
> +config QCOM_RPM
> +       tristate "Qualcomm Resource Power Manager (RPM)"
> +       depends on ARCH_QCOM && OF
> +       help
> +         If you say yes to this option, support will be included for the
> +         Resource Power Manager system found in the Qualcomm 8660, 8960 and
> +         8064 based devices.
> +
> +         This is required to access many regulators, clocks and bus
> +         frequencies controlled by the RPM on these devices.
> +
> +         Say M here if you want to include support for the Qualcomm RPM as a
> +         module. This will build a module called "qcom_rpm".
> +
Adds extra line EOF here.

> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 4389012..e7706e8 100644
> --- a/drivers/soc/qcom/Makefile


br,
Pramod
