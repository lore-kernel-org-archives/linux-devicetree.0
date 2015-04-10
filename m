From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 5/5] arm64: qcom: add cpu operations
Date: Fri, 10 Apr 2015 11:08:33 +0100
Message-ID: <20150410100832.GB6854@e104818-lin.cambridge.arm.com>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <1428601031-5366-6-git-send-email-galak@codeaurora.org>
 <2294107.GTDFpLFyzQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2294107.GTDFpLFyzQ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 09, 2015 at 11:19:02PM +0200, Arnd Bergmann wrote:
> On Thursday 09 April 2015 12:37:11 Kumar Gala wrote:
> > From: Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > 
> > Add qcom cpu operations for arm-v8 cpus. Implement secondary cpu boot ops
> > As a part of this change update device tree documentation for:
> > 
> > 1. Arm cortex-a ACC device which provides percpu reg
> > 2. Armv8 cortex-a compatible string in arm/cpus.txt
> > 
> > Signed-off-by: Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Signed-off-by: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.txt    |   2 +
> >  Documentation/devicetree/bindings/arm/msm/acc.txt |  19 ++
> >  drivers/soc/qcom/Makefile                         |   1 +
> >  drivers/soc/qcom/cpu_ops.c                        | 343 ++++++++++++++++++++++
> >  4 files changed, 365 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/msm/acc.txt
> 
> I don't want this in drivers/soc. Please find a way to integrate it into the
> arch/arm64 code.

And rename it to something like qc-special-cpu-ops-dont-copy-this.c

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
