From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: ARM: Mediatek: Document devicetree
 bindings for clock controllers
Date: Thu, 2 Jul 2015 10:52:14 +0800
Message-ID: <1435805534.3526.23.camel@mtksdaap41>
References: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1435633127-31952-3-git-send-email-jamesjj.liao@mediatek.com>
	 <CAGS+omD9Mvz0-RQMc5TsWCPct80S5fyqMn3+-zR7HB9yb7KoDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omD9Mvz0-RQMc5TsWCPct80S5fyqMn3+-zR7HB9yb7KoDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

> > +Required Properties:
> > +
> > +- compatible: Should be:
> > +       - "mediatek,mt8173-imgsys", "syscon"
> > +- #clock-cells: Must be 1
> > +
> > +The imgsys controller uses the common clk binding from
> > +Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> > +
> > +Example:
> > +
> > +imgsys: imgsys@15000000 {
> 
> Since these nodes will be supplying clocks to the rest of the system,
> I think the "name" part of each of these should all be
> "clock-controller", like topckgen and apmixedsys:
> 
>   imgsys: clock-controller@15000000 {

These subsystems (and topckgen also) also contains other functions such
as reset controller, which may be implemented in clk/mediatek/ in the
future. It is suitable to use "clock-controller" as their name?


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
