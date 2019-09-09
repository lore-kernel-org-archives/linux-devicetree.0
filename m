From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] soc: amazon: al-pos: Introduce Amazon's Annapurna
 Labs POS driver
Date: Mon, 9 Sep 2019 17:16:56 +0200
Message-ID: <CAK8P3a1fbK-qoK+K1ZsWsU3rkxxZgZGaK8ywFAcM4va1GRn_FQ@mail.gmail.com>
References: <1568020220-7758-1-git-send-email-talel@amazon.com>
 <1568020220-7758-3-git-send-email-talel@amazon.com> <CAK8P3a3UF7xPV1U3eW6Jdu754P1bzG208UxD9KUxEm1JjZudww@mail.gmail.com>
 <98f0028e-5653-3116-fdaa-1385ecdf0289@amazon.com> <CAK8P3a1NVGwYa1bw_vjBatd1xe-i875X1Vq1M+2G_Zxd2Oqusg@mail.gmail.com>
 <8f7840c3-a682-04a5-18bf-ac7a723725b0@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8f7840c3-a682-04a5-18bf-ac7a723725b0@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Shenhar, Talel" <talel@amazon.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, gregkh <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <mripard@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>David
List-Id: devicetree@vger.kernel.org

On Mon, Sep 9, 2019 at 4:11 PM Shenhar, Talel <talel@amazon.com> wrote:
> On 9/9/2019 4:41 PM, Arnd Bergmann wrote:
>
> In current implementation of v1, I am not doing any read barrier, Hence,
> using the non-relaxed will add unneeded memory barrier.
>
> I have no strong objection moving to the non-relaxed version and have an
> unneeded memory barrier, as this path is not "hot" one.

Ok, then please add it.

> Beside of avoiding the unneeded memory barrier, I would be happy to keep
> common behavior for our drivers:
>
> e.g.
>
> https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-al-fic.c#L49
>
>
> So what do you think we should go with? relaxed or non-relaxed?

The al_fic_set_trigger() function is clearly a slow-path and should use the
non-relaxed functions. In case of al_fic_irq_handler(), the extra barrier
might introduce a measurable overhead, but at the same time I'm
not sure if that one is correct without the barrier:

If you have an MSI-type interrupt for notifying a device driver of
a DMA completion, there might not be any other barrier between
the arrival of the MSI message and the CPU accessing the data.
Depending on how strict the hardware implements MSI and how
the IRQ is chained, this could lead to data corruption.

If the interrupt is only used for level or edge triggered interrupts,
this is ok since you already need another register read in
the driver before it can safely access a DMA buffer.

In either case, if you can prove that it's safe to use the relaxed
version here and you think that it may help, it would be good to
add a comment explaining the reasoning.

       Arnd
