From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] dt-bindings: configuration of parent clocks and clock frequency
Date: Thu, 06 Feb 2014 08:43:05 -0800
Message-ID: <20140206164305.22158.43488@quantum>
References: <52DE6CAB.10008@samsung.com> <20140201030614.9977.80501@quantum>
 <52F0DA07.6050903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52F0DA07.6050903-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Marek Szyprowski (2014-02-04 04:16:07)
> Hello,
> 
> On 2014-02-01 04:06, Mike Turquette wrote:
> > Quoting Sylwester Nawrocki (2014-01-21 04:48:43)
> > > 5. Similarly to the regulator bindings the clock names could be appended
> > >   to name of a DT property:
> > >
> > >  [clk_name]-assigned-clock-parent = <...>;
> > >  [clk_name]-assigned-clock-rate = <...>;
> >
> > I have always been partial to the way that the reg framework does its
> > [reg_name]-supply. We could shorten it to something like:
> >
> > [clk-name]-asn-parent = ....
> > [clk-name]-asn-rate = ...
> >
> > This is actually the format that was discussed at the ARM kernel summit
> > IIRC.
> 
> I think that "[clk-name]-clk-parent" and "[clk-name]-clk-rate" will be a bit
> more descriptive names instead of quite ambiguous "asn".

+1

Regards,
Mike

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
