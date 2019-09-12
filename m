From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v3 2/2] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Thu, 12 Sep 2019 15:01:16 +0800
Message-ID: <fb258f36-1733-da02-bae3-6062163ba607@linux.intel.com>
References: <cover.1567585181.git.eswara.kota@linux.intel.com>
 <35316bac59d3bc681e76d33e0345f4ef950c4414.1567585181.git.eswara.kota@linux.intel.com>
 <20190905104517.GX9720@e119886-lin.cambridge.arm.com>
 <20190905114016.GF2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905114016.GF2680@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Andrew Murray <andrew.murray@arm.com>
Cc: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 9/5/2019 7:40 PM, Andy Shevchenko wrote:
> On Thu, Sep 05, 2019 at 11:45:18AM +0100, Andrew Murray wrote:
>> On Wed, Sep 04, 2019 at 06:10:31PM +0800, Dilip Kota wrote:
>>> Add support to PCIe RC controller on Intel Universal
>>> Gateway SoC. PCIe controller is based of Synopsys
>>> Designware pci core.
>>> +config PCIE_INTEL_AXI
> I think that name here is too generic. Classical x86 seems not using this.

This PCIe driver is for the Intel Gateway SoCs. So how about naming it is as
"pcie-intel-gw"; pcie-intel-gw.c and Kconfig as PCIE_INTEL_GW.

Andrew Murray is ok with this naming, please let me know your view.

>
>>> +        bool "Intel AHB/AXI PCIe host controller support"
>>> +        depends on PCI_MSI
>>> +        depends on PCI
>>> +        depends on OF
>>> +        select PCIE_DW_HOST
>>> +        help
>>> +          Say 'Y' here to enable support for Intel AHB/AXI PCIe Host
>>> +	  controller driver.
>>> +	  The Intel PCIe controller is based on the Synopsys Designware
>>> +	  pcie core and therefore uses the Designware core functions to
>>> +	  implement the driver.
