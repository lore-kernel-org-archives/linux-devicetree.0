From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/6] arm: dts: marvell: Add missing #phy-cells to
 usb-nop-xceiv
Date: Tue, 21 Nov 2017 21:09:22 +0100
Message-ID: <20171121200922.GD30040@lunn.ch>
References: <20171109222614.5719-1-robh@kernel.org>
 <20171109222614.5719-3-robh@kernel.org>
 <CAL_JsqJhq7TqdaS+i8yk8rRJM0hH2hyk8eybXsnR0D8QoncXZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJhq7TqdaS+i8yk8rRJM0hH2hyk8eybXsnR0D8QoncXZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 21, 2017 at 12:29:48PM -0600, Rob Herring wrote:
> On Thu, Nov 9, 2017 at 4:26 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > "usb-nop-xceiv" is using the phy binding, but is missing #phy-cells
> > property. This is probably because the binding was the precursor to the phy
> > binding.
> >
> > Fixes the following warning in Marvell dts files:
> >
> > Warning (phys_property): Missing property '#phy-cells' in node ...
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> > Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > Please apply to Marvell tree.
> 
> Ping.
> 
> Arnd, can you apply if you'd like the warnings fixed and Marvell
> maintainers don't respond.

Hi Rob

Patches submitted a week before the merge window opens are generally
deferred to the next cycle. I expect that once -rc1 is out, Gregory
will pick up this patch.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
