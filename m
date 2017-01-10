From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ARM: dts: at91: add devicetree for the Axentia
 TSE-850
Date: Tue, 10 Jan 2017 11:42:48 +0100
Message-ID: <20170110104248.iscurq55d7n26gfd@piout.net>
References: <1484035732-31635-1-git-send-email-peda@axentia.se>
 <1484035732-31635-2-git-send-email-peda@axentia.se>
 <20170110092928.hwd4l4k3eyagepco@piout.net>
 <b686fa42-bbfb-dec2-460f-ef00869bc12e@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b686fa42-bbfb-dec2-460f-ef00869bc12e-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/01/2017 at 10:52:56 +0100, Peter Rosin wrote :
> On 2017-01-10 10:29, Alexandre Belloni wrote:
> > Hi,
> > 
> > This needs a commit message, please add one.
> 
> There's not all that much to say, but ok, I'll add something.
> 

It doesn't have to be long but it has to be present.

> > On 10/01/2017 at 09:08:51 +0100, Peter Rosin wrote :
> There's also the benefit of the increased chances of me getting
> notified of changes. I don't mind...
> 

Do you expect changes coming from third parties? I'm fine with it
anyway.

> >> +&main {
> >> +	clock-frequency = <12000000>;
> >> +};
> >> +
> > 
> > I don't think this is needed
> > 
> > 
> 
> "this"? The &main frequency, or all of them?
> 

I meant just main

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
