From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 02/10] regulator: add support for SY8106A regulator
Date: Fri, 30 Mar 2018 16:03:20 +0800
Message-ID: <CAGb2v64_FhwZQCNeCa1G6bGM_mszc2BmECP+z4rKjrLB2+awmg@mail.gmail.com>
References: <20180206044905.30508-1-icenowy@aosc.io> <20180206044905.30508-3-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBYG667KQKGQEHTT2KEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180206044905.30508-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 6, 2018 at 12:48 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> SY8106A is an I2C attached single output regulator made by Silergy Corp,
> which is used on several Allwinner H3/H5 SBCs to control the power
> supply of the ARM cores.
>
> Add a driver for it.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> [Icenowy: Change commit message, remove enable/disable code, add default
>  ramp_delay, add comment for go bit]
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v2:
> - Dropped the enable/disable code.
> - Added default ramp_delay value.
> - Added comment for the "go bit".
>
>  drivers/regulator/Kconfig             |   8 +-
>  drivers/regulator/Makefile            |   2 +-
>  drivers/regulator/sy8106a-regulator.c | 168 ++++++++++++++++++++++++++++++++++
>  3 files changed, 176 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/regulator/sy8106a-regulator.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index b27417ca188a..70227230bca2 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -792,6 +792,13 @@ config REGULATOR_STW481X_VMMC
>           This driver supports the internal VMMC regulator in the STw481x
>           PMIC chips.
>
> +config REGULATOR_SY8106A
> +       tristate "Silergy SY8106A regulator"
> +       depends on I2C && (OF || COMPILE_TEST)
> +       select REGMAP_I2C
> +       help
> +         This driver supports SY8106A single output regulator.
> +
>  config REGULATOR_TPS51632
>         tristate "TI TPS51632 Power Regulator"
>         depends on I2C
> @@ -966,4 +973,3 @@ config REGULATOR_WM8994
>           WM8994 CODEC.
>
>  endif
> -
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 19fea09ba10a..7564664c64df 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
>  obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
>  obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
>  obj-$(CONFIG_REGULATOR_STW481X_VMMC) += stw481x-vmmc.o
> +obj-$(CONFIG_REGULATOR_SY8106A) += sy8106a-regulator.o
>  obj-$(CONFIG_REGULATOR_TI_ABB) += ti-abb-regulator.o
>  obj-$(CONFIG_REGULATOR_TPS6105X) += tps6105x-regulator.o
>  obj-$(CONFIG_REGULATOR_TPS62360) += tps62360-regulator.o
> @@ -124,5 +125,4 @@ obj-$(CONFIG_REGULATOR_WM8350) += wm8350-regulator.o
>  obj-$(CONFIG_REGULATOR_WM8400) += wm8400-regulator.o
>  obj-$(CONFIG_REGULATOR_WM8994) += wm8994-regulator.o
>
> -

Extra whitespace change. Otherwise,

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

>  ccflags-$(CONFIG_REGULATOR_DEBUG) += -DDEBUG
