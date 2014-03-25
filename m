From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Energy Micro
Date: Tue, 25 Mar 2014 20:59:50 +0100
Message-ID: <20140325195950.GB15793@pengutronix.de>
References: <1395756677-6166-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAL_Jsq+TVKywqbQ4vePQWjgbZ4Zc_d_CUrx6R33-pHtxVtsAzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+TVKywqbQ4vePQWjgbZ4Zc_d_CUrx6R33-pHtxVtsAzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 25, 2014 at 11:51:33AM -0500, Rob Herring wrote:
> On Tue, Mar 25, 2014 at 9:11 AM, Uwe Kleine-K=F6nig
> <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > There are already patches floating around to add
> > energymicro,efm32-{i2c,serial,spi} as compatible strings.
>=20
> "Patches floating around" is not a very convincing argument why
> "silabs" should not just be used instead. I have no problem taking
> this, but if changing to silabs is possible, we may want to do that.
I think energymicro is still the right prefix, because back when efm32
was created it was still Energy Micro. Or am I wrong here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
