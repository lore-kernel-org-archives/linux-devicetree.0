From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Energy Micro
Date: Tue, 1 Apr 2014 07:10:39 -0500
Message-ID: <CAL_Jsq+=mCzFiFR3gr3KfBsJ5zGm4ZRRBEwS5VNZ3OA4cQAhmA@mail.gmail.com>
References: <1395756677-6166-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<CAL_Jsq+TVKywqbQ4vePQWjgbZ4Zc_d_CUrx6R33-pHtxVtsAzg@mail.gmail.com>
	<20140325195950.GB15793@pengutronix.de>
	<20140331220334.GB6045@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140331220334.GB6045-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 31, 2014 at 5:03 PM, Uwe Kleine-K=F6nig
<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hello,
>
> On Tue, Mar 25, 2014 at 08:59:50PM +0100, Uwe Kleine-K=F6nig wrote:
>> On Tue, Mar 25, 2014 at 11:51:33AM -0500, Rob Herring wrote:
>> > On Tue, Mar 25, 2014 at 9:11 AM, Uwe Kleine-K=F6nig
>> > <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> > > There are already patches floating around to add
>> > > energymicro,efm32-{i2c,serial,spi} as compatible strings.
>> >
>> > "Patches floating around" is not a very convincing argument why
>> > "silabs" should not just be used instead. I have no problem taking
>> > this, but if changing to silabs is possible, we may want to do tha=
t.
>> I think energymicro is still the right prefix, because back when efm=
32
>> was created it was still Energy Micro. Or am I wrong here?
> Some of these patches entered next in the meantime, affected are:
>
>         1b5b23718b84 i2c: efm32: new bus driver
>         12f6dd860cf8 spi: efm32: use $vendor,$device scheme for compa=
tible string
>
> A third patch is in gregkh's queue, Subject: "[PATCH] serial: efm32: =
use
> $vendor,$device scheme for compatible string", Message-Id:
> 1395755954-18988-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org .
>
> (Wolfram, I just noticed that I failed to fix the binding docs for th=
e
> changed compatible string. Should I send a fixup or a v5?)
>
> If I should better use "silabs,..." instead of "energymicro,..." I'd
> like to have that sorted out before 3.15-rc1.
>
> Thoughts?

Okay, energymicro is fine.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
