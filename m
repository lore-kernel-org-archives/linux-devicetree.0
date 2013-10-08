From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] clk: new driver for efm32 SoC
Date: Tue, 8 Oct 2013 09:40:03 +0200
Message-ID: <20131008074003.GL10079@pengutronix.de>
References: <1376510693-12491-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131007212354.7445.84276@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131007212354.7445.84276@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Mike,

On Mon, Oct 07, 2013 at 02:23:54PM -0700, Mike Turquette wrote:
> Quoting Uwe Kleine-K=F6nig (2013-08-14 13:04:53)
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > Hello,
> >=20
> > I'm not sure if there is a naming convention for #defines in header=
s below
> > dt-bindings. I named my clocks clk_$namefromreferencemanual to have=
 some
> > namespacing.
> >=20
> > The clock stuff on the different variants of efm32 are similar, but
> > different enough to not be able to use the same driver, so this is =
only
> > for the Giant Gecko (efm32gg) variant, still I used "efm32" in some
> > places because the other variants would fit there, too. (For
> > include/dt-bindings/clock/efm32-cmu.h I would need some #ifdefs, is=
 that
> > OK or should the name of the defines include efm32gg? (That would m=
ake
> > the names still longer and so more ugly.))
>=20
> The DT experts should weigh in on having #ifdef's in the header, but =
I
> think we should avoid that. Better to explicitly list the clocks for =
the
> variant used. You can add "gg" to this or not, I don't care, but the
> future variants will need some suffix, or maybe their own header.
I thought the way to go is to move the clocks into the device tree. Tha=
t
would get rid of the need to add #ifdefs. OTOH even if the correspondin=
g
clocks are using different register offsets and bit locations, I don't
see a need to also take a different clock index, so currently I think i=
t
should be possible to not need #ifdefs even if we're going with this
patch's approach.

So if you are happy with my patch as is, it would be great if you'd tak=
e
it. We could also switch to in-dt-defined clocks later when it becomes
easier while maintaining this interface for compatibility.

> I'm happy with this patch and can take it for 3.13. Care to add a
> changelog?
What do you want? I could add:

	This patch adds support for the clocks provided by the Clock
	Management Unit of Energy Micro's efm32 Giant Gecko SoCs
	including device tree bindings.

I will send a v2 that makes use of the CLK_OF_DECLARE macro and so save=
s
the external init function.

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
