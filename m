From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 0/2] get pinctrl more flexible for per pin muxing controllers
Date: Wed, 10 Jun 2015 08:14:50 -0600
Message-ID: <5578465A.9090503@wwwdotorg.org>
References: <1430729776-27797-1-git-send-email-ludovic.desroches@atmel.com>	<556F01CC.8020305@atmel.com> <CACRpkdawFrfzHf+8vMLz07-r4J48bAVibV++K31dNQ+D-85ZMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdawFrfzHf+8vMLz07-r4J48bAVibV++K31dNQ+D-85ZMg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/10/2015 01:33 AM, Linus Walleij wrote:
> On Wed, Jun 3, 2015 at 3:31 PM, Nicolas Ferre <nicolas.ferre@atmel.co=
m> wrote:
>> Le 04/05/2015 10:56, Ludovic Desroches a =C3=A9crit :
>>>
>>> The way pins, groups and functions are tied is too constraining for=
 some
>>> controllers. It concerns mainly the ones we don't care about groups=
 and
>>> functions, each pin can be muxed to any functions.
>>> The goal of these two patches is too remove some of the constraints=
=2E
>>>
>>> I have added the prototype of a pin controller and device tree to s=
how the
>>> way I want to use these changes. I couldn't test it on boards using=
 generic
>>> pinconf so I am not sure that I don't break something...
>>>
>>>
>>> Ludovic Desroches (4):
>>>    pinctrl: change function behavior for per pin muxing controllers
>>>    pinctrl: introduce complex pin description
>>
>> Linus,
>>
>> Ludovic sent this series nearly one month ago. It was posted after a=
 RFC
>> series on the same topic two months ago. As we don't see any comment=
 on
>> neither of them we assume that it's okay to include them.
>
> It's a quite big patch and I need help reviewing it and thinking of
> some possible consequences.
>
> Stephen, can you give me a hand with this?

I don't have the patch in my list archive, which goes back 60 days.

Judging purely by the patch description, the patch sounds incorrect.=20
There's nothing in pinctrl that prevents a particular pin controller=20
from supporting all mux functions on all pins or groups. Simply return=20
the same list of functions for every pin.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
