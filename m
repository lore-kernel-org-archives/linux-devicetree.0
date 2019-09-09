From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: intel: Add YAML schemas for the
 PCIe RC controller
Date: Mon, 9 Sep 2019 14:52:19 +0800
Message-ID: <c6c50a77-d55c-5f5c-ee76-01728dbc2ca3@linux.intel.com>
References: <cover.1567585181.git.eswara.kota@linux.intel.com>
 <fe9549470bc06ea0d0dfc80f46a579baa49b911a.1567585181.git.eswara.kota@linux.intel.com>
 <CAFBinCC5SH5OSUqOkLQhE2o7g5OhSuB_PBjsv93U2P=FNS5oPw@mail.gmail.com>
 <20190906091950.GJ2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906091950.GJ2680@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org


On 9/6/2019 5:19 PM, Andy Shevchenko wrote:
> On Thu, Sep 05, 2019 at 10:31:29PM +0200, Martin Blumenstingl wrote:
>> On Wed, Sep 4, 2019 at 12:11 PM Dilip Kota <eswara.kota@linux.intel.com> wrote:
>>> +  phy-names:
>>> +    const: pciephy
>> the most popular choice in Documentation/devicetree/bindings/pci/ is "pcie-phy"
>> if Rob is happy with "pciephy" (which is already part of two other
>> bindings) then I'm happy with "pciephy" as well
> I'm not Rob, though I consider more practical to have a hyphenated variant.

I am okay to "pcie-phy". I will update it in next patch version.

Regards,
Dilip

>
