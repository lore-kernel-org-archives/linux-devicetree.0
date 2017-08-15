From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: iwg20d-q7: Add RTC support
Date: Tue, 15 Aug 2017 17:45:55 +0200
Message-ID: <20170815154555.GB26748@verge.net.au>
References: <1502197465-61546-1-git-send-email-biju.das@bp.renesas.com>
 <1502197465-61546-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUU5fb6G7Wc9ZzfFhLxcUuZFakPdVGh3q_cfUzxZ1AarA@mail.gmail.com>
 <KL1PR06MB1702571F2F9B75205A11280AB88C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <KL1PR06MB1702571F2F9B75205A11280AB88C0-k6wCOA2IOKSx7cDWSRonpW0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 14, 2017 at 02:26:08PM +0000, Biju Das wrote:
> 
> 
> > -----Original Message-----
> > From: geert.uytterhoeven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org [mailto:geert.uytterhoeven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> > On Behalf Of Geert Uytterhoeven
> > Sent: 14 August 2017 15:12
> > To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland
> > <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>; Magnus
> > Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>;
> > Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Subject: Re: [PATCH 1/2] ARM: dts: iwg20d-q7: Add RTC support
> >
> > On Tue, Aug 8, 2017 at 3:04 PM, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wrote:
> > > Define the iWave RainboW-G20D-Qseven board dependent part of the RTC
> > > device node.
> > >
> > > Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> >
> > > @@ -54,3 +59,16 @@
> > >                 micrel,led-mode = <1>;
> > >         };
> > >  };
> > > +
> > > +&i2c2 {
> > > +       pinctrl-0 = <&i2c2_pins>;
> > > +       pinctrl-names = "default";
> > > +
> > > +       status = "okay";
> > > +       clock-frequency = <400000>;
> > > +
> > > +       rtc@68 {
> > > +               compatible = "bq32000";
> >
> > "ti,bq32000"
> 
> Thanks. I will change this.

Thanks, I have dropped this patch for now.
Please submit a v2.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
