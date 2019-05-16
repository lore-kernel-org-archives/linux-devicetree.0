From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 06/14] genirq: Introduce irq_chip_{request,release}_resource_parent()
 apis
Date: Thu, 16 May 2019 14:40:54 +0200
Message-ID: <CACRpkdaEJ_2bmkgcbRW+zWm16+EV9-b77xFVZiBbu_=M2sTt5g@mail.gmail.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com> <20190430101230.21794-7-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430101230.21794-7-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 12:13 PM Lokesh Vutla <lokeshvutla@ti.com> wrote:

> Introduce irq_chip_{request,release}_resource_parent() apis so
> that these can be used in hierarchical irqchips.
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
