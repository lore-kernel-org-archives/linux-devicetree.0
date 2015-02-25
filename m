From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 6/6] MAINTAINERS: Add phy-miphy28lp.c to ARCH/STI
 architecture
Date: Wed, 25 Feb 2015 15:10:00 +0000
Message-ID: <20150225151000.GD5132@x1>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424871377-1795-7-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 25 Feb 2015, Peter Griffin wrote:

> This patch adds the phy-miphy28lp.c phy driver found on STMicroelectr=
onics
> stih407 family SoC's into the STI arch section of the maintainers fil=
e.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddc5a8c..1a6180a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1457,6 +1457,7 @@ F:	drivers/clocksource/arm_global_timer.c
>  F:	drivers/i2c/busses/i2c-st.c
>  F:	drivers/media/rc/st_rc.c
>  F:	drivers/mmc/host/sdhci-st.c
> +F:	drivers/phy/phy-miphy28lp.c
>  F:	drivers/phy/phy-stih407-usb.c
>  F:	drivers/phy/phy-stih41x-usb.c
>  F:	drivers/pinctrl/pinctrl-st.c

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
