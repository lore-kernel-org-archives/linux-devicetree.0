From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: Add device driver for GRGPIO cores
Date: Mon, 4 Feb 2013 10:24:50 +0100
Message-ID: <CACRpkdYbJiBT5u0qJz+Krpky7W0WNqtSsO6Jo2TYZ2LRcyassA@mail.gmail.com>
References: <1359548921-14925-1-git-send-email-andreas@gaisler.com>
 <CACRpkdbAS05dVOrE2E5Uu6qfzfgcoz_KqQmqZxz5Pne9BbCt-g@mail.gmail.com>
 <510F6CF8.3000700@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <510F6CF8.3000700-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
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
To: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

(CC:ing Anton who wrote the generic GPIO. I might be wrong.)

On Mon, Feb 4, 2013 at 9:10 AM, Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org> wrote:
> On 2013-02-02 16:16, Linus Walleij wrote:
>>>
>>> +#if defined(__BIG_ENDIAN)
>>> +static inline u32 grgpio_read_reg(u32 __iomem *reg)
>>> +{
>>> +       return ioread32be(reg);
>>> +}
>>> +
>>> +static inline void grgpio_write_reg(u32 __iomem *reg, u32 val)
>>> +{
>>> +       iowrite32be(val, reg);
>>> +}
>>> +#else
>>> [...]
>>
>>
>> Where is this __BIG_ENDIAN flag coming from?
>>
>> And do you really have and test this regularly on both LE and BE hardware?
>> I am worrying a bit about maintenance...
>
> I am more than happy to drop that. I will most probably never test this on
> LE hardware.

Will someone else? I'm more thinking whether it is customary in
the SPARC drivers to do things like this, then we should follow
that pattern of course.

>>> +static void grgpio_set_sbit(struct grgpio_priv *priv, u32 __iomem *reg,
>>> +                          unsigned offset, int val, u32 *shadow)
>>> +{
>>> +       unsigned long flags;
>>> +
>>> +       spin_lock_irqsave(&priv->lock, flags);
>>> +
>>> +       if (val)
>>> +               *shadow |= (1 << offset);
>>> +       else
>>> +               *shadow &= ~(1 << offset);
>>> +       grgpio_write_reg(reg, *shadow);
>>> +
>>> +       spin_unlock_irqrestore(&priv->lock, flags);
>>> +}
>>
>>
>> This is all very basic stuff. Please make a best effort to reuse or
>> augment and reuse this:
>> drivers/gpio/gpio-generic.c
>>
>> IIRC this one also handles endianness issues, but I could be wrong.
>
> Sure, many of the initial functions do small basic tasks and resembles
> functions in gpio-generic. But that does not make the hardware itself a good
> candidate to use gpio-generic IMHO:
>
> 1) This core is generally running on SPARC, that is BE, but even on SPARC,
> readl and writel (that would be used in gprio-generic) deals with LE
> accesses and my registers are BE.

Yeah that's true. :-(

I think it's because read[lwb]/write[lwb] comes out of PCI and PCI
is LE.

Didn't think of this...

> 2) The grgpio_to_irq function is very hardware specific, and there is of
> course no gpio_to_irq support in gpio-generic.

Well, the idea about gpio-generic is to use the pieces you need
IIRC. You may override.

> 3) Running on SPARC, I get Open Firmware information from prom, so there is
> no platform data to access in the probe function. Of course general Open
> Firmware support could be added to gpio-generic, but in addition my probe
> needs to set up very hardware specific things for gpio_to_irq.

We should probably add some way to handle generic GPIO
with compatible strings etc, but that's way outside my competence
so OK. Maybe Rob or Grant can say something.

Yours,
Linus Walleij
