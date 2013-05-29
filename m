From: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/8] video: atmel_lcdfb: fix platform data struct
Date: Wed, 29 May 2013 16:36:11 +0200
Message-ID: <CACQ1gAjF5kuu-czkj56-pQdTBUhvY5VodvfnF3RA_DN-O0b9NQ@mail.gmail.com>
References: <20130411145741.GB25242@game.jcrosoft.org>
 <1365692422-9565-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365692422-9565-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?UTF-8?Q?Andreas_Bie=C3=9Fmann?= <biessmann-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans-Christian Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013/4/11 Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>:
> Today we mix pdata and drivers data in the struct atmel_lcdfb_info
> Fix it and introduce a new struct atmel_lcdfb_pdata for platform data only
>
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> Cc: Hans-Christian Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>
> ---
>  arch/arm/mach-at91/at91sam9261_devices.c    |    6 +-
>  arch/arm/mach-at91/at91sam9263_devices.c    |    6 +-
>  arch/arm/mach-at91/at91sam9g45_devices.c    |    6 +-
>  arch/arm/mach-at91/at91sam9rl_devices.c     |    6 +-
>  arch/arm/mach-at91/board-sam9261ek.c        |    6 +-
>  arch/arm/mach-at91/board-sam9263ek.c        |    4 +-
>  arch/arm/mach-at91/board-sam9m10g45ek.c     |    4 +-
>  arch/arm/mach-at91/board-sam9rlek.c         |    4 +-
>  arch/arm/mach-at91/board.h                  |    4 +-
>  arch/avr32/boards/atngw100/evklcd10x.c      |    6 +-
>  arch/avr32/boards/atngw100/mrmt.c           |    4 +-
>  arch/avr32/boards/atstk1000/atstk1000.h     |    2 +-
>  arch/avr32/boards/atstk1000/setup.c         |    2 +-
>  arch/avr32/boards/favr-32/setup.c           |    2 +-
>  arch/avr32/boards/hammerhead/setup.c        |    2 +-
>  arch/avr32/boards/merisc/display.c          |    2 +-
>  arch/avr32/boards/mimc200/setup.c           |    4 +-
>  arch/avr32/mach-at32ap/at32ap700x.c         |    8 +--
>  arch/avr32/mach-at32ap/include/mach/board.h |    4 +-
>  drivers/video/atmel_lcdfb.c                 |  104 +++++++++++++++++----------
>  include/video/atmel_lcdc.h                  |   24 +------
>  21 files changed, 109 insertions(+), 101 deletions(-)
>
[snip]
> diff --git a/drivers/video/atmel_lcdfb.c b/drivers/video/atmel_lcdfb.c
> index c1a2914..98733cd4 100644
> --- a/drivers/video/atmel_lcdfb.c
> +++ b/drivers/video/atmel_lcdfb.c
> @@ -20,12 +20,45 @@
>  #include <linux/gfp.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/atmel.h>
> +#include <video/of_display_timing.h>
>
>  #include <mach/cpu.h>
>  #include <asm/gpio.h>
>
>  #include <video/atmel_lcdc.h>
>
> +struct atmel_lcdfb_config {
> +       bool have_alt_pixclock;
> +       bool have_hozval;
> +       bool have_intensity_bit;
> +};
> +
> + /* LCD Controller info data structure, stored in device platform_data */
> +struct atmel_lcdfb_info {
> +       spinlock_t              lock;
> +       struct fb_info          *info;
> +       void __iomem            *mmio;
> +       int                     irq_base;
> +       struct work_struct      task;
> +
> +       unsigned int            smem_len;
> +       struct platform_device  *pdev;
> +       struct clk              *bus_clk;
> +       struct clk              *lcdc_clk;
> +
> +       struct backlight_device *backlight;
> +       u8                      bl_power;
> +       bool                    lcdcon_pol_negative;
I think lcdcon_pol_negative should be part of pdata, because it really
depends on how the PWM is wired on the board.


Regards,
Richard.
