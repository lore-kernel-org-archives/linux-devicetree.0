From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Fri, 18 Oct 2013 21:52:51 +0200
Message-ID: <CACRpkdbG9emZg-6oOO8MgwUgCkqQB6+QqYuNAOo-QN0e+wYq2g@mail.gmail.com>
References: <1382011682-18595-1-git-send-email-jiri.prchal@aksignal.cz>
	<20131017150455.GH24056@e106331-lin.cambridge.arm.com>
	<CAAVeFuJCamVumTphu-Wv2DSgepwoPgYXnCGdK=L8oem-3-K+gA@mail.gmail.com>
	<5260DD62.2060706@aksignal.cz>
	<20131018103601.GC29779@e106331-lin.cambridge.arm.com>
	<52612E49.7070403@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <52612E49.7070403@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "blogic@openwrt.org" <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "acourbot@nvidia.com" <acourbot@nvidia.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "cooloney@gmail.com" <cooloney@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 18, 2013 at 2:49 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal@aks=
ignal.cz> wrote:
> Dne 18.10.2013 12:36, Mark Rutland napsal(a):

>> If there is information associated with the GPIO pins themselves, th=
at
>> should be described in the GPIO bindings. If we want to export named
>> pins in sysfs, that is the duty of the GPIO framework and GPIO drive=
rs.
>> I do not believe having a binding for a non-device that exists solel=
y to
>> express a naming preference makes any sense.
>
>
> I realy don't understan it, isn't it done in GPIO framework? Please, =
coul'd
> you explain it more.

I think what Mark is saying is that you should not define a new node
for exports, but instead use the node for the gpiochip and extend those
existing gpiochip bindings, if you want to do this.

I.e. you should be patching this file in the end:
Documentation/devicetree/bindings/gpio/gpio.txt

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
