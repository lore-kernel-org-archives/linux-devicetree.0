From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] RFC: let gpiod_get_optional et all return NULL when
 GPIOLIB is not enabled
Date: Tue, 28 Apr 2015 12:31:37 +0900
Message-ID: <CAAVeFuKMiHhT8o1PCETNTys8EATcVdy7xfy+P+o_2r6BwAXEgw@mail.gmail.com>
References: <1423731809-4800-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdb6KcZx3WfTqUKemhQ0_OsqxBGQb_P5cXXZvgc3riakdA@mail.gmail.com>
 <20150306085957.GC10717@pengutronix.de> <CACRpkdYq70V8SG4XOPBCGWs__J4ehknZSucpO5OdXpMDj8GPKA@mail.gmail.com>
 <CAAVeFu+0bWSAUSaDGTUmPyj9JxEJn4yxF_hzab4CHp8YV1MuoA@mail.gmail.com> <20150427152153.GN19431@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150427152153.GN19431@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 28, 2015 at 12:21 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello,
>
> On Thu, Apr 09, 2015 at 11:20:55AM +0900, Alexandre Courbot wrote:
>> I should have replied one month ago, but if gpiolib is disabled, how
>> can we use gpiolib-like logic to check the existence of a GPIO?
>>
>> Having GPIO disabled means there is no GPIO support, including the
>> ability to look for GPIOs. -ENOSYS is a well-documented error-code
>> which meaning also applies to the gpio_*_optional functions (we don'=
t
>> have support for the operation you requested). If a driver or
>> architecture really, really needs GPIO support they can require or
>> depend on CONFIG_GPIOLIB, and the problem goes away. If they can wor=
k
>> with and without gpiolib, then they should check for -ENOSYS when th=
ey
>> request GPIOs and behave accordingly.
> What whould be the right behaviour in your eyes? I hope it's not
>
>         if (ret !=3D -ENOSYS)
>                 return ret;
>
>         /* continue and ignore error */

If a consumer absolutely needs a GPIO (most of the drivers out there I
believe), then -ENOSYS can be handled like any other error. If it
doesn't, and the driver is fine without GPIO support as well (meaning
that it can somehow work even if a GPIO is declared, but GPIO support
is not compiled in), then it will need to explicitly handle that
particular error. That case should be rare though - most drivers will
want to propagate -ENOSYS.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
