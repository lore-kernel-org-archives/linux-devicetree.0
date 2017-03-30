From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 0/6] bus: brcmstb_gisb: add support for GISBv7 arbiter
Date: Thu, 30 Mar 2017 19:19:32 +0100
Message-ID: <20170330181932.GB8062@leverpostej>
References: <20170330002914.7371-1-opendmb@gmail.com>
 <c3182c24-2245-cf2e-32e4-248b8046a30f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c3182c24-2245-cf2e-32e4-248b8046a30f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 09:33:32AM -0700, Florian Fainelli wrote:
> On 03/29/2017 05:29 PM, Doug Berger wrote:
> > This patch set contains changes to enable the GISB arbiter driver
> > on the latest ARM64 architecture Set-Top Box chips from Broadcom.
> > 
> > Since the ARM64 architecture does not support the hooking of low
> > level fault handlers the driver has been adjusted to depend solely
> > on GISB interrupts and notify events to provide diagnostic
> > messaging.  The GISB hardware still triggers bus faults for the
> > processor so the default low-level aborts will occur and will be
> > handled based on the architecture specific kernel implementation.
> > 
> > While this tends to obsure the GISB error messaging it is still
> > reasonable so the same approach is applied to the ARM architecture
> > for consistency.
> > 
> > The patches also correct some issues with the existing driver
> > and add the new register map for the GISBv7 hardware first
> > appearing in the BCM7278 device.
> 
> This all looks great to me, and since there are no more ARM64
> dependencies I can take this via the Broadcom ARM/ARM64 SoC pull requests.
> 
> Mark, are you also happy with this v3?

It looks fine by me.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
