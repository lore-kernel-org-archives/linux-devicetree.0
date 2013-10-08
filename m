From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH RFC 1/2] ARM: imx6qdl: provide pinctrl configurations
	for DAT3 pull-down
Date: Tue, 8 Oct 2013 10:00:15 +0100
Message-ID: <20131008090015.GC25034@n2100.arm.linux.org.uk>
References: <20131005112147.GX12758@n2100.arm.linux.org.uk> <E1VSPw9-0004Ug-BF@rmk-PC.arm.linux.org.uk> <20131007055340.GB3739@S2101-09.ap.freescale.net> <20131007180357.GS12758@n2100.arm.linux.org.uk> <20131008015426.GA7480@S2101-09.ap.freescale.net> <52537378.1020904@wwwdotorg.org> <20131008034048.GB7480@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131008034048.GB7480-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 11:40:51AM +0800, Shawn Guo wrote:
> On Mon, Oct 07, 2013 at 08:52:40PM -0600, Stephen Warren wrote:
> > >>> &usdhc1 {
> > >>> 	pinctrl-names = "default";
> > >>> 	pinctrl-0 = <&pinctrl_usdhc1_1 &pinctrl_usdhc1_1_dat3cd>;
> > >>> 	...
> > >>> 	status = "okay";
> > >>> };
> > >>
> > >> Are you sure that this will always be the case?  This would assume that
> > >> the pinctrl entries are always processed sequentially.
> > > 
> > > That will always be the case per my understanding.  Otherwise, I would
> > > be so surprised.  Are you seeing any case that the entries are not
> > > processed sequentially?
> > 
> > Given the way the Linux code currently works, I think that will
> > currently happen in practice. However, there's nothing in the pinctrl DT
> > binding documentation that guarantees (or even mentions) such semantics.
> 
> Ah, that's Russell's point, I guess.  I think it makes perfect sense to
> make this clear in the binding doc, as this "overwrite mechanism" can be
> very helpful.  I will send a patch for it.

Exactly - otherwise we're just relying on implementation details.
There's nothing at present which mandates starting at the first entry
and working through sequentially to the last entry, which means another
implementation can choose to operate in the opposite order.  If it does,
what you're suggesting won't work so well.

However, there's another point to consider.  In cases like this, we will
cause a glitch on the pin.  When we process the initial set, we will set
the pull-up high, and then later set it low.  That may not be a problem
in this case, but that's not to say it won't be in every case, and that's
something which also needs to be considered.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
