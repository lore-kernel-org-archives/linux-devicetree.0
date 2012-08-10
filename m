From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Fri, 10 Aug 2012 10:41:58 +0200
Message-ID: <CACRpkdaGWhTR3Zr40dtigQqPPkxQZ=zYqYVBfpwbnkf3P2Qhhg@mail.gmail.com>
References: <1343044770-6591-1-git-send-email-thierry.reding@avionic-design.de>
 <CACRpkdaZcUvcJMUZTqCEU5FQYhE3EvSSfUEnEx0dYRt-6x5Nig@mail.gmail.com>
 <20120809202054.GA24503@avionic-0098.mockup.avionic-design.de>
 <CACRpkdaSk9xBaiSAKCj4Pa2kyyfP178XN53i2Q2+CBFx=RoE0g@mail.gmail.com>
 <20120810083508.GA16251@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120810083508.GA16251-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 10, 2012 at 10:35 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> Consult the following article on LWN:
>> http://lwn.net/Articles/470820/
>>
>> Then grep your gitlog and you'll see we got rid of it from ARM.
>
> Then why is there still the following in arch/arm/include/asm/irq.h?
>
>         /*
>          * Use this value to indicate lack of interrupt
>          * capability
>          */
>         #ifndef NO_IRQ
>         #define NO_IRQ  ((unsigned int)(-1))
>         #endif

That's a question for Russell but I think it's basically there for
old platforms, on a "don't use it"-basis. (Maybe a comment could
be good.)

As you see non-sparse platforms can redefine NO_IRQS in their
<mach/irqs.h> file, but in practice things like the VIC and GIC
drivers have been switched over to using irqdomain which
in turn does *not* allow IRQ 0 to be used, so most platforms
are indirectly disallowed to use IRQ 0 anyway. In fact I think
some of them are just broken now.

>> If this driver is for some other arch like openrisc I might accept
>> it but please reconsider.
>
> There's nothing in the driver that makes it ARM specific, so it could be
> used on other platforms just as well.

The linked article makes it clear that the direction for the entire
kernel is to get rid of NO_IRQ and !irq is used all over the place.

> But as I also said in my previous
> mail, in this particular case the value for the interrupt comes from the
> call to irq_of_parse_and_map(), which will return 0 on failure,
> regardless of the architecture, so there is actually no problem.

OK cool.

Yours,
Linus Walleij
