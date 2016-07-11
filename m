From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] drivers/perf: arm-pmu: Handle per-interrupt affinity
 mask
Date: Mon, 11 Jul 2016 15:47:06 +0100
Message-ID: <20160711144706.GA27013@arm.com>
References: <1467815627-4061-1-git-send-email-marc.zyngier@arm.com>
 <20160711143716.GA9267@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160711143716.GA9267@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 11, 2016 at 09:37:16AM -0500, Rob Herring wrote:
> On Wed, Jul 06, 2016 at 03:33:47PM +0100, Marc Zyngier wrote:
> > On a big-little system, PMUs can be wired to CPUs using per CPU
> > interrups (PPI). In this case, it is important to make sure that
> > the enable/disable do happen on the right set of CPUs.
> > 
> > So instead of relying on the interrupt-affinity property, we can
> > use the actual percpu affinity that DT exposes as part of the
> > interrupt specifier. The DT binding is also updated to reflect
> > the fact that the interrupt-affinity property shouldn't be used
> > in that case.
> > 
> > Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> > ---
> > * From v1:
> >   - propagate the error if irq_get_percpu_devid_partition fails
> > 
> >  Documentation/devicetree/bindings/arm/pmu.txt |  4 +++-
> 
> I acked v1, please add acks.

This is queued in arm64/for-next/core, but I spotted your Ack and added
it when I sent the patch to Catalin.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
