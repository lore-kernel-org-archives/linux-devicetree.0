From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/23] ARM: u300: device tree support for the timer
Date: Fri, 26 Apr 2013 15:38:45 +0200
Message-ID: <CACRpkdbfDwhKA77aUbXhk5sZ0prxR-ic5dntCaAiNjKNBGo_wg@mail.gmail.com>
References: <1366624304-6190-1-git-send-email-linus.walleij@stericsson.com>
 <201304221336.21921.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201304221336.21921.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 22, 2013 at 1:36 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 22 April 2013, Linus Walleij wrote:
>> +#ifdef CONFIG_OF
>> +       struct device_node *timer = NULL;
>> +
>> +       timer = of_find_node_by_path("/timer0@c0014000");
>> +       if (timer) {
>> +               struct resource irq_res;
>> +
>> +               u300_timer_base = of_iomap(timer, 0);
>> +               /* Get the IRQ for the GP1 timer */
>> +               irq = of_irq_to_resource(timer, 2, &irq_res);
>> +       }
>> +#endif
>
> Do you need the #ifdef? The functions should be defined in a way that
> removes this code if CONFIG_OF is not defined.

Actually not, this happens without CONFIG_OF:

  CC      arch/arm/mach-u300/timer.o
/home/elinwal/linux-stericsson/arch/arm/mach-u300/timer.c: In function
'u300_timer_init':
/home/elinwal/linux-stericsson/arch/arm/mach-u300/timer.c:371:2:
error: implicit declaration of function 'of_find_node_by_path'
[-Werror=implicit-function-declaration]
/home/elinwal/linux-stericsson/arch/arm/mach-u300/timer.c:371:8:
warning: assignment makes pointer from integer without a cast [enabled
by default]
/home/elinwal/linux-stericsson/arch/arm/mach-u300/timer.c:377:3:
error: implicit declaration of function 'of_irq_to_resource'
[-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

make[3]: *** [arch/arm/mach-u300/timer.o] Error 1
make[2]: *** [arch/arm/mach-u300] Error 2
make[2]: *** Waiting for unfinished jobs....

Maybe it's just a bug that these don't have the proper stubs in <linux/of.h>?

Or is there a deeper idea behind this? (CC some OF ppl.)

Yours,
Linus Walleij
