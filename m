From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 4/6] dt-bindings: mailbox: imx-mu: add i.MX6SX and
 i.MX7S SoCs.
Date: Thu, 26 Jul 2018 15:41:33 +0300
Message-ID: <37ce4f8b-fce7-4f7a-63ce-f2234613d4fa@mentor.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-5-o.rempel@pengutronix.de>
 <CABb+yY32vBy5qVYsQ6u45=rV6gEggqKy3Jqn1B4oWHaGfTyQ8Q@mail.gmail.com>
 <1532601691.32306.28.camel@pengutronix.de>
 <CABb+yY1GEmw_8q2HaF8y5VfFJX_c_0_MbWtPUE_j_o-zS8iZ_g@mail.gmail.com>
 <f3f84864-b6f5-350c-77ff-266b034e676e@mentor.com>
 <CABb+yY1v8j0G12Kd8-DqsJ6VoGBLuit2Cu+SFKixJudRAzXgkQ@mail.gmail.com>
 <c5109c4f-705b-8c28-6b79-a40458933423@mentor.com>
 <CABb+yY02KNB9ELKiWYdB0LyvTghhk+nk-dTUGfG8_+KUB_H=Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CABb+yY02KNB9ELKiWYdB0LyvTghhk+nk-dTUGfG8_+KUB_H=Mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ",
 linux-arm-kernel"@lists.infradead.org, dl-linux-imx <linux-imx-3arQi8VN3Tc@public.gmane.org>, ",
 Sascha Hauer" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, srv_heupstream <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "A.s. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, srv_heupstream <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/26/2018 03:10 PM, Jassi Brar wrote:
> On Thu, Jul 26, 2018 at 5:25 PM, Vladimir Zapolskiy
> <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
>> On 07/26/2018 02:52 PM, Jassi Brar wrote:
>>> On Thu, Jul 26, 2018 at 5:14 PM, Vladimir Zapolskiy
>>> <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
> 
>>>>
>>> Please note the submitted driver absolutely don't care which of the
>>> five SoCs it is.
>>
>> True.
>>
> 
>>> In other words, all these SoCs have the same controller.
>>
>> False :)
>>

To be more precice, the statement itself may be true or false, but
the implication ("In other words, ...") is definitely false.

> OK, so the controllers are not identical, but same enough to have a
> common driver?

Right, the controllers are compatible, but likely they are non-identical.

> Is the driver not tested enough or are you planning to add more features?
> 

Test results can not serve as a formal eternal proof, but they are good as
a hint. Also I'm not aware of any pending features to be added to the driver.

>>> So its about have just one compatible right now, and add more if some
>>> new SoC comes with a variation of the controller.
>>>
>>
>> True. The driver will be changed in this case, unfortunately the bindings
>> are not so volatile.
>>
> The volatility of the bindings will be same when you add a new SoC
> compatible ;)  And you must add to bindings+driver, or the same h/w
> and same driver won't work for your new platform.
> 

The (non-)volatilitily of the bindings is important only in retrospective
view.

Adding a new compatible to the documentation and unrelated board DTBs is
irrelevant, and it is quite predictable that it will happen, when a new
SoC with the same "compatible" IP is released.

--
Best wishes,
Vladimir
