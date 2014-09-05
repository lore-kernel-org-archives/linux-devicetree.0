From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RESEND v5 1/5] usb: host: ehci-st: Add EHCI support for ST STB devices
Date: Fri, 05 Sep 2014 20:30:49 +0200
Message-ID: <3890179.kgPZYmEVZm@wuerfel>
References: <1409937829-23708-1-git-send-email-peter.griffin@linaro.org> <202755915.brE74x99uQ@wuerfel> <20140905181636.GA1715@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140905181636.GA1715@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 05 September 2014 19:16:36 Peter Griffin wrote:
> On Fri, 05 Sep 2014, Arnd Bergmann wrote:
> 
> > On Friday 05 September 2014 18:23:45 Peter Griffin wrote:
> > > +struct st_platform_priv {
> > > +       struct clk *clks[USB_MAX_CLKS];
> > > +       struct clk *clk48;
> > > +       struct reset_control *rst;
> > > +       struct reset_control *pwr;
> > > +       struct phy *phy;
> > > +};
> > 
> > Any reason why this is in a shared header file? It looks like
> > duplicating the structure under two different names would
> > actually be shorter and keep the drivers more readable as they'd
> > be self-contained, even when they have the exact same structure.
> 
> The only reason was it was a identical structure so I put it in a shared
> header file. I can unabstract it if you want?

Yes, I think that would be an improvement. Everything looks great to me
otherwise, at least after a brief look.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
