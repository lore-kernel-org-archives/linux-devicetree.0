From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Add Cavium ARCH_THUNDER2 platform
Date: Sun, 5 Feb 2017 09:19:25 +0000
Message-ID: <20170205091924.GA51205@localhost>
References: <1486256226-43889-1-git-send-email-jnair@caviumnetworks.com>
 <db4646cc-b020-aa9f-7ab1-54bfca6e1588@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <db4646cc-b020-aa9f-7ab1-54bfca6e1588-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 04, 2017 at 07:11:17PM -0800, Florian Fainelli wrote:
> Le 02/04/17 à 16:57, Jayachandran C a écrit :
> > Here's the updated patchset, please let me know if thereare any
> > comments.  If a pull request is needed(with a public git tree), I
> > can set one up on github.
> > 
> > This patchset adds support for the new ThunderX2 CN99XX processor
> > family.
> > 
> > Changes are to add: the config option, the required device tree files,
> > the device tree bindings documentation and the defconfig entry.
> > 
> > Changes from v1 -> v2:
> > * split Kconfig.platforms changes and device tree changes
> > * Added MAINTAINERS entry
> 
> Does that mean support for Broadcom Vulcan should be removed then? If
> do, do you mind doing that?

I will send patches for removing ARCH_VULCAN once ARCH_THUNDER2 is
merged and the driver dependencies are updated by another set of patches.
Otherwise we have a problem (especially in distribution config files)
of not being able to select the drivers (for SPI, GPIO and I2C) for the
platform.

Thanks,
JC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
