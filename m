From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/8] video: atmel_lcdfb: fix platform data struct
Date: Wed, 29 May 2013 19:35:38 +0200
Message-ID: <20130529173538.GC23899@game.jcrosoft.org>
References: <20130411145741.GB25242@game.jcrosoft.org>
 <1365692422-9565-1-git-send-email-plagnioj@jcrosoft.com>
 <CACQ1gAjF5kuu-czkj56-pQdTBUhvY5VodvfnF3RA_DN-O0b9NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACQ1gAjF5kuu-czkj56-pQdTBUhvY5VodvfnF3RA_DN-O0b9NQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: linux-fbdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Andreas =?iso-8859-1?Q?Bie=DFmann?= <biessmann@corscience.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>
List-Id: devicetree@vger.kernel.org

On 16:36 Wed 29 May     , Richard Genoud wrote:
> 2013/4/11 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>:
> > Today we mix pdata and drivers data in the struct atmel_lcdfb_info
> > Fix it and introduce a new struct atmel_lcdfb_pdata for platform data only
> >
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
> > ---
> >  arch/arm/mach-at91/at91sam9261_devices.c    |    6 +-
> >  arch/arm/mach-at91/at91sam9263_devices.c    |    6 +-
> >  arch/arm/mach-at91/at91sam9g45_devices.c    |    6 +-
> >  arch/arm/mach-at91/at91sam9rl_devices.c     |    6 +-
> >  arch/arm/mach-at91/board-sam9261ek.c        |    6 +-
> >  arch/arm/mach-at91/board-sam9263ek.c        |    4 +-
> >  arch/arm/mach-at91/board-sam9m10g45ek.c     |    4 +-
> >  arch/arm/mach-at91/board-sam9rlek.c         |    4 +-
> >  arch/arm/mach-at91/board.h                  |    4 +-
> >  arch/avr32/boards/atngw100/evklcd10x.c      |    6 +-
> >  arch/avr32/boards/atngw100/mrmt.c           |    4 +-
> >  arch/avr32/boards/atstk1000/atstk1000.h     |    2 +-
> >  arch/avr32/boards/atstk1000/setup.c         |    2 +-
> >  arch/avr32/boards/favr-32/setup.c           |    2 +-
> >  arch/avr32/boards/hammerhead/setup.c        |    2 +-
> >  arch/avr32/boards/merisc/display.c          |    2 +-
> >  arch/avr32/boards/mimc200/setup.c           |    4 +-
> >  arch/avr32/mach-at32ap/at32ap700x.c         |    8 +--
> >  arch/avr32/mach-at32ap/include/mach/board.h |    4 +-
> >  drivers/video/atmel_lcdfb.c                 |  104 +++++++++++++++++----------
> >  include/video/atmel_lcdc.h                  |   24 +------
> >  21 files changed, 109 insertions(+), 101 deletions(-)
> >
> [snip]
> > diff --git a/drivers/video/atmel_lcdfb.c b/drivers/video/atmel_lcdfb.c
> > index c1a2914..98733cd4 100644
> > --- a/drivers/video/atmel_lcdfb.c
> > +++ b/drivers/video/atmel_lcdfb.c
> > @@ -20,12 +20,45 @@
> >  #include <linux/gfp.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_data/atmel.h>
> > +#include <video/of_display_timing.h>
> >
> >  #include <mach/cpu.h>
> >  #include <asm/gpio.h>
> >
> >  #include <video/atmel_lcdc.h>
> >
> > +struct atmel_lcdfb_config {
> > +       bool have_alt_pixclock;
> > +       bool have_hozval;
> > +       bool have_intensity_bit;
> > +};
> > +
> > + /* LCD Controller info data structure, stored in device platform_data */
> > +struct atmel_lcdfb_info {
> > +       spinlock_t              lock;
> > +       struct fb_info          *info;
> > +       void __iomem            *mmio;
> > +       int                     irq_base;
> > +       struct work_struct      task;
> > +
> > +       unsigned int            smem_len;
> > +       struct platform_device  *pdev;
> > +       struct clk              *bus_clk;
> > +       struct clk              *lcdc_clk;
> > +
> > +       struct backlight_device *backlight;
> > +       u8                      bl_power;
> > +       bool                    lcdcon_pol_negative;
> I think lcdcon_pol_negative should be part of pdata, because it really
> depends on how the PWM is wired on the board.
> 

maybe but no one mainline use it on any pdata for non-dt boars
so I did not want to expose it

Best Regatgards,
J.
> 
> Regards,
> Richard.
