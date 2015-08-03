From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESENT] powerpc: dts: don't fall back to fsl,pq3-gpio for
 fsl,mpc8572-gpio devices
Date: Mon, 3 Aug 2015 10:22:40 +0200
Message-ID: <CACRpkdbL14+oP6wb4C7C1KndmeJHNNGytu9xvx4Wxns=zXUDKg@mail.gmail.com>
References: <1438334166-12579-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1438334166-12579-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 31, 2015 at 11:16 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> While the handling of fsl,pq3-gpio and fsl,mpc8572-gpio is done in th=
e
> same driver and the two hardly differ, the latter controller needs a
> workaround for an erratum in the gpio_get callback. To make this
> difference more explicit remove fsl,pq3-gpio from the list of
> compatibles for mpc8572 machines.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
