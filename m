From: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 2/4] watchdog: ts4800: add new driver for TS-4800 watchdog
Date: Tue, 27 Oct 2015 17:51:35 -0400
Message-ID: <20151027215135.GA4676@localhost>
References: <1445978021-13961-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1445978021-13961-3-git-send-email-damien.riegel@savoirfairelinux.com>
 <CADhT+wdWcYMQ_ZPhcGOye3oP=6N+Yos+sbqV20E5x5Hmfm8ycw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADhT+wdWcYMQ_ZPhcGOye3oP=6N+Yos+sbqV20E5x5Hmfm8ycw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 04:20:52PM -0500, Dinh Nguyen wrote:
> On Tue, Oct 27, 2015 at 3:33 PM, Damien Riegel
> <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org> wrote:
> > Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> > ---
> >  .../devicetree/bindings/watchdog/ts4800-wdt.txt    |  12 ++
> >  drivers/watchdog/Kconfig                           |   9 +
> >  drivers/watchdog/Makefile                          |   1 +
> >  drivers/watchdog/ts4800_wdt.c                      | 212 +++++++++++++++++++++
> >  4 files changed, 234 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
> >  create mode 100644 drivers/watchdog/ts4800_wdt.c
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
> > new file mode 100644
> > index 0000000..06bdb5f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
> > @@ -0,0 +1,12 @@
> > +Technologic Systems Watchdog
> > +
> > +Required properties:
> > +- compatible : must be "ts,ts4800-wdt"
> > +- reg : physical base address and length of memory mapped region
> > +
> > +Example:
> > +
> > +wdt1: wdt@b0010000 {
> > +       compatible = "ts,ts4800-wdt";
> > +       reg = <0xb0010000 0x1000>;
> > +};
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 241fafd..cf30f3b 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -417,6 +417,15 @@ config NUC900_WATCHDOG
> >           To compile this driver as a module, choose M here: the
> >           module will be called nuc900_wdt.
> >
> > +config TS4800_WATCHDOG
> > +       tristate "TS-4800 Watchdog"
> > +       depends on SOC_IMX51
> 
> From the DTS, I saw that this watchdog is on an FPGA, is it limited to only
> the i.MX51?

Actually, no. I took a quick look at other TS's boards and it is used on
other boards: TS-4740, TS-4712, TS-4710, and TS-4700 (Marvell
PXA166/PXA168); TS-4600 (iMX283).

But as far as I know, these boards are not supported by Linux. So,
should I add more "depends on" even if we don't support them yet; or
should I let it as is and add other dependances when adding support for
other boards ?
I could also drop that line completely.

Anyway, I will rename the driver to have a more generic name. Is
ts_wdt.c fine for you ?
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
