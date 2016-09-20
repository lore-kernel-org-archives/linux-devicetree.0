From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 2/9] drivers: irqchip: Add STM32 external interrupts
 support
Date: Tue, 20 Sep 2016 11:51:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609201150160.6905@nanos>
References: <1473432124-6784-1-git-send-email-alexandre.torgue@st.com> <1473432124-6784-3-git-send-email-alexandre.torgue@st.com> <alpine.DEB.2.20.1609131713490.6233@nanos> <6941f61d-0b33-4108-0135-b11887cd0488@st.com> <alpine.DEB.2.20.1609141103420.6233@nanos>
 <facd1c7c-d696-eae1-02e4-5a0c9285add0@st.com> <alpine.DEB.2.20.1609141532510.6233@nanos> <f64e4f9d-d811-2c6e-7c5a-d4ab06716e2c@st.com> <39c4ceee-7e05-ebfd-2ea0-3c4e1c4ea619@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <39c4ceee-7e05-ebfd-2ea0-3c4e1c4ea619@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Jason Cooper <jason@lakedaemon.net>, arnd@arndb.de, Marc Zyngier <marc.zyngier@arm.com>, bruherrera@gmail.com, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Sep 2016, Alexandre Torgue wrote:
> > On 09/14/2016 03:34 PM, Thomas Gleixner wrote:
> > > Well, you just used some function in some context which is not
> > > relevant to
> > > the normal operation. So adding that mask() is just paranoia for no
> > > value.
> > 
> A gentle reminder ping...
> If ".free" callback is not relevant then I 'll remove it from exti domain.

I was not talking about the .free callback in general. I was talking about
the masking. But yes, if the thing is otherwise a NOOP, then you can spare
it completely.

Thanks,

	tglx
