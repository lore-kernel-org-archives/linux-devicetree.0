From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 06/13] ARM: multi_v7_defconfig: Enable stih407 usb picophy
Date: Mon, 10 Nov 2014 10:28:00 +0000
Message-ID: <20141110102800.GQ21424@x1>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415361475-6218-7-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014, Peter Griffin wrote:

> This patch enables the picoPHY usb phy which is used by
> the usb2 and usb3 host controllers when controlling usb2/1.1
> devices. It is found in stih407 family SoC's from STMicroelectronics.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/m=
ulti_v7_defconfig
> index e13ab7e..ac7b536 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -427,6 +427,7 @@ CONFIG_OMAP_USB2=3Dy
>  CONFIG_TI_PIPE3=3Dy
>  CONFIG_PHY_MIPHY365X=3Dy
>  CONFIG_PHY_STIH41X_USB=3Dy
> +CONFIG_PHY_STIH407_USB=3Dy
>  CONFIG_PHY_SUN4I_USB=3Dy
>  CONFIG_EXT4_FS=3Dy
>  CONFIG_VFAT_FS=3Dy

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
