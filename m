From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 2/3] mfd: syscon: Add optional clock support
Date: Wed, 16 Jan 2019 15:10:08 +0100
Message-ID: <9e0ee154-a399-9bff-3beb-adfd9d6c6fee@st.com>
References: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
 <1544604495-4082-3-git-send-email-fabrice.gasnier@st.com>
 <CAK8P3a1MucNG86=bXwVVsasGBOLJ67kuRSpoeneF6M5aB6GmQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1MucNG86=bXwVVsasGBOLJ67kuRSpoeneF6M5aB6GmQA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 1/16/19 1:14 PM, Arnd Bergmann wrote:
> (sorry for the late reply, I just realized that I had never sent out the
> mail after Lee asked me for a review last year and I had drafted
> my reply).

Hi Arnd,

Many thanks for reviewing, no worries :-)

> 
> On Wed, Dec 12, 2018 at 9:48 AM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>>
>> Some system control registers need to be clocked, so the registers can
>> be accessed. Add an optional clock and attach it to regmap.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> 
> This looks ok to me in principle, but I have one question: When we
> do a clk_get() and clk_prepare() as part of regmap_mmio_attach_clk(),
> does that change the behavior of syscon nodes that are otherwise
> unused?

I'm not sure I correctly understand this question. I don't think it will
change the behavior for "unused" nodes. These should remain unused with
this patch.

> 
> I think we have a bunch of devices that started out as a syscon but
> then we added a proper driver for them, which would handle the
> clocks explicitly. Is it guaranteed that this will keep working (including
> shutting down the clocks when they are unused) if we have two drivers
> that call clk_get() on the same device node?

I'd expect nothing wrong happens when two drivers call clk_get() for the
same clock.
Are there some case where two drivers are bind (e.g. syscon driver +
another driver) for the same piece of hardware ?

The clk_prepare() is part of regmap_mmio_attach_clk(). It's called once
upon registration via of_syscon_register(). There is currently no mean
to unregister, e.g. something like "of_syscon_unregister" and so do
clk_unprepare via regmap_mmio_detach_clk().

Then point is clk_enable()/clk_disable() calls will be used in
regmap_mmio_read() and regmap_mmio_write(). These calls are balanced.
Then clock framework should correctly disable/gate the clock when
unused, based on the enable count.

Is this answering your question?

Thanks again,
Best regards,
Fabrice
> 
>        Arnd
> 
