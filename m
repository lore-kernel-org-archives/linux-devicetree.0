From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Fri, 1 Dec 2017 09:38:54 +0100
Message-ID: <CACRpkdbpg70nJM87RZC=a2D_GhuJCK4k2HeNoCXtBGmh-uifSA@mail.gmail.com>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-5-git-send-email-preid@electromag.com.au>
 <20171121133434.tuvxtrrbabjk4zeg@earth> <c191a9d6-3ebb-e95b-7342-aa18598ddf2b@electromag.com.au>
 <20171121152142.zg3r57gl2kenjwgi@earth> <CACRpkdbkG_83-gpGqdMA5y3cpAvSbQ2X_xT07PC3+boxPeWbPQ@mail.gmail.com>
 <1ba1c850-dd22-fa98-66ea-fcb8527ec5ad@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1ba1c850-dd22-fa98-66ea-fcb8527ec5ad@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Phil Reid <preid@electromag.com.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 4:50 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:

> I'm clearly inclined to prefer the first solution. But maybe it is time
> to invent a "generic inverter" driver that could be reusable, just like
> we have a generic irqchip?

I'm leaning towards that we should create
compatible = "irqline-inverter"; irqchip and just slap that into
drivers/of/irq.c for everyone. *Maybe* with a Kconfig
for it if people worry about the extra bytes.

Yours,
Linus Walleij
