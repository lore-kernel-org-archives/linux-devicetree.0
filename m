From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v2 5/7] ARM: of: introduce common routine for DMA
 configuration
Date: Fri, 28 Feb 2014 10:06:25 -0500
Message-ID: <5310A5F1.9070901@ti.com>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
 <1393535872-20915-6-git-send-email-santosh.shilimkar@ti.com>
 <9618080.kpE3Kl6X8p@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9618080.kpE3Kl6X8p@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, linus.walleij@linaro.org, magnus.damm@gmail.com, Olof Johansson <olof@lixom.net>, robh+dt@kernel.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 28 February 2014 05:00 AM, Arnd Bergmann wrote:
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> > index 404d1da..97d5533 100644
>> > --- a/drivers/of/platform.c
>> > +++ b/drivers/of/platform.c
>> > @@ -213,10 +213,13 @@ static struct platform_device *of_platform_device_create_pdata(
>> >  
>> >  #if defined(CONFIG_MICROBLAZE)
>> >  	dev->archdata.dma_mask = 0xffffffffUL;
>> > -#endif
>> > +#elif defined(CONFIG_ARM_LPAE)
>> > +	arm_dt_dma_configure(&dev->dev);
>> > +#else
>> >  	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>> >  	if (!dev->dev.dma_mask)
>> >  		dev->dev.dma_mask = &dev->dev.coherent_dma_mask;
>> > +#endif
> The dependency on CONFIG_ARM_LPAE is not correct the general case,
> that would be a special case on keystone. I'd suggest using
> CONFIG_ARM here, and finding a different way to return false
> for dma_is_coherent() on keystone with LPAE disabled.
> 
I made that LPAE specific assuming the 32 machines anyway are
happy with default as they are today. We can keep CONFIG_ARM
and handle the special case in machine platform notifier.

Regards,
Santosh
