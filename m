Return-Path: <SRS0=VgGF=NO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37137 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbeKDG1i (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 4 Nov 2018 01:27:38 -0500
Date: Sat, 3 Nov 2018 22:15:04 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181103211504.5vi5jnsus3sppm7s@pengutronix.de>
References: <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com>
 <20181012090612.63f2p45d24gpilsm@pengutronix.de>
 <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com>
 <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
 <CAMRc=McH7taDJXaVTLYZ-1E+hkwxKon6RwjuKzBSgB9LZq7H1w@mail.gmail.com>
 <20181015200331.ux5pb5cohtbjskc6@pengutronix.de>
 <CAMRc=Mf+PAvG=gb339GNBCQ1yE1+sGyG5zkM86u3im82f-t+Gw@mail.gmail.com>
 <20181018191646.np2mdkcjtrzen65z@pengutronix.de>
 <CACRpkdbiSrpzhCwu6CdX9+_xqkELgG2HyJG0tmnCKEbwPPd2ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbiSrpzhCwu6CdX9+_xqkELgG2HyJG0tmnCKEbwPPd2ng@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Bartosz Golaszewski <brgl@bgdev.pl>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Einar Vading <einar.vading@axis.com>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 30, 2018 at 01:45:29PM +0100, Linus Walleij wrote:
> On Thu, Oct 18, 2018 at 9:16 PM Uwe Kleine-K�nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > [Bartosz]
> > > I do believe that having a single driver will cause less confusion in
> > > the future and make it less likely that someone needing another
> > > testing future will try to get merged a third separate driver. Linus
> > > will have the last word of course but personally I'd like to work
> > > towards extending gpio-mockup.
> >
> > I won't argue here. Iff you think gpio-simulator is good to take without
> > merging with gpio-mockup I'm willing to work on the (other) identified
> > weaknesses.
> 
> We just don't want to have to maintain two synthetic drivers for this.
> 
> libgpiod has an extensive set of tests:
> https://github.com/brgl/libgpiod/tree/master/tests
> 
> If gpio-simulator should replace gpio-mockup, all it needs to do
> is pass all these tests without changes. That is the beauty of
> test driven development.

Just from a quick glance, it won't be able to pass without modifications
(which I think should be fine). The place that won't work is
event_worker() which hardcodes some things specific to the mockup
driver (i.e. the sysfs path).

> However I would have a serious allergic reaction to any
> "merge this now fix any tests later" or "not my problem to
> pass these tests" approach.

I agree here. gpio-mockup shouldn't be deleted if that breaks libgpiod.

> A slot-in replacement doing all that gpio-mockup does and then some
> would likely be accepted on the condition that gpio-mockup is deleted
> at the same time, as that would prove it is a bigger and better swiss
> army knife for GPIO simulation/mockuping.

Not sure I find the time to work on this in the near future.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
