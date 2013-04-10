From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] watchdog: Revert the AT91RM9200_WATCHDOG dependency
Date: Wed, 10 Apr 2013 06:41:56 -0700
Message-ID: <20130410134156.GA15456@roeck-us.net>
References: <20130409202711.GG7867@spo001.leaseweb.com>
 <1365597382-15455-1-git-send-email-nicolas.ferre@atmel.com>
 <20130410133351.GA7295@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130410133351.GA7295-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
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
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 10, 2013 at 06:33:51AM -0700, Guenter Roeck wrote:
> On Wed, Apr 10, 2013 at 02:36:22PM +0200, Nicolas Ferre wrote:
> > Compiling the at91rm9200_wdt.c driver without at91rm9200
> > support was leading to several errors:
> > 
> > drivers/built-in.o: In function `at91_wdt_close':
> > at91_adc.c:(.text+0xc9fe4): undefined reference to `at91_st_base'
> > drivers/built-in.o: In function `at91_wdt_write':
> > at91_adc.c:(.text+0xca004): undefined reference to `at91_st_base'
> > drivers/built-in.o: In function `at91wdt_shutdown':
> > at91_adc.c:(.text+0xca01c): undefined reference to `at91_st_base'
> > drivers/built-in.o: In function `at91wdt_suspend':
> > at91_adc.c:(.text+0xca038): undefined reference to `at91_st_base'
> > drivers/built-in.o: In function `at91_wdt_open':
> > at91_adc.c:(.text+0xca0cc): undefined reference to `at91_st_base'
> > drivers/built-in.o:at91_adc.c:(.text+0xca2c8): more undefined references to
> > `at91_st_base' follow
> > 
> > So, reverting the modification of the "depends" Kconfig line
> > introduced by patch a6a1bcd37 (watchdog: at91rm9200: add DT support)
> > seems to be the good solution.
> > 
> Really ? Why ? I mean, this was supposed to be for at91rm9200, wasn't it ?
> And why would want try to compile a watchdog for at91rm9200 without at91rm9200
> support ?
> 
> I understand there is a problem, I just don't see how removing that line would
> solve it.
> 
Me confused, sorry. I somehow thought you were removing the ARCH_AT91RM9200
dependency, not adding it.

Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Guenter
