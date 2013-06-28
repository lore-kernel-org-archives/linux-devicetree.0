From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] of: Specify initrd location using 64-bit
Date: Fri, 28 Jun 2013 15:49:31 +0200
Message-ID: <20130628134931.GD21034@game.jcrosoft.org>
References: <1371775956-16453-1-git-send-email-santosh.shilimkar@ti.com>
 <51C4171C.9050908@linutronix.de> <51C48B5A.2040404@ti.com>
 <51CCA67C.2010803@gmail.com>
 <CACxGe6vOH0sCFVVXrYqD3dbYdOvithVu7-d1cvy5885i8x_Myw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vOH0sCFVVXrYqD3dbYdOvithVu7-d1cvy5885i8x_Myw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mips <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>Santosh Shilimkar <s>
List-Id: devicetree@vger.kernel.org

On 10:59 Fri 28 Jun     , Grant Likely wrote:
> On Thu, Jun 27, 2013 at 9:54 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 06/21/2013 12:20 PM, Santosh Shilimkar wrote:
> >> On Friday 21 June 2013 05:04 AM, Sebastian Andrzej Siewior wrote:
> >>> On 06/21/2013 02:52 AM, Santosh Shilimkar wrote:
> >>>> diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
> >>>> index 0a2c68f..62e2e8f 100644
> >>>> --- a/arch/microblaze/kernel/prom.c
> >>>> +++ b/arch/microblaze/kernel/prom.c
> >>>> @@ -136,8 +136,7 @@ void __init early_init_devtree(void *params)
> >>>>  }
> >>>>
> >>>>  #ifdef CONFIG_BLK_DEV_INITRD
> >>>> -void __init early_init_dt_setup_initrd_arch(unsigned long start,
> >>>> -           unsigned long end)
> >>>> +void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
> >>>>  {
> >>>>     initrd_start = (unsigned long)__va(start);
> >>>>     initrd_end = (unsigned long)__va(end);
> >>>
> >>> I think it would better to go here for phys_addr_t instead of u64. This
> >>> would force you in of_flat_dt_match() to check if the value passed from
> >>> DT specifies a memory address outside of 32bit address space and the
> >>> kernel can't deal with this because its phys_addr_t is 32bit only due
> >>> to a Kconfig switch.
> >>>
> >>> For x86, the initrd has to remain in the 32bit address space so passing
> >>> the initrd in the upper range would violate the ABI. Not sure if this
> >>> is true for other archs as well (ARM obviously not).
> >>>
> >> That pretty much means phys_addr_t. It will work for me as well but
> >> in last thread from consistency with memory and reserved node, Rob
> >> insisted to keep it as u64. So before I re-spin another version,
> >> would like to here what Rob has to say considering the x86 requirement.
> >>
> >> Rob,
> >> Are you ok with phys_addr_t since your concern was about rest
> >> of the memory specific bits of the device-tree code use u64 ?
> >
> > No. I still think it should be u64 for same reasons I said originally.
> 
> +1
> 
+1

fix type

Best Regards,
J.
