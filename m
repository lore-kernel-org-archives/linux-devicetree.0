From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/2] mfd: syscon: Add hardware spinlock support
Date: Mon, 22 Jan 2018 13:43:36 +0000
Message-ID: <20180122134336.e7phrckbpwvxwsfz@dell>
References: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
 <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
 <20180111152219.yzit67dzdshi3cxs@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180111152219.yzit67dzdshi3cxs@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Jan 2018, Lee Jones wrote:
> On Mon, 25 Dec 2017, Baolin Wang wrote:
> 
> > Some system control registers need hardware spinlock to synchronize
> > between the multiple subsystems, so we should add hardware spinlock
> > support for syscon.
> > 
> > Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> > Changes since v6:
> >  - Treat hwlock id 0 as valid for regmap.
> > 
> > Changes since v5:
> >  - Fix the case that hwspinlock is not enabled.
> > 
> > Changes since v4:
> >  - Add one exapmle to show how to add hwlock.
> >  - Fix the coding style issue.
> > 
> > Changes since v3:
> >  - Add error handling for of_hwspin_lock_get_id()
> > 
> > Changes since v2:
> >  - Add acked tag from Rob.
> > 
> > Changes since v1:
> >  - Remove timeout configuration.
> >  - Modify the binding file to add hwlocks.
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.txt |    8 ++++++++
> >  drivers/mfd/syscon.c                             |   19 +++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> 
> Applied, thanks.

In order to avoid confusion, I should like to tell you that this patch
is applied for v4.17, not v4.16.

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
