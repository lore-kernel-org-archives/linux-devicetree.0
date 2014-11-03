From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/17] gpio: mvebu: add suspend/resume support
Date: Mon, 3 Nov 2014 14:26:59 +0100
Message-ID: <CACRpkdaMrLBejKShTZoHW8BZb9AJguGJ96eEMp+eo3kmH=yDwA@mail.gmail.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com>
	<CACRpkda-8p=e_12vpUNt3_Y0EVPDArEKJUi63B8CGemNwVuQ0w@mail.gmail.com>
	<54533FAF.7010505@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <54533FAF.7010505@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 31, 2014 at 8:52 AM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
> Hi Linus,
>>> +       switch (mvchip->soc_variant) {
>>> +       case MVEBU_GPIO_SOC_VARIANT_ORION:
>>> +               mvchip->edge_mask_regs[0] =
>>> +                       readl(mvchip->membase + GPIO_EDGE_MASK_OFF);
>>> +               mvchip->level_mask_regs[0] =
>>> +                       readl(mvchip->membase + GPIO_LEVEL_MASK_OFF);
>>> +               break;
>>
>> You are assigning index [0] twice, why? There must be some
>> reason, and it should be stated in a comment. If the first read
>> is necessary for hardware reasons, don't assign it but
>> discard the result.
>
> Maybe I missed something but for me these 2 registers are different:
> one is the _EDGE_ mask and the other the _LEVEL_ mask.

Yeah haha I must have had a bad perception day :D

Yours,
Linus Walleij
