From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/2] Replace /include/ (dtc) with #include
Date: Mon, 27 Jan 2014 16:31:11 +0000
Message-ID: <20140127163111.GA8358@arm.com>
References: <1389348970-5498-1-git-send-email-pankaj.dubey@samsung.com>
 <52E63DD8.9070909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E63DD8.9070909-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 11:07:04AM +0000, Pankaj Dubey wrote:
> On 01/10/2014 07:16 PM, Pankaj Dubey wrote:
> > Replace /include/ (dtc) with #include (C pre-processor) for all ARM64
> > based SoC dts files.
> >
> > Pankaj Dubey (2):
> >    arm64: dts: use #include for all AppliedMicro device tree files
> >    arm64: dts: use #include for all ARM fast model device tree file
> >
> >   arch/arm64/boot/dts/apm-mustang.dts    |    2 +-
> >   arch/arm64/boot/dts/rtsm_ve-aemv8a.dts |    2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> Gentle ping.

It would be good to include some rationale behind this change and I'm
waiting for the DT guys to ack it.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
