From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: intel: Add YAML schemas for the
 PCIe RC controller
Date: Fri, 6 Sep 2019 18:39:43 +0800
Message-ID: <e8ead144-dd4a-0ffc-6266-920f045250f3@linux.intel.com>
References: <cover.1567585181.git.eswara.kota@linux.intel.com>
 <fe9549470bc06ea0d0dfc80f46a579baa49b911a.1567585181.git.eswara.kota@linux.intel.com>
 <54ec6a30-69d8-a4af-95fa-2f457d605142@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54ec6a30-69d8-a4af-95fa-2f457d605142@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

Hi Chuan Hua,

On 9/5/2019 10:23 AM, Chuan Hua, Lei wrote:
> Hi Dilip,
>
> On 9/4/2019 6:10 PM, Dilip Kota wrote:
>> The Intel PCIe RC controller is Synopsys Designware
>> based PCIe core. Add YAML schemas for PCIe in RC mode
>> present in Intel Universal Gateway soc.
>>
>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>> ---
>> changes on v3:
>>     Add the appropriate License-Identifier
>>     Rename intel,rst-interval to 'reset-assert-us'
> rst->interval to reset-assert-ms(should be typo error)

Sure, i will fix it. That's a typo error.
Thanks for pointing it.

Regards
Dilip
