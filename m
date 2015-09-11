From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 9/9] ARM: multi_v7_defconfig: Enable STi FDMA driver
Date: Fri, 11 Sep 2015 17:22:15 +0100
Message-ID: <20150911162215.GB18779@x1>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-10-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441980871-24475-10-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, robh+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This DMA controller is found on all STi chipsets.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/m=
ulti_v7_defconfig
> index 5fd8df6..ce3c8c1 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -587,6 +587,7 @@ CONFIG_IMX_DMA=3Dy
>  CONFIG_MXS_DMA=3Dy
>  CONFIG_DMA_OMAP=3Dy
>  CONFIG_XILINX_VDMA=3Dy
> +CONFIG_ST_FDMA=3Dy
>  CONFIG_STAGING=3Dy
>  CONFIG_SENSORS_ISL29018=3Dy
>  CONFIG_SENSORS_ISL29028=3Dy

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
