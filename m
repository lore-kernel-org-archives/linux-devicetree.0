From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] gpio/mxc: get gpio range/base from gpio core
Date: Tue, 5 Jul 2011 11:24:13 -0600
Message-ID: <CACxGe6u-Yk98iRViGM+xDDRQrWBsPPavRVfjAe8VAyP2GQNBqQ@mail.gmail.com>
References: <1309879166-25788-1-git-send-email-shawn.guo@linaro.org>
	<1309879166-25788-2-git-send-email-shawn.guo@linaro.org>
	<20110705165657.GK6069@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110705165657.GK6069-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 5, 2011 at 10:56 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrot=
e:
> On Tue, Jul 05, 2011 at 11:19:24PM +0800, Shawn Guo wrote:
>> Instead of assigning the gpio range based on pdev->id, the patch
>> makes changes to get the range from gpio core that is dynamically
>> allocated.
>>
>> As a result, the uses of pdev->id can be removed from the driver.
>> This will make dt migration of the driver easier.
>>
>> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>> =A0arch/arm/plat-mxc/include/mach/gpio.h | =A0 13 +++++++++----
>> =A0arch/arm/plat-mxc/include/mach/irqs.h | =A0 21 +++------------------
>> =A0drivers/gpio/gpio-mxc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 18 ++++++++=
++--------
>> =A03 files changed, 22 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/arm/plat-mxc/include/mach/gpio.h b/arch/arm/plat-mxc/i=
nclude/mach/gpio.h
>> index 31c820c..abdf5d7 100644
>> --- a/arch/arm/plat-mxc/include/mach/gpio.h
>> +++ b/arch/arm/plat-mxc/include/mach/gpio.h
>> @@ -23,10 +23,15 @@
>> =A0#include <mach/hardware.h>
>> =A0#include <asm-generic/gpio.h>
>>
>> -
>> -/* There's a off-by-one betweem the gpio bank number and the gpiochip */
>> -/* range e.g. GPIO_1_5 is gpio 5 under linux */
>> -#define IMX_GPIO_NR(bank, nr) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(((bank) -=
 1) * 32 + (nr))
>> +/*
>> + * There's a off-by-one betweem the gpio bank number and the gpiochip
>> + * range e.g. GPIO_1_5 is gpio 5 under linux.
>> + *
>> + * When gpio core allocates gpio range for a bank, it starts from the
>> + * end of the total range. =A0That is to say, bank 0 will get a higher
>> + * gpio range than bank 1.
>> + */
>> +#define IMX_GPIO_NR(bank, nr) =A0 =A0 =A0 =A0(ARCH_NR_GPIOS - (bank) * =
32 + (nr))
>
> That is not a good idea. First of all not all boards use this macro.
> This could be fixed, but it is a no go to allocate the gpios dynamically
> and add a macro which makes assumptions on the range which gets
> allocated.

Plus it makes the assumption that the imx gpio controllers will be the
first ones registered, and that the allocation scheme will not change
some time in the future.  You don't actually need to change this
anyway since existing static platform_device registrations can still
use the pdev->id value.  It is only the DT use case that should
dynamically assign the gpio number because all uses in that case can
use a DT gpio specifier instead of a hard coded number.

g.

>
> Sascha
>
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0 =A0=
 =A0|
> Amtsgericht Hildesheim, HRA 2686 =A0 =A0 =A0 =A0 =A0 | Fax: =A0 +49-5121-=
206917-5555 |
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
