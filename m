From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 2/4] drivers: irqchip: Add STM32 external interrupts
 support
Date: Tue, 20 Sep 2016 22:16:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609202214460.5476@nanos>
References: <1474387259-18926-1-git-send-email-alexandre.torgue@st.com> <1474387259-18926-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1474387259-18926-3-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Alexandre,

On Tue, 20 Sep 2016, Alexandre TORGUE wrote:

> The STM32 external interrupt controller consists of edge detectors that
> generate interrupts requests or wake-up events.
> 
> Each line can be independently configured as interrupt or wake-up source,
> and triggers either on rising, falling or both edges. Each line can also
> be masked independently.
> 
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

That all looks very reasonable now. The only remaining question is your SOB
chain. Who is the author of these patches? You or Maxime? If it's Maxime,
then the changelog misses a From: tag. If it's you then Maximes SOB is
bogus.

Thanks,

	tglx


