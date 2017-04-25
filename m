From: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/5 v3] usb: host: add DT bindings for faraday fotg2
Date: Tue, 25 Apr 2017 21:07:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1704252104010.17792@T420s>
References: <20170421204058.6206-1-linus.walleij@linaro.org> <alpine.LNX.2.00.1704241846300.15211@T420s> <CACRpkda-2OQZJDQndrDg_d4iK4oecz4HNSCQPSztBFTG5Rwg8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkda-2OQZJDQndrDg_d4iK4oecz4HNSCQPSztBFTG5Rwg8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus

On Tue, 25 Apr 2017, Linus Walleij wrote:

> On Mon, Apr 24, 2017 at 6:53 PM, Hans Ulli Kroll
> <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> 
> > Got NAK'ed from Rob on some ealier round due missing "device mode" on this
> > IP. I've blatantly overrided this to a host only driver.
> >
> > These are the needed changes in DT to support both modes
> > Note the -dr at the end of fotg210, to reflect this in an dual role device
> 
> OK I understood the discussion such that the compatible should
> simply be ""faraday,fotg210" as that is the name of the hardware
> IP block. This is the name of the hardware name in the Faraday
> page:
> http://www.faraday-tech.com/html/Product/IPProduct/InterfaceIP/USB2_0.htm
> 
> Any other string implies how it is used, so that was what I understood
> as the reason to reject it with the "-hcd" (host controller device) suffix.
> 
> > +- dr_mode : indicates the working mode for "fotg210-dr" compatible
> > +   controllers.  Can be "host", "peripheral". Default to
> > +   "host" if not defined for backward compatibility.
> 
> This seems right, so it is part of the generic bindings, correct?
> 
> >  usb@68000000 {
> > -       compatible = "cortina,gemini-usb", "faraday,fotg210";
> > +       compatible = "cortina,gemini-usb", "faraday,fotg210-dr";
> 
> But this would be wrong, because the compatible should only
> indicate what kind of hardware it is, not how it is going to be used
> (whether as host only, slave only or dual-role (OTG).
> 

for compatible I think yes.
But in Rob's opinion we missed the device part of the controller.

Greetings
Hans Ulli Kroll
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
