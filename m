From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] EDAC: Add AMD Seattle SoC EDAC
Date: Tue, 20 Oct 2015 18:41:45 +0100
Message-ID: <20151020174144.GD4943@leverpostej>
References: <1445282597-18999-1-git-send-email-brijeshkumar.singh@amd.com>
 <20151019205236.GB453@leverpostej>
 <56266F7E.6030404@amd.com>
 <20151020165744.GE31130@pd.tnic>
 <20151020172654.GC4943@leverpostej>
 <20151020173639.GH31130@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151020173639.GH31130-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 20, 2015 at 07:36:39PM +0200, Borislav Petkov wrote:
> On Tue, Oct 20, 2015 at 06:26:55PM +0100, Mark Rutland wrote:
> > > Btw, how much of this is implementing generic A57 functionality?
> > 
> > The driver is entirely A57 generic.
> > 
> > > If a lot, can we make this a generic a57_edac driver so that multiple
> > > vendors can use it?
> > 
> > Yes.
> 
> Ok, cool.
> 
> > > How fast and how ugly can something like that become?
> > 
> > Not sure I follow.
> 
> In the sense that some vendor might require just a little bit different
> handling or maybe wants to read some vendor-specific registers in
> addition to the architectural ones.
> 
> Then we'll start adding vendor-specific hacks to that generic driver.
> And therefore the question how fast and how ugly such hacks would
> become.
> 
> I guess we'll worry about that when we get there...
> 
> So Brijesh, if you only need generic, architectural functionality,
> please call it arm64_edac or so and let's add it so that other arm64
> vendors can use it too.

Please note that this is specific to Cortex-A57, not ARMv8 or aarch64.

It is an IMPLEMENTATION DEFINED feature as implemented by Cortex-A57,
which by definition is not implemented by other CPUs. It is not provided
by the ARM architecture.

So this cannot be arm64_edac, but could potentially be cortex_a57_edac.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
