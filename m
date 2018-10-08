From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 1/9] PCI: mediatek: Using slot's devfn for compare to
 fix mtk_pcie_find_port logic
Date: Mon, 8 Oct 2018 11:02:17 +0800
Message-ID: <1538967737.6246.5.camel@mhfsdcap03>
References: <1538129080-8206-1-git-send-email-honghui.zhang@mediatek.com>
 <1538129080-8206-2-git-send-email-honghui.zhang@mediatek.com>
 <20181001143641.GB13049@red-moon>
 <20181002105945.GA27736@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181002105945.GA27736-4tUPXFaYRHv6sAKXYmQ0tx/iLCjYCKR+VpNB7YpNyf8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-10-02 at 11:59 +0100, Lorenzo Pieralisi wrote:
> On Mon, Oct 01, 2018 at 03:36:41PM +0100, Lorenzo Pieralisi wrote:
> > On Fri, Sep 28, 2018 at 06:04:32PM +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > > From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > 
> > > The Mediatek's host controller has two slots, each with it's own control
> > > registers. The host driver need to identify which slot was connected
> > > in order to access the device's configuration space. There's problem
> > > for current host driver to find out which slot was connected to for
> > > a given EP device.
> > > 
> > > Assuming each slot have connect with one EP device as below:
> > > 
> > >                 host bridge
> > >   bus 0 --> __________|_______
> > >            |                  |
> > >            |                  |
> > >          slot 0             slot 1
> > >   bus 1 -->|        bus 2 --> |
> > >            |                  |
> > >          EP 0               EP 1
> > > 
> > > During PCI enumeration, system software will scan all the PCI device
> > > starting from devfn 0. So it will get the proper port for slot0 and
> > > slot1 device when using PCI_SLOT(devfn) for match. But it will get
> > > the wrong slot for EP1: The devfn will be start from 0 when scanning
> > > EP1 behind slot1, it will get port0 since the PCI_SLOT(EP1) is match
> > > for port0's slot value. So the host driver should not using EP's devfn
> > > but the slot's devfn(the slot which EP was connected to) for match.
> > > 
> > > This patch fix the mtk_pcie_find_port's logic by using the slot's
> > > devfn for match if finding device connected to the subordinate bus.
> > > 
> > > Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  drivers/pci/controller/pcie-mediatek.c | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > index 9999dae..264e03f 100644
> > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > @@ -337,10 +337,25 @@ static struct mtk_pcie_port *mtk_pcie_find_port(struct pci_bus *bus,
> > >  {
> > >  	struct mtk_pcie *pcie = bus->sysdata;
> > >  	struct mtk_pcie_port *port;
> > > +	struct pci_dev *dev = NULL;
> > > +
> > > +	/*
> > > +	 * Walk the bus hierarchy to get the devfn value
> > > +	 * of the port in the root bus.
> > > +	 */
> > > +	while (bus && bus->number) {
> > > +		dev = bus->self;
> > > +		bus = dev->bus;
> > 
> > If you add:
> > 
> > devfn = dev->devfn;
> > 
> > here
> > 
> > > +	}
> > > +
> > > +	list_for_each_entry(port, &pcie->ports, list) {
> > > +		/* Using slot's devfn to compare for subordinary bus. */
> > > +		if (dev)
> > > +			devfn = dev->devfn;
> > 
> > You can remove this ugly hunk altogether (and dev initialization
> > to NULL).
> 
> Hi Honghui,
> 
> if you can make this change I would merge this series, it has been
> been in the mailing lists for a while, I can make that change too
> just let me know please.
> 

Hi, Lorenzo, sorry for the late reply.

I tried your advise and it works fine.

I will send another version to fix this, as well as to add a fix tag in
the commit message of patch 6.

thanks

> Thanks,
> Lorenzo
