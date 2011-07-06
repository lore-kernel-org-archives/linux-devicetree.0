From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v2 1/3] gpio/mxc: get gpio range/base from gpio core
Date: Wed, 6 Jul 2011 21:00:04 +0800
Message-ID: <20110706130004.GB4034@S2100-06.ap.freescale.net>
References: <1309879166-25788-1-git-send-email-shawn.guo@linaro.org>
	<1309879166-25788-2-git-send-email-shawn.guo@linaro.org>
	<20110705165657.GK6069@pengutronix.de>
	<CACxGe6u-Yk98iRViGM+xDDRQrWBsPPavRVfjAe8VAyP2GQNBqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6u-Yk98iRViGM+xDDRQrWBsPPavRVfjAe8VAyP2GQNBqQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2011 at 11:24:13AM -0600, Grant Likely wrote:
> On Tue, Jul 5, 2011 at 10:56 AM, Sascha Hauer <s.hauer@pengutronix.de> wr=
ote:
> > On Tue, Jul 05, 2011 at 11:19:24PM +0800, Shawn Guo wrote:
> >> Instead of assigning the gpio range based on pdev->id, the patch
> >> makes changes to get the range from gpio core that is dynamically
> >> allocated.
> >>
> >> As a result, the uses of pdev->id can be removed from the driver.
> >> This will make dt migration of the driver easier.
> >>
> >> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> >> Cc: Grant Likely <grant.likely@secretlab.ca>
> >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >> ---
> >> =A0arch/arm/plat-mxc/include/mach/gpio.h | =A0 13 +++++++++----
> >> =A0arch/arm/plat-mxc/include/mach/irqs.h | =A0 21 +++------------------
> >> =A0drivers/gpio/gpio-mxc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 18 ++++++=
++++--------
> >> =A03 files changed, 22 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/arch/arm/plat-mxc/include/mach/gpio.h b/arch/arm/plat-mxc=
/include/mach/gpio.h
> >> index 31c820c..abdf5d7 100644
> >> --- a/arch/arm/plat-mxc/include/mach/gpio.h
> >> +++ b/arch/arm/plat-mxc/include/mach/gpio.h
> >> @@ -23,10 +23,15 @@
> >> =A0#include <mach/hardware.h>
> >> =A0#include <asm-generic/gpio.h>
> >>
> >> -
> >> -/* There's a off-by-one betweem the gpio bank number and the gpiochip=
 */
> >> -/* range e.g. GPIO_1_5 is gpio 5 under linux */
> >> -#define IMX_GPIO_NR(bank, nr) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(((bank)=
 - 1) * 32 + (nr))
> >> +/*
> >> + * There's a off-by-one betweem the gpio bank number and the gpiochip
> >> + * range e.g. GPIO_1_5 is gpio 5 under linux.
> >> + *
> >> + * When gpio core allocates gpio range for a bank, it starts from the
> >> + * end of the total range. =A0That is to say, bank 0 will get a higher
> >> + * gpio range than bank 1.
> >> + */
> >> +#define IMX_GPIO_NR(bank, nr) =A0 =A0 =A0 =A0(ARCH_NR_GPIOS - (bank) =
* 32 + (nr))
> >
> > That is not a good idea. First of all not all boards use this macro.
> > This could be fixed, but it is a no go to allocate the gpios dynamically
> > and add a macro which makes assumptions on the range which gets
> > allocated.
> =

> Plus it makes the assumption that the imx gpio controllers will be the
> first ones registered, and that the allocation scheme will not change
> some time in the future.  You don't actually need to change this
> anyway since existing static platform_device registrations can still
> use the pdev->id value.  It is only the DT use case that should
> dynamically assign the gpio number because all uses in that case can
> use a DT gpio specifier instead of a hard coded number.
> =

Yeah, right.  Will drop all the changes in this patch but except the
following lines.

-----8<-------------
-/* these are ordered by size to support multi-SoC kernels */
-#if defined CONFIG_SOC_IMX53
-#define MXC_GPIO_IRQS          (32 * 7)
-#elif defined CONFIG_ARCH_MX2
-#define MXC_GPIO_IRQS          (32 * 6)
-#elif defined CONFIG_SOC_IMX50
-#define MXC_GPIO_IRQS          (32 * 6)
-#elif defined CONFIG_ARCH_MX1
-#define MXC_GPIO_IRQS          (32 * 4)
-#elif defined CONFIG_ARCH_MX25
-#define MXC_GPIO_IRQS          (32 * 4)
-#elif defined CONFIG_SOC_IMX51
-#define MXC_GPIO_IRQS          (32 * 4)
-#elif defined CONFIG_ARCH_MX3
-#define MXC_GPIO_IRQS          (32 * 3)
-#endif
-
 /*
  * The next 16 interrupts are for board specific purposes.  Since
  * the kernel can only run on one machine at a time, we can re-use
  * these.  If you need more, increase MXC_BOARD_IRQS, but keep it
  * within sensible limits.
  */
-#define MXC_BOARD_IRQ_START    (MXC_INTERNAL_IRQS + MXC_GPIO_IRQS)
+#define MXC_BOARD_IRQ_START    (MXC_INTERNAL_IRQS + ARCH_NR_GPIOS)
---------------------

I have to keep above changes not only because it makes code a little
bit cleaner, but also it's needed to get dt irq work, as dt code
gets gpio range from gpio core which dynamically allocates number
from ARCH_NR_GPIOS to 0.

-- =

Regards,
Shawn
