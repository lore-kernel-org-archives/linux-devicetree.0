From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 6/8] PCI: al: Add support for DW based driver type
Date: Mon, 22 Jul 2019 16:15:42 -0500
Message-ID: <20190722211542.GB203187@google.com>
References: <20190718094531.21423-1-jonnyc@amazon.com>
 <20190718094718.25083-2-jonnyc@amazon.com>
 <DM6PR12MB4010913E5408349A600762CADACB0@DM6PR12MB4010.namprd12.prod.outlook.com>
 <d323007c6bf14cb9f90a497a26b66dac151164fc.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d323007c6bf14cb9f90a497a26b66dac151164fc.camel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chocron, Jonathan" <jonnyc@amazon.com>
Cc: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "Gustavo.Pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "Hanoch, Uri" <hanochu@amazon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Wasserstrom, Barak" <barakw@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "Shenhar, Talel" <talel@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2019 at 03:08:18PM +0000, Chocron, Jonathan wrote:
> On Fri, 2019-07-19 at 08:55 +0000, Gustavo Pimentel wrote:
> > On Thu, Jul 18, 2019 at 10:47:16, Jonathan Chocron <jonnyc@amazon.com> wrote:

> > > +static int al_pcie_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct al_pcie *al_pcie;
> > > +	struct dw_pcie *pci;
> > > +	struct resource *dbi_res;
> > > +	struct resource *controller_res;
> > > +	struct resource *ecam_res;
> > > +	int ret;
> > 
> > Please sort the variables following the reverse tree order.
> > 
> Done. 
> 
> I'd think that it would make sense to group variables which have a
> common characteristic (e.g. resources read from the DT), even if it
> mildly breaks the convention (as long as the general frame is longest
> to shortest). Does this sound ok?
> 
> BTW, I couldn't find any documentation regarding the reverse-tree
> convention, do you have a pointer to some?

What I personally do is sort declarations in the order they're used.
