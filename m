From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Fri, 13 Sep 2019 13:12:03 +0300
Message-ID: <20190913101203.GE2680@smile.fi.intel.com>
References: <20190906112044.GF9720@e119886-lin.cambridge.arm.com>
 <959a5f9b-2646-96e3-6a0f-0af1051ae1cb@linux.intel.com>
 <20190909083117.GH9720@e119886-lin.cambridge.arm.com>
 <22857835-1f98-b251-c94b-16b4b0a6dba2@linux.intel.com>
 <20190911103058.GP9720@e119886-lin.cambridge.arm.com>
 <aefd143c-66d2-b303-d992-a55f75a91b2e@linux.intel.com>
 <20190912082517.GA9720@e119886-lin.cambridge.arm.com>
 <cd73e351-5633-bfa8-a4dc-77357d917a0b@linux.intel.com>
 <DM6PR12MB4010AEA876F20E25FFFE06BDDAB00@DM6PR12MB4010.namprd12.prod.outlook.com>
 <b7a1b955-4c3e-6ffe-ec6a-04afe33e70cd@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b7a1b955-4c3e-6ffe-ec6a-04afe33e70cd@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dilip Kota <eswara.kota@linux.intel.com>
Cc: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Andrew Murray <andrew.murray@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "robh@kernel.org" <robh@kernel.org>, "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cheol.yong.kim@intel.com" <cheol.yong.kim@intel.com>, "chuanhua.lei@linux.intel.com" <chuanhua.lei@linux.intel.com>, "qi-ming.wu@intel.com" <qi-ming.wu@intel.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 13, 2019 at 05:20:26PM +0800, Dilip Kota wrote:
> On 9/12/2019 6:49 PM, Gustavo Pimentel wrote:
> > On Thu, Sep 12, 2019 at 10:23:31, Dilip Kota
> > <eswara.kota@linux.intel.com> wrote:

> > Hi, I just return from parental leave, therefore I still trying to get
> > the pace in mailing list discussion.
> > 
> > However your suggestion looks good, I agree that can go into DesignWare
> > driver to be available to all.
> Thanks Gustavo for the confirmation, i will add it in the next patch version
> > 
> > Just a small request, please do in general:
> > s/designware/DesignWare
> 
> Sorry, i didnt understand this.

It means the reviewer asks you to name DesignWare in this form,
i.o.w. designware -> DesignWare.

`man 1 sed` gives you more about it :-)

-- 
With Best Regards,
Andy Shevchenko
