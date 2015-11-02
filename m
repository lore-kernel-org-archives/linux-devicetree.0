From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/6] drivers: psci: replace psci firmware calls
Date: Mon, 2 Nov 2015 14:08:26 +0100
Message-ID: <20151102130825.GA16849@ermac>
References: <1446106888-8983-1-git-send-email-jens.wiklander@linaro.org>
 <1446106888-8983-3-git-send-email-jens.wiklander@linaro.org>
 <20151102115539.GC29657@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151102115539.GC29657-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 02, 2015 at 11:55:39AM +0000, Will Deacon wrote:
> On Thu, Oct 29, 2015 at 09:21:24AM +0100, Jens Wiklander wrote:
> > Switch to use a generic interface for issuing SMC/HVC based on ARM SMC
> > Calling Convention. Removes now the now unused psci-call.S.
> > 
> > Signed-off-by: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/kernel/Makefile      |  1 -
> >  arch/arm/kernel/psci-call.S   | 31 -------------------------------
> >  arch/arm64/kernel/Makefile    |  2 +-
> >  arch/arm64/kernel/psci-call.S | 28 ----------------------------
> >  drivers/firmware/psci.c       | 21 +++++++++++++++++++--
> >  5 files changed, 20 insertions(+), 63 deletions(-)
> >  delete mode 100644 arch/arm/kernel/psci-call.S
> >  delete mode 100644 arch/arm64/kernel/psci-call.S
> 
> [...]
> 
> > diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
> > index 42700f0..53c9606 100644
> > --- a/drivers/firmware/psci.c
> > +++ b/drivers/firmware/psci.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/pm.h>
> >  #include <linux/printk.h>
> >  #include <linux/psci.h>
> > +#include <linux/arm-smccc.h>
> >  #include <linux/reboot.h>
> >  
> >  #include <uapi/linux/psci.h>
> > @@ -56,8 +57,6 @@ struct psci_operations psci_ops;
> >  
> >  typedef unsigned long (psci_fn)(unsigned long, unsigned long,
> >  				unsigned long, unsigned long);
> > -asmlinkage psci_fn __invoke_psci_fn_hvc;
> > -asmlinkage psci_fn __invoke_psci_fn_smc;
> >  static psci_fn *invoke_psci_fn;
> >  
> >  enum psci_function {
> > @@ -70,6 +69,24 @@ enum psci_function {
> >  
> >  static u32 psci_function_id[PSCI_FN_MAX];
> >  
> > +static unsigned long __invoke_psci_fn_hvc(unsigned long a0, unsigned long a1,
> > +			unsigned long a2, unsigned long a3)
> 
> Minor comment, but could we keep these argument names the same as before
> please?

You mean function_id, arg0, arg1... instead? I guess I should update
arm-smccc.h also then.

> 
> > +{
> > +	struct smccc_res res;
> > +
> > +	smccc_hvc(a0, a1, a2, a3, 0, 0, 0, 0, &res);
> 
> It's slightly tempting to use varargs instead of the '0' argument padding,
> but that will probably make the asm code unmanageable.

Agree.

Thanks,
Jens
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
