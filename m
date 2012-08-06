From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Mon, 6 Aug 2012 08:39:24 +0200
Message-ID: <CACRpkdZDQLRDzxmkcrMQX+ZGwSgMwtBsD4sPr_S2jOyft1L37Q@mail.gmail.com>
References: <1343044770-6591-1-git-send-email-thierry.reding@avionic-design.de>
 <CACRpkdaZcUvcJMUZTqCEU5FQYhE3EvSSfUEnEx0dYRt-6x5Nig@mail.gmail.com>
 <20120730074714.GC15245@avionic-0098.mockup.avionic-design.de>
 <CACRpkdbrdWw_HR91r72aB_S2+vxiaSBKHwW+Tsmi8pKk9VsgFg@mail.gmail.com>
 <20120806051144.GA12642@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120806051144.GA12642-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 6, 2012 at 7:11 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Sun, Aug 05, 2012 at 12:50:54PM +0200, Linus Walleij wrote:

>> We're working on a goal of a "single zImage" (one unified ARM
>> kernel) which means your platform must be able to handle the
>> case where this is turned on anyway, so I would suggest you
>> drop the optional compile-time IRQ support, just make it
>> optional at runtime instead.
>
> I don't quite understand. Do you want me to add a module parameter to
> make it optional at runtime? Since the driver is now OF only I suppose I
> could make it optional on the interrupt-controller property as well.

No, no module parameter. Just don't register the IRQ domain if there
are not IRQ resources in the device tree, if the interrupt-controller
property is not present I guess?

>> OK but atleast find a way to move this to the probe() function,
>> what happens if the debugfs file is browsed and you run out
>> of memory? Not nice, and you were using this to debug as
>> well...
>
> Alright, I can do that. Alternatively I could probably drop the
> allocations altogether and use local variables within the second loop to
> store the variables:
>
>         for (i = 0; i < num_regs; i++) {
>                 u8 ddr, plr, ier, isr, ptr;
>
>                 err = adnp_read(gpio, GPIO_DDR(gpio) + i, &ddr);
>                 if (err < 0)
>                         goto out;
>
>                 ...
>         }
>
> With the proper locking this shouldn't be a problem. The reason why I
> used the block-wise approach in the first place was that the register
> accesses were more "atomic". Of course without locking this is non-
> sense.

Either approach works, the above seems more elegant though!

Yours,
Linus Walleij
