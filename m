From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/3] ARM: bcm281xx: Add GPIO driver
Date: Wed, 28 Aug 2013 21:50:09 +0200
Message-ID: <CACRpkdb1wjJh1qCq1Zke0MmL0WZsMKqA5NSJF571aMAKY1mOuA@mail.gmail.com>
References: <1376938761-13657-1-git-send-email-markus.mayer@linaro.org>
 <1376938761-13657-2-git-send-email-markus.mayer@linaro.org>
 <CACRpkdbm2cKpz2SrUgsUpB4x5xjm=Bz=VCu279sEAKFJ1x9SPg@mail.gmail.com>
 <CAPdLdqm+r1P=48Aujz9nuDb_vpFj-wBvmCV=oOKNZ0YENmbL1g@mail.gmail.com>
 <CAPdLdq=atsbY8QDzH-aaHJvLk1CDe5qK3phSGLVZSvm=FoncjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPdLdq=atsbY8QDzH-aaHJvLk1CDe5qK3phSGLVZSvm=FoncjA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Markus Mayer <mmayer@broadcom.com>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 23, 2013 at 9:30 PM, Markus Mayer <markus.mayer@linaro.org> wrote:

> I have a follow-up question regarding status reads for each iteration.
> Is this what you are looking for?
>
>         for (;;) {
>                 sta = readl(reg_base + GPIO_INT_STATUS(bank_id)) &
>                     (~(readl(reg_base + GPIO_INT_MASK(bank_id))));
>                 if (sta == 0)
>                         break;

Yes, but follow the design pattern of other drivers such as the
drivers/irqchip/irq-vic.c:

static int handle_one_vic(struct vic_device *vic, struct pt_regs *regs)
{
        u32 stat, irq;
        int handled = 0;

        while ((stat = readl_relaxed(vic->base + VIC_IRQ_STATUS))) {
                irq = ffs(stat) - 1;
                handle_IRQ(irq_find_mapping(vic->domain, irq), regs);
                handled = 1;
        }
}

I.e use that nice while-construction.

Yours,
Linus Walleij
