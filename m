From: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v5 2/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
Date: Fri, 9 Mar 2018 00:37:47 +0200
Message-ID: <CAP6Zq1gKE0xUGHuwXa7eLEsUisnaaz=QLgs=6uYnUYDGdX5ryw@mail.gmail.com>
References: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
 <1520522698-16153-3-git-send-email-tmaimon77@gmail.com> <2a83eb83-10a9-54f3-e0da-bd6cf32b5ac1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2a83eb83-10a9-54f3-e0da-bd6cf32b5ac1@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Avi Fishman <avifishman70@gmail.com>, Brendan Higgins <brendanhiggins@google.com>, venture@google.com, Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 8 March 2018 at 17:33, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> On 08/03/2018 16:24, Tomer Maimon wrote:
>> Add Nuvoton BMC NPCM7xx timer driver.
>>
>> The clocksource Enable 24-bit TIMER0 and TIMER1 counters,
>> while TIMER0 serve as clockevent and TIMER1 serve as clocksource.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
>> ---
>
> [ ... ]
>
>> +
>> +     pr_info("Enabling NPCM7xx clocksource timer base: 0x%x, IRQ: %d ",
>> +             (int)timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to)=
);
>
> You can use '%p' instead of '0x%x' and remove the (int) cast.
I think we need to use in the pr_info %px, if I use %p I get in the
kernel boot print "(ptrval)" instead of the address.
please refer: https://lwn.net/Articles/740249/
>
> I'm fine with the driver. If there is no comment, I will take it and do
> the change (if you are ok), no need on this case to resend a v6.
Yes great, Thank a lot!
>
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
