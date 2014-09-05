From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v5 1/5] usb: host: ehci-st: Add EHCI support for
 ST STB devices
Date: Fri, 5 Sep 2014 19:16:36 +0100
Message-ID: <20140905181636.GA1715@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1409937829-23708-1-git-send-email-peter.griffin@linaro.org>
 <1409937829-23708-2-git-send-email-peter.griffin@linaro.org>
 <202755915.brE74x99uQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <202755915.brE74x99uQ@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Fri, 05 Sep 2014, Arnd Bergmann wrote:

> On Friday 05 September 2014 18:23:45 Peter Griffin wrote:
> > +struct st_platform_priv {
> > +       struct clk *clks[USB_MAX_CLKS];
> > +       struct clk *clk48;
> > +       struct reset_control *rst;
> > +       struct reset_control *pwr;
> > +       struct phy *phy;
> > +};
> 
> Any reason why this is in a shared header file? It looks like
> duplicating the structure under two different names would
> actually be shorter and keep the drivers more readable as they'd
> be self-contained, even when they have the exact same structure.

The only reason was it was a identical structure so I put it in a shared
header file. I can unabstract it if you want?

> 
> Do both drivers use all fields?

Yes they are. I thought the 48Mhz clock would only be used by ohci, but annoyingly it also
clocks the reset logic of the ehci block as well.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
