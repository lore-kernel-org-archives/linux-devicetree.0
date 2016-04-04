From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/16] arm64: dts: add sp804 timer node for Hi6220
Date: Mon, 4 Apr 2016 15:53:47 +0200
Message-ID: <CACRpkdb_aMpj3X-m-FdM-PCCSuXgHnect5+nWPFnGVzGx4zrbA@mail.gmail.com>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
 <1459589383-16914-3-git-send-email-guodong.xu@linaro.org>
 <CACRpkdbWuKx6=aF5xW=3EKfuUf-MYM_EEnovyhBnOGVOeHyCmQ@mail.gmail.com>
 <20160404014359.GA15178@leoy-linaro>
 <CACRpkdZ=_86Rhc+ei+3uE0dda9+onC8pQwosheMfEj4tOqmcDA@mail.gmail.com>
 <20160404134237.GC402@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160404134237.GC402@leoy-linaro>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Guodong Xu <guodong.xu@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xu Wei <xuwei5@hisilicon.com>, Grant Likely <grant.likely@secretlab.ca>, XinWei Kong <kong.kongxinwei@hisilicon.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 4, 2016 at 3:42 PM, Leo Yan <leo.yan@linaro.org> wrote:
> On Mon, Apr 04, 2016 at 01:21:00PM +0200, Linus Walleij wrote:

>> This is not about enabling/disabling the clock(s) to the timer.
>> It doesn't matter if these clocks are always on.
>>
>> It is about determining the *frequency* of the timers.
>>
>> It is vital that the timer driver get the right frequency of the clock
>> to the block from the clock implementation, and I do not think
>> it is the same as the "apb_pclk".
>
> Thanks for reminding. Fortunately, apb_pclk and timer's clock are
> same, all of them's rate are 19.2MHz.

OK I was wrong, worrying about nothing.

>> The thing is that of course "any frequency" will
>> work but what you will notice is that the timer runs very
>> weirdly compared to wall-clock time unless the right clock
>> yielding the right frequency has been specified here.
>
> Compared sp804 timer counter with wall-clock (which is using ARM's
> arch timer), and confirmed that sp804 timer's counter register is
> decreasing with rate 19.2MHz.

Thanks, awesome.

> Also have checked Hi6220's spec, there have no timer's dediated clock
> enabling bits. This is the reason before I only registered one clock.
> So according to you and Rob's comments, how about change as below?
>
>                 dual_timer0: timer@f8008000 {
>                         compatible = "arm,sp804", "arm,primecell";
>                         reg = <0x0 0xf8008000 0x0 0x1000>;
>                         interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&ao_ctrl HI6220_TIMER0_PCLK>,
>                                  <&ao_ctrl HI6220_TIMER0_PCLK>,
>                                  <&ao_ctrl HI6220_TIMER0_PCLK>;
>                         clock-names = "apb_pclk", "apb_pclk", "apb_pclk";

This works for me, though I think only the last name
matters so I would name the first two "timer1" and "timer2".

Yours,
Linus Walleij
