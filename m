From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v4 1/2] ARM: socfpga: support suspend to ram
Date: Thu, 28 May 2015 15:21:43 -0500
Message-ID: <alpine.DEB.2.02.1505281520410.31038@linuxheads99>
References: <1432317735-29413-1-git-send-email-atull@opensource.altera.com>
 <1432317735-29413-2-git-send-email-atull@opensource.altera.com>
 <20150525124133.GF9943@amd>
 <alpine.DEB.2.02.1505261638190.19205@linuxheads99>
 <20150526215617.GA3137@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150526215617.GA3137@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Delicious Quinoq <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 26 May 2015, Pavel Machek wrote:

> Hi!
> 
> > Thanks for the feedback.
> > 
> > Yes I agree.
> > 
> > One possibility is that I could add a suspend function to EDAC that
> > always fails with a helpful message like "Suspend with EDAC not
> > supported."  If someone wants to suspend, they'll have to take the
> > EDAC out of the device tree so its probe will bomb out.  I'm not
> > sure how normal it is to have suspend functions in the kernel
> > that always fail, though.
> 
> "Interesting" solution, but better than config exclusion, I'd say.
> 
> > > > +	/*
> > > > +	 * This code assumes that the bootloader has already
> > > > +	 * properly configured the sdram controller:
> > > 
> > > Which bootloaders can do that? 
> > 
> > Whatever bootloader is configuring the sdram controller for the
> > board.
> 
> Ok, so direct question: will mainline u-boot 2015.04 configure the
> controller correctly?

Should be in 2015.07

Alan Tull

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
