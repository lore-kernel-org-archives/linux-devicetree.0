From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/3] ARM: bcm281xx: Enable GPIO driver
Date: Thu, 29 Aug 2013 20:40:41 +0200
Message-ID: <CACRpkdbWnzcgjRZnUj5x6a42SZc2+fr5etT3_Z9zqjTz+qQB5A@mail.gmail.com>
References: <1377728173-30711-1-git-send-email-markus.mayer@linaro.org>
 <1377728173-30711-3-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377728173-30711-3-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2013 at 12:16 AM, Markus Mayer <markus.mayer@linaro.org> wrote:

> This patch adds the Kconfig and Makefile glue to compile the GPIO
> driver for bcm281xx when CONFIG_GPIO_BCM=y.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>
(...)

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b2450ba..b68e9b5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -714,6 +714,11 @@ config GPIO_MSIC
>           Enable support for GPIO on intel MSIC controllers found in
>           intel MID devices
>
> +config GPIO_BCM_KONA
> +       bool "Broadcom Kona GPIO"
> +       help
> +         Turn on GPIO support for Broadcom "Kona" chips.
> +
>  comment "USB GPIO expanders:"
>
>  config GPIO_VIPERBOARD
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ef3e983..fcd0751 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_GPIO_ADP5520)    += gpio-adp5520.o
>  obj-$(CONFIG_GPIO_ADP5588)     += gpio-adp5588.o
>  obj-$(CONFIG_GPIO_AMD8111)     += gpio-amd8111.o
>  obj-$(CONFIG_GPIO_ARIZONA)     += gpio-arizona.o
> +obj-$(CONFIG_GPIO_BCM_KONA)    += gpio-bcm-kona.o
>  obj-$(CONFIG_GPIO_BT8XX)       += gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CLPS711X)    += gpio-clps711x.o
>  obj-$(CONFIG_GPIO_CS5535)      += gpio-cs5535.o

Move these two hunks of the patch over to patch 1.

I prefer to have the driver added along with the Kconfig and
Makefile changes.

Yours,
Linus Walleij
