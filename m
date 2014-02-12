From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RFC/PATCH 0/3] Add devicetree scanning for randomness
Date: Wed, 12 Feb 2014 13:51:56 -0500
Message-ID: <20140212185156.GP27395@titan.lakedaemon.net>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
 <201402121251.06280.arnd@arndb.de>
 <20140212174554.GM27395@titan.lakedaemon.net>
 <20140212182000.GJ5554@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212182000.GJ5554-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 11:20:00AM -0700, Jason Gunthorpe wrote:
> On Wed, Feb 12, 2014 at 12:45:54PM -0500, Jason Cooper wrote:
> 
> > The bootloader would then load this file into ram, and pass the
> > address/size to the kernel either via dt, or commandline.  kaslr (run in
> > the decompressor) would consume some of this randomness, and then
> > random.c would consume the rest in a non-crediting initialization.
> 
> Sure is a neat idea, but I think in general it would probably be smart
> to include the entire FDT blob in the early random pool, that way you
> get MACs and other machine unique data too.

Sure.

> From there it is a small step to encourage bootloaders to include
> boot-time-variable data in the DT like like 'boot time of day', 'cycle
> counter', 'random blob', etc.

I like it.

> Then you just need the bootloader to dump the random-seed file into a
> DT property.

Yes, see my response to Arnd re the binding.  I'm also interested in
making it easier for devices already in the field.  iow, without
upgrading the bootloader.

> Or have the bootloader fetch randomness from any HWRNG it has a driver
> for. (eg a TPM)

Depends on who you're protecting against.  I'd prefer to have that
called out as a separate blob in the DT so the kernel could decide
whether to trust it explicitly, or mix it like random.c already does
with RDRAND.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
