From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: armv7-m: add unit name to interrupt-controller
Date: Mon, 4 Apr 2016 08:42:48 +0200
Message-ID: <CAGhQ9Vxyf1m6mCpFZdfFymA-_PO9KsGuvPaBBrPxxbSEHT9eUA@mail.gmail.com>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
	<1459290646-3592-2-git-send-email-manabian@gmail.com>
	<20160404060558.GY6191@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160404060558.GY6191-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 April 2016 at 08:05, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hello Joachim,
>
> On Wed, Mar 30, 2016 at 12:30:40AM +0200, Joachim Eastwood wrote:
>> Add unit name to nvic to remove the following warning:
>>  Warning (unit_address_vs_reg): Node /nv-interrupt-controller has a =
reg
>>                               or ranges property, but no unit name
>>
>> Also correct the node name to 'interrupt-controller' while changing =
the
>> line.
>>
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Looks right,
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Thanks, Uwe.


Unless any of the other Cortex-M platform maintainers (added more CCs)
has any objections I'll take this through the lpc18xx tree. I will
send a pull request to arm-soc with this soon.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
