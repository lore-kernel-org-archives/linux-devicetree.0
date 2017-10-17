From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v4 1/4] clocksource: stm32: convert driver to timer_of
Date: Tue, 17 Oct 2017 19:34:21 +0200
Message-ID: <CA+M3ks5CBOXfQCMmUZnkVUNwSGCnzaqdzDZa9ap6NYgDTVspsw@mail.gmail.com>
References: <1506959513-16851-1-git-send-email-benjamin.gaignard@linaro.org>
 <1506959513-16851-2-git-send-email-benjamin.gaignard@linaro.org> <88c8f124-4cb1-a982-d4a2-c029ab0dcd2a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <88c8f124-4cb1-a982-d4a2-c029ab0dcd2a@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Thomas Gleixner <tglx@linutronix.de>, Ludovic Barre <ludovic.barre@st.com>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2017-10-17 19:09 GMT+02:00 Daniel Lezcano <daniel.lezcano@linaro.org>:
> On 02/10/2017 17:51, Benjamin Gaignard wrote:
>> Convert driver to use timer_of helpers. This allow to remove
>> custom proprietary structure.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> ---
>
> [ ... ]
>
>> -     clockevents_config_and_register(&data->evtdev,
>> -                                     DIV_ROUND_CLOSEST(rate, prescaler)=
,
>> -                                     0x1, max_delta);
>> -
>> -     ret =3D request_irq(irq, stm32_clock_event_handler, IRQF_TIMER,
>> -                     "stm32 clockevent", data);
>> -     if (ret) {
>> -             pr_err("%pOF: failed to request irq.\n", np);
>> -             goto err_get_irq;
>> -     }
>> +     clockevents_config_and_register(&to->clkevt,
>> +                                     timer_of_period(to), 0x60, max_del=
ta);
>
>
> Why 0x1 -> 0x60 ?

Because if the min delta is too small it could generate too much interrupts
and the system will not be able to catch all of them.

>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
