From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/6] PCI: rockchip: Create individual folder for
 rockchip drivers
Date: Thu, 22 Mar 2018 11:30:00 +0000
Message-ID: <20180322113000.GA24976@e107981-ln.cambridge.arm.com>
References: <1520304173-231081-1-git-send-email-shawn.lin@rock-chips.com>
 <1520304202-232891-1-git-send-email-shawn.lin@rock-chips.com>
 <20180320174633.GA137590@bhelgaas-glaptop.roam.corp.google.com>
 <879a4862-d0d5-21fd-6c47-029c795fe78e@rock-chips.com>
 <20180321181940.GA9760@e107981-ln.cambridge.arm.com>
 <7275bd77-016a-2729-482d-2855703d9b56@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7275bd77-016a-2729-482d-2855703d9b56-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 22, 2018 at 09:03:58AM +0800, Shawn Lin wrote:

[...]

> How about renaming drivers/pci/host to drivers/pci/controller,
> and then put all pcie-rockchip* files in there, then we don't
> need add seperate directory containning trivial Kconfig, Makefile.

Yes we can do that but not at -rc6 tail end.

> >>Certainly, I could do that beased on your suggestion, but I would like
> >>to know if this's the final agreement both you and Lorenzo reached. :)
> >
> >Or we can add all EP drivers into drivers/pci/endpoint but then the problem
> >is how to share code between host and endpoint directories and it starts
> >feeling like we are going round in circles.
> 
> I would prefer to rename it to endpoint-framwrok or whatever to clearly
> states it is for framework but not the drivers. All the drivers
> whichever for host or endpoint should be in controller directory.
> 
> >
> >I can merge this series as-is as long as we will rework the directory
> >structure according to this discussion (given that's already late -rc6
> >so directory moves/renames can be disrupting - if feasible at all).
> 
> This sounds super great to me to make this series into -next for some
> days before hitting into v4.17. Then we could simultaneously head up to
> see how we could move forward with this.

Send a last version asap and I will try to merge it for this cycle,
keeping in mind that what we discussed above must be implemented as
soon as a new cycle starts.

Thanks,
Lorenzo
