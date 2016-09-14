From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 2/9] drivers: irqchip: Add STM32 external interrupts
 support
Date: Wed, 14 Sep 2016 15:34:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609141532510.6233@nanos>
References: <1473432124-6784-1-git-send-email-alexandre.torgue@st.com> <1473432124-6784-3-git-send-email-alexandre.torgue@st.com> <alpine.DEB.2.20.1609131713490.6233@nanos> <6941f61d-0b33-4108-0135-b11887cd0488@st.com> <alpine.DEB.2.20.1609141103420.6233@nanos>
 <facd1c7c-d696-eae1-02e4-5a0c9285add0@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <facd1c7c-d696-eae1-02e4-5a0c9285add0@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 14 Sep 2016, Alexandre Torgue wrote:
> On 09/14/2016 11:19 AM, Thomas Gleixner wrote:
> > 
> > Now what really bugs me is that you do that at all. An interrupt which is
> > freed must be masked already. Why is it unmasked in the first place?
> 
> Honestly I don't know. When "devm_free_irq" is called to release virq, there
> is no issue and interrupt is well masked. But, when I tried to use
> "irq_dispose_mapping(virq)" I observed that .free is called (child and parent
> domain) but interrupt is not masked.

Well, you just used some function in some context which is not relevant to
the normal operation. So adding that mask() is just paranoia for no value.

Thanks,

	tglx
