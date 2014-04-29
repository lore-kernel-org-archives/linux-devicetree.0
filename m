From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 3/5] devicetree: bindings: Document Krait cache error
 interrupts
Date: Tue, 29 Apr 2014 11:34:00 +0100
Message-ID: <20140429103400.GB22015@e102568-lin.cambridge.arm.com>
References: <1396641450-12854-1-git-send-email-sboyd@codeaurora.org>
 <1396641450-12854-4-git-send-email-sboyd@codeaurora.org>
 <20140408153925.GJ30077@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140408153925.GJ30077-fF5Pk5pvG8Y@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 08, 2014 at 04:39:25PM +0100, Borislav Petkov wrote:
> On Fri, Apr 04, 2014 at 12:57:28PM -0700, Stephen Boyd wrote:
> > The Krait L1/L2 error reporting hardware is made up a per-CPU
> > interrupt for the L1 cache and a SPI interrupt for the L2.
> > 
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cache.txt | 48 ++++++++++++++++++++++++-
> >  1 file changed, 47 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/cache.txt b/Documentation/devicetree/bindings/arm/cache.txt
> > index b90fcc7c53cf..d7357e777399 100644
> > --- a/Documentation/devicetree/bindings/arm/cache.txt
> > +++ b/Documentation/devicetree/bindings/arm/cache.txt
> 
> Right, that's http://www.spinics.net/lists/arm-kernel/msg308540.html
> 
> So whoever picks those patches up, Lorenzo's doc needs to be in his tree
> first too.

Sorry for the delay in replying. Those cache bindings need an ACK to get
merged, and were introduced so that idle states can retrieve power domain
information for caches. I am going to revive the idle bindings thread
to see what we can/should merge of these bindings as things stand, I
really hope this won't block the series any further, otherwise we can
rework the patches so that this series can get in first, or simplify my
series to allow both to get merged as soon as possible without compromising
future requirements.

Thanks,
Lorenzo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
