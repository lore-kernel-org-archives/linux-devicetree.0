From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 06/17] gpio: mvebu: add suspend/resume support
Date: Fri, 31 Oct 2014 08:52:15 +0100
Message-ID: <54533FAF.7010505@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com> <CACRpkda-8p=e_12vpUNt3_Y0EVPDArEKJUi63B8CGemNwVuQ0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkda-8p=e_12vpUNt3_Y0EVPDArEKJUi63B8CGemNwVuQ0w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,


> 
>> +       switch (mvchip->soc_variant) {
>> +       case MVEBU_GPIO_SOC_VARIANT_ORION:
>> +               mvchip->edge_mask_regs[0] =
>> +                       readl(mvchip->membase + GPIO_EDGE_MASK_OFF);
>> +               mvchip->level_mask_regs[0] =
>> +                       readl(mvchip->membase + GPIO_LEVEL_MASK_OFF);
>> +               break;
> 
> You are assigning index [0] twice, why? There must be some
> reason, and it should be stated in a comment. If the first read
> is necessary for hardware reasons, don't assign it but
> discard the result.

Maybe I missed something but for me these 2 registers are different:
one is the _EDGE_ mask and the other the _LEVEL_ mask.

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
