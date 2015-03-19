From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Thu, 19 Mar 2015 09:42:16 +0100
Message-ID: <CACRpkdbXm_aPQU0-wV8yASts7n4QBd1dAe8-d40g2xy2KBAKEQ@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
	<1424744104-14151-3-git-send-email-abrestic@chromium.org>
	<CACRpkdbqioAreyDwM2JN87=gH20n1OkUXPjdkW885iDWUV1NnA@mail.gmail.com>
	<CAL1qeaHzpi3_PNpxnLOf=b8d2n5DrRrnB_yiZFHpiP8C7b0hSg@mail.gmail.com>
	<CACRpkdbt4MQYY7MqjFN-1Dp0am1PaOZ1YL+bKc8SJrtFDnSW_Q@mail.gmail.com>
	<CAL1qeaHCKPeQnf8VPWmz_=uN1=_mxWbMGF+HuPZ_AYOqA+15JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaHCKPeQnf8VPWmz_=uN1=_mxWbMGF+HuPZ_AYOqA+15JA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 5:56 PM, Andrew Bresticker
<abrestic@chromium.org> wrote:
[Me]
>> Sorry if I don't really know how things work now... :(
>> It seems like a logical way to me.
(...)
> 4) The ->set_mux() op must set the proper function for the pin.
> 5) The ->set_mux() op must also disable the GPIO function for the pin.
> To disable the GPIO function, the pinctrl driver must map the pin to a
> GPIO bank/offset and disable the GPIO via the GPIO bank's GPIO_EN
> register.

That sounds like the"GPIO" registers are actually involved in any
muxing usecase, meaning there is not really a clean split between
the pinctrl and GPIO hardware, the case I refer to as "GPIO mode
pitfalls" in Documentation/pinctrl.txt.

In such cases both halves of the driver(s) need to be aware of
the other, and that is what you seem to be wanting to achieve.

So I was wrong in thinking the GPIO device could be a separate
subdevice, the two parts are too dependent on each other.
So keep a single probe() function and let the two driver halves
poke into each others' registers.

Sorry for the fuzz...

Yours,
Linus Walleij
