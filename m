From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 12/16] clocksource: Add clock driver for RDA8810PL SoC
Date: Tue, 20 Nov 2018 09:56:58 +0100
Message-ID: <CACRpkdan96Vj58s=g9jiAoyLBpZqPCKcjqD82mgDj5WqRP7vDQ@mail.gmail.com>
References: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org>
 <20181119170939.19153-13-manivannan.sadhasivam@linaro.org>
 <e9b208ff-327e-860a-6ef0-15bf797dc6b2@arm.com> <20181120050650.GC5885@Mani-XPS-13-9360>
 <86pnv0rwna.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86pnv0rwna.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, zhao_steven@263.net, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 9:17 AM Marc Zyngier <marc.zyngier@arm.com> wrote:

> How does this change anything with the fact that the above code is
> broken? 56 or 64 bit, you cannot read this counter with a single
> access, or two. The canonical way of reading such a counter is
> something like this:
>
>         do {
>                 lo = readl_relaxed(LO);
>                 hi = readl_relaxed(HI);
>         } while (hi != read_relaxed(HI));

To be fair, I have seen hardware that employ a logic latch
such that when a read access is done to the LO register,
the value of the whole counter is latched, also for the HI
register, so when you read the HI register in the second
step, it is never subject to wrapping. (Conversely reading
the HI before the LO will always give you insane values
:D)

However the above code should be fine unless you know
for sure the hardware was constructed with a clever latch.

Yours,
Linus Walleij
