From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/1] gpio: drop CONFIG_OF_GPIO in the definition of the
 struct gpio_chip
Date: Mon, 13 Feb 2012 11:37:26 +0100
Message-ID: <20120213103726.GC3378@game.jcrosoft.org>
References: <1329125002-21134-1-git-send-email-plagnioj@jcrosoft.com>
 <4F38E362.6010307@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4F38E362.6010307@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11:18 Mon 13 Feb     , Nicolas Ferre wrote:
> On 02/13/2012 10:23 AM, Jean-Christophe PLAGNIOL-VILLARD :
> > this will allow to avoid the ifdef CONFIG_OF_GPIO in gpio drivers
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> 
> Added devicetree-discuss ml.
> 
> > ---
> >  include/asm-generic/gpio.h |    2 --
> >  1 files changed, 0 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> > index 1ff4e22..c08b758 100644
> > --- a/include/asm-generic/gpio.h
> > +++ b/include/asm-generic/gpio.h
> > @@ -122,7 +122,6 @@ struct gpio_chip {
> >  	unsigned		can_sleep:1;
> >  	unsigned		exported:1;
> >  
> > -#if defined(CONFIG_OF_GPIO)
> >  	/*
> >  	 * If CONFIG_OF is enabled, then all GPIO controllers described in the
> 
> Maybe you will need to rework this comment.
> 
> >  	 * device tree automatically may have an OF translation
> > @@ -131,7 +130,6 @@ struct gpio_chip {
> >  	int of_gpio_n_cells;
> >  	int (*of_xlate)(struct gpio_chip *gc,
> >  		        const struct of_phandle_args *gpiospec, u32 *flags);
> > -#endif
> 
> I do not know if we can remove the ifdef completely of just move of_node
> out of it.
basicaly ifdef on a struct is so so
so yes

Best Regards,
J.
