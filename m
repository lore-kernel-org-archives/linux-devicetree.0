From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 00/15] PCI: rockchip: Cleanups against v10
Date: Sat, 3 Sep 2016 12:17:15 -0500
Message-ID: <20160903171715.GA30488@localhost>
References: <20160902154501.8650.99790.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <5d1e6d5f-c8d9-8fcd-41dd-cabc3027f66a@rock-chips.com>
 <20160903163419.GA23589@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160903163419.GA23589@localhost>
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
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 03, 2016 at 11:34:19AM -0500, Bjorn Helgaas wrote:
> On Sat, Sep 03, 2016 at 10:37:24AM +0800, Shawn Lin wrote:
> > Hi Bjorn,
> > 
> > On 2016/9/2 23:53, Bjorn Helgaas wrote:
> > >These are cleanups against 2098142ae87d, the current pci/host-rockchip
> > >head in my tree.
> > >
> > 
> > Thanks so much for you to help clean up this driver, since I think
> > it should be my duty to take over this.  Hope not too late for me to
> > help your cleanup. I think the v2 cannot compile gracefully without
> > the
> > appended patch. After fixing these compile errors, I backported this
> > driver entirely to my downstream 4.4 tree and it worked fine without
> > regression.
> > 
> > Once again, thanks for doing this. :)
> 
> No problem, thanks a lot for checking it out.  A lot of this stuff is
> things I'm trying to do to other drivers as well, and I wouldn't have
> noticed or bothered except that I've been trying to make all the
> drivers more consistent.
> 
> I applied your fixes and pushed it to pci/host-rockchip-wip again.

And I squashed everything and pushed the result to pci/host-rockchip.
Hopefully we're converging, so this is the branch I intend to merge to
-next.

> 
> > >---
> > >
> > >Bjorn Helgaas (15):
> > >      Remove unused symbols, unnecessary parens, other minor comments from
> > >      Rename pcie_read() and pcie_write() to rockchip_pcie_read() and
> > >      Always use "rockchip" as the pointer to per-device struct.
> > >      Rename struct rockchip_pcie_port to struct rockchip_pcie.
> > >      Use a local "dev" to avoid repetition of "rockchip->dev".
> > >      Add comment about why 32-bit read/modify/write isn't safe.
> > >      Simplify the confusing HIWORD_UPDATE scheme.
> > >      Remove duplicate CSR definition.
> > >      Move CSR bases into definition.
> > >      Group related CSR definitions together.
> > >      Rename PCIE_CORE_RC_CONF_SCC_SHIFT to match similar definitions.
> > >      Rename ROCKCHIP_PCIE_RPIFR1_INTR_MASK and ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT
> > >      The register at PCIE_CLIENT_BASE presumably has a name of its own.  Add a
> > >      Simplify testing of link status and speed testing.
> > >      Move msleeps to address Guenter's comments.
> > >
> > >
> > > drivers/pci/host/pcie-rockchip.c |  842 ++++++++++++++++++--------------------
> > > 1 file changed, 391 insertions(+), 451 deletions(-)
> > >
> > >
> > >
> > 
> > 
> > -- 
> > Best Regards
> > Shawn Lin
> 
> > diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
> > index 754d24b..2bc1c35 100644
> > --- a/drivers/pci/host/pcie-rockchip.c
> > +++ b/drivers/pci/host/pcie-rockchip.c
> > @@ -931,7 +931,7 @@ static int rockchip_pcie_prog_ob_atu(struct rockchip_pcie *rockchip,
> >  	u32 ob_addr_0;
> >  	u32 ob_addr_1;
> >  	u32 ob_desc_0;
> > -	void __iomem *aw_offset;
> > +	u32 aw_offset;
> >  
> >  	if (region_no >= MAX_AXI_WRAPPER_REGION_NUM)
> >  		return -EINVAL;
> > @@ -955,13 +955,13 @@ static int rockchip_pcie_prog_ob_atu(struct rockchip_pcie *rockchip,
> >  	ob_addr_1 = upper_addr;
> >  	ob_desc_0 = (1 << 23 | type);
> >  
> > -	rockchip_pcie_writel(rockchip, ob_addr_0,
> > +	rockchip_pcie_write(rockchip, ob_addr_0,
> >  			     PCIE_CORE_OB_REGION_ADDR0 + aw_offset);
> > -	rockchip_pcie_writel(rockchip, ob_addr_1,
> > +	rockchip_pcie_write(rockchip, ob_addr_1,
> >  			     PCIE_CORE_OB_REGION_ADDR1 + aw_offset);
> > -	rockchip_pcie_writel(rockchip, ob_desc_0,
> > +	rockchip_pcie_write(rockchip, ob_desc_0,
> >  			     PCIE_CORE_OB_REGION_DESC0 + aw_offset);
> > -	rockchip_pcie_writel(rockchip, 0,
> > +	rockchip_pcie_write(rockchip, 0,
> >  			     PCIE_CORE_OB_REGION_DESC1 + aw_offset);
> >  
> >  	return 0;
> > @@ -973,7 +973,7 @@ static int rockchip_pcie_prog_ib_atu(struct rockchip_pcie *rockchip,
> >  {
> >  	u32 ib_addr_0;
> >  	u32 ib_addr_1;
> > -	void __iomem *aw_offset;
> > +	u32 aw_offset;
> >  
> >  	if (region_no > MAX_AXI_IB_ROOTPORT_REGION_NUM)
> >  		return -EINVAL;
> > @@ -988,8 +988,8 @@ static int rockchip_pcie_prog_ib_atu(struct rockchip_pcie *rockchip,
> >  	ib_addr_0 |= (lower_addr << 8) & PCIE_CORE_IB_REGION_ADDR0_LO_ADDR;
> >  	ib_addr_1 = upper_addr;
> >  
> > -	rockchip_pcie_writel(rockchip, ib_addr_0, PCIE_RP_IB_ADDR0 + aw_offset);
> > -	rockchip_pcie_writel(rockchip, ib_addr_1, PCIE_RP_IB_ADDR1 + aw_offset);
> > +	rockchip_pcie_write(rockchip, ib_addr_0, PCIE_RP_IB_ADDR0 + aw_offset);
> > +	rockchip_pcie_write(rockchip, ib_addr_1, PCIE_RP_IB_ADDR1 + aw_offset);
> >  
> >  	return 0;
> >  }
> 
