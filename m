From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and
 GXBB
Date: Wed, 14 Sep 2016 10:36:44 +0200
Message-ID: <1473842204.2954.13.camel@pengutronix.de>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
         <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
         <m260q6jibf.fsf@baylibre.com>
         <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg@mail.gmail.com>
         <e3b1f611-d6f6-c98b-a53b-98e94ef5bd96@codethink.co.uk>
         <m2eg4ui0nl.fsf@baylibre.com>
         <ffdd0188-72bc-4575-f997-e8547f4c31d2@codethink.co.uk>
         <CAFBinCC4gkMrJtertYevg_hXDLJEZ0PqfKKLL5UKXo8B=SXsPw@mail.gmail.com>
         <m2sht9gkau.fsf@baylibre.com>
         <CAFBinCDohOoFP_3GC+=tt6S7sPS308ao-yf+oGhdfwo-N-JnAA@mail.gmail.com>
         <1473780508.10237.22.camel@pengutronix.de>
         <CAFBinCC+izGS72TZuiiBu=DjtSmoZXRZ6r76M6rC8W7UTpSD6g@mail.gmail.com>
         <7hzinbmh40.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7hzinbmh40.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 13.09.2016, 17:59 -0700 schrieb Kevin Hilman:
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
> 
> > On Tue, Sep 13, 2016 at 5:28 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> 
> [...]
> 
> >>> I added Philipp and Hans to this thread - maybe they can comment on this.
> >>> To sum it up, our problem is:
> >>> - there are two separate USB PHYs on Meson GXBB
> >>> - both are sharing the same reset line (provided by the reset-meson driver)
> >>> - during initialization of the PHYs we must only call
> >>> reset_control_reset(rstc) once (if we do it for the first *and* second
> >>> PHY then the first PHY gets confused once the second PHY uses the
> >>> reset because the first PHY's state is reset as well)
> >>
> >> If you have an initially asserted reset line and you can enable the
> >> first module by deasserting the reset via reset_control_deassert (and
> >> reset_control_assert to signal when the module may be disabled again
> >> after use), shared resets are for you.
> >>
> >> If you need a reset pulse or have no direct control over the reset line,
> >> (device_reset), the reset framework currently has no solution for this.
> >> The ugly thing about reset_control_once would be that it can't re-reset
> >> modules when unloading and reloading driver modules.
> >
> > The corresponding reset driver in question is reset-meson, which only
> > implements reset (assert/deassert are not implemented). However, I
> > don't know if this is due to hardware design.
> > I think the hardware implements the latter, but maybe Neil can give
> > more information here (I currently don't have access to my board so I
> > cannot test how the hardware actually behaves).
> 
> It's implemented that way because the hardware only supports a reset
> pulse.

Would it be possible to bring down both PHYs drivers, pull the reset
line once, and then bring the drivers back up again on this hardware?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
