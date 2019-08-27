From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v2 3/3] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Tue, 27 Aug 2019 16:47:32 +0800
Message-ID: <e4ddb571-e003-7bb8-a04c-795423ea0e2f@linux.intel.com>
References: <9bd455a628d4699684c0f9d439b64af1535cccc6.1566208109.git.eswara.kota@linux.intel.com>
 <20190824210302.3187-1-martin.blumenstingl@googlemail.com>
 <2c71003f-06d1-9fe2-2176-94ac816b40e3@linux.intel.com>
 <CAFBinCDSJdq6axcYM7AkqvzUbc6X1zfOZ85Q-q1-FPwVxvgnpA@mail.gmail.com>
 <9ba19f08-e25a-4d15-8854-8dc4f9b6faca@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9ba19f08-e25a-4d15-8854-8dc4f9b6faca@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, gustavo.pimentel@synopsys.com, hch@infradead.org, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

Hi Martin,

On 8/27/2019 11:09 AM, Chuan Hua, Lei wrote:
[...]
>
>
>> now I am wondering:
>> - if we don't have to disable the interrupt line (once it is enabled),
>> why can't we enable all of these interrupts at initialization time
>> (instead of doing it on-demand)?
> Good point! we even can remote map_irq patch, directly call
>
> of_irq_parse_and_map_pci as other drivers do.

Irrespective of disabling, imo interrupts(A/B/C/D) should be enabled 
when they are requested; which happens during map_irq() call.

>> - if the interrupts do have to be disabled again (that is what I
>> assumed so far) then where is this supposed to happen? (my solution
>> for this was to implement a simple interrupt controller within the
>> PCIe driver which only supports enable/disable. disclaimer: I didn't
>> ask the PCI or interrupt maintainers for feedback on this yet)
>>
>> [...]
>
> We can implement one interrupt controller, but personally, it has too
>
> much overhead. If we follow this way, almost all modules of all old
>
> lantiq SoCs can implement one interrupt controller. Maybe you can check
>
> with PCI maintainer for their comments.
>
[...]
>>> This is needed. In the old driver, we fixed this by fixup. The original
>>> comment as follows,
>>>
>>> /*
>>>    * The root complex has a hardwired class of 
>>> PCI_CLASS_NETWORK_OTHER or
>>>    * PCI_CLASS_BRIDGE_HOST, when it is operating as a root complex this
>>>    * needs to be switched to * PCI_CLASS_BRIDGE_PCI
>>>    */
>> that would be a good comment to add if you really need it
>> can you please look at dw_pcie_setup_rc (from 
>> pcie-designware-host.c), it does:
>>    /* Enable write permission for the DBI read-only register */
>>    dw_pcie_dbi_ro_wr_en(pci);
>>    /* Program correct class for RC */
>>    dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
>>    /* Better disable write permission right after the update */
>>    dw_pcie_dbi_ro_wr_dis(pci);
>>
>> so my understanding is that there is a functional requirement to set
>> the class to PCI_CLASS_BRIDGE_PCI
>> however, that requirement is already covered by pcie-designware-host.c
> I will task Dilip to check if we can use dwc one.
dw_pcie_setup_rc () cannot be called here because, it is not doing 
PCI_CLASS_BRIDGE_PCI set alone, it is configuring many other things.

[...]


Regards,

Dilip
