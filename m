From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 3/9] includes: dt-bindings: Add STM32F429 pinctrl DT bindings
Date: Mon, 30 Nov 2015 16:55:35 +0100
Message-ID: <CALszF6DLfpA6bdndRvBjufXnsoOxRT0bgN8P_D=2gqc1CK4=+A@mail.gmail.com>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1445102604-11502-4-git-send-email-mcoquelin.stm32@gmail.com>
	<56261239.5030007@linaro.org>
	<CALszF6DQ2G_Fzhk_SP+A0i_Z4mg9etdf1NcfQS3cPpB0zNot-w@mail.gmail.com>
	<CACRpkdashSEWL+KFgD+MmdoZwjXnsXpxy-MPmDciO9n87+6BBQ@mail.gmail.com>
	<CALszF6B7928hpMDMH0_wmo-MakZX7sofO85aeBwv-aCLBHnrkA@mail.gmail.com>
	<CACRpkdZTHcROza2diFCOj783T1zfbkd=Dov3PUzDV2U35qEFXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZTHcROza2diFCOj783T1zfbkd=Dov3PUzDV2U35qEFXA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Daniel Thompson <daniel.thompson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

2015-11-17 12:00 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Nov 6, 2015 at 1:57 PM, Maxime Coquelin
> <mcoquelin.stm32@gmail.com> wrote:
>
>> Thinking again at it, I persist to believe have the defines makes it
>> easier to use.
>> With auto-completion, it makes it faster and less error prone to
>> select the right
>> alternate function without parsing the datasheet.
>
> Auto-completion ... should we design our source code to
> fit certain editors?
No, you are right.
But even without auto-completion, it is easier to have the values pre-computed.
And Mediatek has the defines, so it is better to do the same for STM32
for consistency.

>> But as these defines are not actually used on driver side, maybe I
>> could just move
>> them to the dts directory?
>
> No strong opinion there. include/dt-bindings is part of the bindings
> documentation actually so I guess it goes there.
Ok.

Thanks,
Maxime
