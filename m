From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] ARM: mstar: Add machine for MStar infinity family SoCs
Date: Mon, 14 Oct 2019 13:19:46 +0200
Message-ID: <CAK8P3a2U7U31eF_POU2=eCU+E1DH-wnR2uHr-VZYWLy25hLjKg@mail.gmail.com>
References: <20191014061617.10296-1-daniel@0x0f.com> <20191014061617.10296-2-daniel@0x0f.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014061617.10296-2-daniel@0x0f.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Palmer <daniel@0x0f.com>
Cc: Daniel Palmer <daniel@thingy.jp>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Burton <paul.burton@mips.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Bartosz Golaszewski <bgolaszewski@ba>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 14, 2019 at 8:21 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Initial support for the MStar infinity/infinity3 series of Cortex A7
> based IP camera SoCs.
>
> These chips are interesting in that they contain a Cortex A7,
> peripherals and system memory in a single tiny QFN package that
> can be hand soldered allowing almost anyone to embed Linux
> in their projects.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

> +
> +static void __init infinity_map_io(void)
> +{
> +       iotable_init(infinity_io_desc, ARRAY_SIZE(infinity_io_desc));
> +       miu_flush = (void __iomem *)(infinity_io_desc[0].virtual
> +                       + INFINITY_L3BRIDGE_FLUSH);
> +       miu_status = (void __iomem *)(infinity_io_desc[0].virtual
> +                       + INFINITY_L3BRIDGE_STATUS);
> +}

If you do this a little later in .init_machine, you can use a simple ioremap()
rather than picking a hardcoded physical address. It looks like nothing
uses the mapping before you set soc_mb anyway.

> +static DEFINE_SPINLOCK(infinity_mb_lock);
> +
> +static void infinity_mb(void)
> +{
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&infinity_mb_lock, flags);
> +       /* toggle the flush miu pipe fire bit */
> +       writel_relaxed(0, miu_flush);
> +       writel_relaxed(INFINITY_L3BRIDGE_FLUSH_TRIGGER, miu_flush);
> +       while (!(readl_relaxed(miu_status) & INFINITY_L3BRIDGE_STATUS_DONE)) {
> +               /* wait for flush to complete */
> +       }
> +       spin_unlock_irqrestore(&infinity_mb_lock, flags);
> +}

Wow, this is a heavy barrier. From your description it doesn't sound like
there is anything to be done about it unfortunately.

Two possible issues I see here:

* It looks like it relies on CONFIG_ARM_HEAVY_BARRIER, but your Kconfig
  entry does not select that. In many configurations, CACHE_L2X0 would
  be set, but there is no need for yours on the Cortex-A7.

* You might get into a deadlock if you get an FIQ (NMI) interrupt while
   holding the infinity_mb_lock, and then issue another memory barrier
   from that handler, so you might need to use
   local_irq_disable()+local_fiq_disable()+raw_spin_lock() here, making
   it even more expensive.
   Not sure if it matters in practice, as almost nothing uses fiq any more.
   OTOH, maybe the lock is not needed at all? AFAICT if the sequence
   gets interrupted by a handler that also calls mb(), you would still
   continue in the original thread while observing a full l3 barrier. ;-)

        Arnd
