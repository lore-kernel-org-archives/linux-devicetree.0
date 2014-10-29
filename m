From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 01/11] irqchip: Allow irq_reg_{readl,writel} to use __raw_{readl_writel}
Date: Wed, 29 Oct 2014 10:36:25 -0700
Message-ID: <54512599.4080500@gmail.com>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <11255905.1JsQYcArO7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11255905.1JsQYcArO7@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Kevin Cernekee <cernekee@gmail.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 10/29/2014 12:43 AM, Arnd Bergmann wrote:
> On Tuesday 28 October 2014 20:58:48 Kevin Cernekee wrote:
>>
>> +#ifdef CONFIG_RAW_IRQ_ACCESSORS
>> +
>> +#ifndef irq_reg_writel
>> +# define irq_reg_writel(val, addr)     __raw_writel(val, addr)
>> +#endif
>> +#ifndef irq_reg_readl
>> +# define irq_reg_readl(addr)           __raw_readl(addr)
>> +#endif
>> +
>> +#else
>> +
> 
> No, this is just wrong: registers almost always have a fixed endianess
> indenpent of CPU endianess, so if you use __raw_writel, it will be
> broken on one or the other.

Our brcmstb platforms had an endian strap settings for MIPS-based
platforms, and for most peripherals this would be just completely
transparent, as the HW always will do the internal swapping, such that
host CPU does read/writes in its native endianess regardless of the
actual strap settings.

AFAICT bcm3384, a MIPS-based Cable Modem platform has only one endianess
setting: BE, and the HW only supports that specific endianess.

> 
> If you have a machine that uses big-endian registers in the interrupt
> controller, you need to find a way to use the correct accessors
> (e.g. iowrite32be) and use them independent of what endianess the CPU
> is running.
> 
> As this code is being used on all sorts of platforms, you can't assume
> that they all use the same endianess, which makes it rather tricky.

I think the more general problem with the use of readl_*() I/O accessors
is that they just happen to work fine on most platforms out there: ARM
Little-endian, because this nicely matches the endianess expected by the
HW and that does not enforce an audit of whether your actual peripheral
expects little-endian writes to be done.

The other problem is that readl() on ARM implies a barrier, which is not
necesarily true/necessary for some other platforms such as some MIPS
processors.

> 
> As the first step, you can probably introduce a new Kconfig symbol
> GENERIC_IRQ_CHIP_BE, and then make that mutually exclusive with the
> existing users that all use little-endian registers:
> 
> #if defined(CONFIG_GENERIC_IRQ_CHIP) && !defined(CONFIG_GENERIC_IRQ_CHIP_BE)
> #define irq_reg_writel(val, addr)     writel(val, addr)
> #else if defined(CONFIG_GENERIC_IRQ_CHIP_BE) && !defined(CONFIG_GENERIC_IRQ_CHIP)
> #define irq_reg_writel(val, addr)     iowrite32be(val, addr)
> #else
> /* provoke a compile error when this is used */
> #define irq_reg_writel(val, addr)	irq_reg_writel_unknown_endian(val, addr)
> #endif
> 
> and
> 
> --- a/kernel/irq/Makefile
> +++ b/kernel/irq/Makefile
> @@ -1,5 +1,6 @@
>  
>  obj-y := irqdesc.o handle.o manage.o spurious.o resend.o chip.o dummychip.o devres.o
> +obj-$(CONFIG_GENERIC_IRQ_CHIP_BE) += generic-chip.o
>  obj-$(CONFIG_GENERIC_IRQ_CHIP) += generic-chip.o
>  obj-$(CONFIG_GENERIC_IRQ_PROBE) += autoprobe.o
>  obj-$(CONFIG_IRQ_DOMAIN) += irqdomain.o
> 
> Note that you might also have a case where you have more than
> one generic irqchip driver built into the kernel, which require
> different endianess. We can't really support that case without
> changing the generic-chip implementation.
> 
> 	Arnd
> 
