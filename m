From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH v2 4/9] pinctrl: Add support STM32 MCUs
Date: Fri, 11 Dec 2015 09:20:50 +0100
Message-ID: <566A8762.4040108@st.com>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
 <1445102604-11502-5-git-send-email-mcoquelin.stm32@gmail.com>
 <CALszF6Cd=yei0m2Zs=+k=KT5RUzdesGWPK7PAQPdj_-Ouan=2A@mail.gmail.com>
 <CACRpkda4eSHu57Tw6F-kmxY_EOSEhpRiowQN9o4LbPVgE_Xvkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkda4eSHu57Tw6F-kmxY_EOSEhpRiowQN9o4LbPVgE_Xvkw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus

I will try to review it before end of next week

Patrice



On 12/10/2015 06:08 PM, Linus Walleij wrote:
> On Tue, Dec 1, 2015 at 10:53 AM, Maxime Coquelin
> <mcoquelin.stm32@gmail.com> wrote:
>> 2015-10-17 19:23 GMT+02:00 Maxime Coquelin <mcoquelin.stm32@gmail.com>:
>>> This patch adds pinctrl and GPIO support to STMicroelectronic's STM32
>>> family of MCUs.
>>>
>>> While it only supports STM32F429 for now, it has been designed to enable
>>> support of other MCUs of the family (e.g. STM32F746).
>>>
>>> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>> ---
>>>   drivers/pinctrl/Kconfig                   |    1 +
>>>   drivers/pinctrl/Makefile                  |    1 +
>>>   drivers/pinctrl/stm32/Kconfig             |   16 +
>>>   drivers/pinctrl/stm32/Makefile            |    5 +
>>>   drivers/pinctrl/stm32/pinctrl-stm32.c     |  856 +++++++++++++++
>>>   drivers/pinctrl/stm32/pinctrl-stm32.h     |   43 +
>>>   drivers/pinctrl/stm32/pinctrl-stm32f429.c | 1598 +++++++++++++++++++++++++++++
>>>   7 files changed, 2520 insertions(+)
>>>   create mode 100644 drivers/pinctrl/stm32/Kconfig
>>>   create mode 100644 drivers/pinctrl/stm32/Makefile
>>>   create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.c
>>>   create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.h
>>>   create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f429.c
>>>
>> Gentle reminder, do you know when you will be able to review this driver?
> I'm a bit overloaded so reviewing of large chunks of code takes time.
>
> It would be great if I could have some Reviewed-by tags from someone
> else who's familiar with pin control.
>
> Patrice: do you have a chance to review this driver and help us?
>
> Yours,
> Linus Walleij

