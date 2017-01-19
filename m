From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v1 2/2] arm: dts: mt2701: add nor flash node
Date: Thu, 19 Jan 2017 09:14:28 +0100
Message-ID: <20170119091428.598eb987@bbrezillon>
References: <d7b866ad-5b2f-62d3-3aa3-6fa42803d625@gmail.com>
        <b850b751-1d8d-0053-cf1f-d5314542e5c3@gmail.com>
        <20170113172825.75d545a3@bbrezillon>
        <86c997be-f500-eaa1-3ba5-d21cff6223b7@gmail.com>
        <20170113175628.1793f433@bbrezillon>
        <0fafcd8d-cf99-de6b-728f-5e3637810b68@gmail.com>
        <20170114092958.022f2fc8@bbrezillon>
        <e7fa1542-f0e2-0e45-23b3-25d6491ae40d@gmail.com>
        <20170116094032.6f471f11@bbrezillon>
        <20170117143650.5db87148@free-electrons.com>
        <20170118222010.ivc6jxpnrumemvdf@rob-hp-laptop>
        <20170119103829.524ce715@free-electrons.com>
        <CAL_Jsq+EyHtC7THLCJcwgtVtVESMOdmi3T3bBxgOqJt6BCtCHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+EyHtC7THLCJcwgtVtVESMOdmi3T3bBxgOqJt6BCtCHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, 18 Jan 2017 20:51:08 -0600
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Wed, Jan 18, 2017 at 5:38 PM, Thomas Petazzoni
> <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hello,
> >
> > On Wed, 18 Jan 2017 16:20:10 -0600, Rob Herring wrote:
> >  
> >> > > Rob, Mark, any opinion?  
> >> >  
> >>
> >> Sigh, is how to do compatibles really not yet understood?  
> >
> > Well, it seems like not everyone necessarily understands what is the
> > best strategy to adopt (me included).
> >  
> >> > I agree that a clarification would be good. There are really two
> >> > options:
> >> >
> >> >  1. Have two compatible strings in the DT, the one that matches the
> >> >     exact SoC where the IP is found (first compatible string) and the
> >> >     one that matches some other SoC where the same IP is found (second
> >> >     compatible string). Originally, Linux only supports the second
> >> >     compatible string in its device driver, but if it happens that a
> >> >     difference is found between two IPs that we thought were the same,
> >> >     we can add support for the first compatible string in the driver,
> >> >     with a slightly different behavior.  
> >>
> >> This. And no wildcards in the compatible string.  
> >
> > OK. So it means that today we do something like:
> >
> >         compatible = "baz,foo-12", "baz,foo-00";
> >
> > and support only baz,foo-00 in the driver. If tomorrow we discover
> > that there is in fact a difference between the two IP blocks, we can
> > add support for baz,foo-12 in the driver, and handle the differences.
> >
> > But then, the DT still contains:
> >
> >         compatible = "baz,foo-12", "baz,foo-00";
> >
> > and therefore pretends that the IP block is compatible with
> > "baz,foo-00" which is in fact *not* the case. It was a mistake to
> > consider it as compatible. So we keep living with a DT that has
> > incorrect information.  
> 
> I wouldn't say it's a mistake necessarily. The old compatible would
> probably work to some extent. I'd assume it was tested to some level.
> Or it could be other changes exposing a difference.

One last question and I'm done: is something like that acceptable?

	compatible = "<vendor>,<old-soc>","<vendor>,<new-soc>";

This can happen when someone adds support for an unsupported feature
on a brand new SoC, and then someone else use the same driver for an
older SoC embedding the same IP but still wants to add a new compatible
just in case these 2 IPs appear to be slightly different.

Here the order of compat strings is no longer following a clear rule
like 'most-specific compatible first' or 'newest IP/SoC version first',
it's completely dependent on the order these IPs were supported in the
OS (Linux). I'm perfectly fine with that BTW, just want to make sure
this is authorized.

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
