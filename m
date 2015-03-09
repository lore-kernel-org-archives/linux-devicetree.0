From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v12 07/19] mfd: max77693: add TORCH_IOUT_MASK macro
Date: Mon, 9 Mar 2015 09:36:11 +0000
Message-ID: <20150309093611.GH3427@x1>
References: <1425485680-8417-1-git-send-email-j.anaszewski@samsung.com>
 <1425485680-8417-8-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425485680-8417-8-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, 04 Mar 2015, Jacek Anaszewski wrote:

> Add a macro for obtaining the mask of ITORCH register bit fields
> related either to FLED1 or FLED2 current output. The expected
> arguments are TORCH_IOUT1_SHIFT or TORCH_IOUT2_SHIFT.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/mfd/max77693-private.h |    1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

> diff --git a/include/linux/mfd/max77693-private.h b/include/linux/mfd=
/max77693-private.h
> index 955dd99..8770ce1 100644
> --- a/include/linux/mfd/max77693-private.h
> +++ b/include/linux/mfd/max77693-private.h
> @@ -87,6 +87,7 @@ enum max77693_pmic_reg {
>  /* MAX77693 ITORCH register */
>  #define TORCH_IOUT1_SHIFT	0
>  #define TORCH_IOUT2_SHIFT	4
> +#define TORCH_IOUT_MASK(x)	(0xf << (x))
>  #define TORCH_IOUT_MIN		15625
>  #define TORCH_IOUT_MAX		250000
>  #define TORCH_IOUT_STEP		15625

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
