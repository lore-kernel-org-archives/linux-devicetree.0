From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and
 GXBB
Date: Thu, 15 Sep 2016 12:30:50 +0200
Message-ID: <1473935450.5624.12.camel@pengutronix.de>
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
         <1473842236.6816.0.camel@pengutronix.de>
         <CAFBinCDuj_nHtQ9xs0LMmqZT7Yr9SUw24_H2nAwULT7e9kRXag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCDuj_nHtQ9xs0LMmqZT7Yr9SUw24_H2nAwULT7e9kRXag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

Am Mittwoch, den 14.09.2016, 23:23 +0200 schrieb Martin Blumenstingl:
[...]
> > We could add a triggered flag or a counter to struct reset_control, and
> > have reset_control_reset_once do nothing if it is already set /
> > incremented. Since the reset_control goes away with the last consumer,
> > the shared reset line would get triggered again after unbinding both PHY
> > devices.
> I guess that'd do the trick for us:
> - we could use devm_reset_control_get_optional_shared() during probe
> - power_on would then call reset_control_reset()
> - the code in reset_control_reset would be changed: the if
> (WARN_ON(rstc->shared)) would be removed. then we return 0 if
> (rstc->shared && atomic_read(&rstc->shared_triggered)). otherwise we
> proceed with the old logic, except that we use
> atomic_set(&rstc->shared_triggerred, 1) in case of success (if an
> error was returned we leave it as "not triggered").
> 
> Let me know if you want me to (at least try to) implement that and send an RFC.

Yes, please give it a try. reset_control_reset should still WARN if the
deassert count is set, and reset_(de)assert should do so if triggered is
set. Mixing the two won't work. And it should be documented that shared
reset_control_reset may do nothing if the reset was already triggered by
another consumer.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
