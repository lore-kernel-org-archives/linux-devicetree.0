From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: mailbox: imx-mu: add i.MX6SX and
 i.MX7S SoCs.
Date: Thu, 26 Jul 2018 17:40:32 +0530
Message-ID: <CABb+yY02KNB9ELKiWYdB0LyvTghhk+nk-dTUGfG8_+KUB_H=Mw@mail.gmail.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-5-o.rempel@pengutronix.de>
 <CABb+yY32vBy5qVYsQ6u45=rV6gEggqKy3Jqn1B4oWHaGfTyQ8Q@mail.gmail.com>
 <1532601691.32306.28.camel@pengutronix.de>
 <CABb+yY1GEmw_8q2HaF8y5VfFJX_c_0_MbWtPUE_j_o-zS8iZ_g@mail.gmail.com>
 <f3f84864-b6f5-350c-77ff-266b034e676e@mentor.com>
 <CABb+yY1v8j0G12Kd8-DqsJ6VoGBLuit2Cu+SFKixJudRAzXgkQ@mail.gmail.com>
 <c5109c4f-705b-8c28-6b79-a40458933423@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c5109c4f-705b-8c28-6b79-a40458933423@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, ",
 linux-arm-kernel"@lists.infradead.org, dl-linux-imx <linux-imx@nxp.com>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, srv_heupstream <linux-mediatek@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>, srv_heupstream <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 5:25 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
> On 07/26/2018 02:52 PM, Jassi Brar wrote:
>> On Thu, Jul 26, 2018 at 5:14 PM, Vladimir Zapolskiy
>> <vladimir_zapolskiy@mentor.com> wrote:

>>>
>> Please note the submitted driver absolutely don't care which of the
>> five SoCs it is.
>
> True.
>

>> In other words, all these SoCs have the same controller.
>
> False :)
>
OK, so the controllers are not identical, but same enough to have a
common driver?
Is the driver not tested enough or are you planning to add more features?

>> So its about have just one compatible right now, and add more if some
>> new SoC comes with a variation of the controller.
>>
>
> True. The driver will be changed in this case, unfortunately the bindings
> are not so volatile.
>
The volatility of the bindings will be same when you add a new SoC
compatible ;)  And you must add to bindings+driver, or the same h/w
and same driver won't work for your new platform.
