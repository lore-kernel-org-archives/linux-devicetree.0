From: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH v2] EDAC: Add ARM64 EDAC
Date: Fri, 23 Oct 2015 09:41:22 +0800
Message-ID: <56299042.5090109@huawei.com>
References: <1445460097-10260-1-git-send-email-brijeshkumar.singh@amd.com> <56282550.4000201@arm.com> <5628F6B5.5080701@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5628F6B5.5080701@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brijesh Singh <brijeshkumar.singh@amd.com>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dougthompson@xmission.com, bp@alien8.de, mchehab@osg.samsung.com, devicetree@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, Huxinwei <huxinwei@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Brijesh,

On 2015/10/22 22:46, Brijesh Singh wrote:
> Hi Andre,
>
> On 10/21/2015 06:52 PM, Andre Przywara wrote:
>> On 21/10/15 21:41, Brijesh Singh wrote:
>>> Add support for Cortex A57 and A53 EDAC driver.
>> Hi Brijesh,
>>
>> thanks for the quick update! Some comments below.
>>
>>> Signed-off-by: Brijesh Singh <brijeshkumar.singh@amd.com>
>>> CC: robh+dt@kernel.org
>>> CC: pawel.moll@arm.com
>>> CC: mark.rutland@arm.com
>>> CC: ijc+devicetree@hellion.org.uk
>>> CC: galak@codeaurora.org
>>> CC: dougthompson@xmission.com
>>> CC: bp@alien8.de
>>> CC: mchehab@osg.samsung.com
>>> CC: devicetree@vger.kernel.org
>>> CC: guohanjun@huawei.com
>>> CC: andre.przywara@arm.com
>>> CC: arnd@arndb.de
>>> CC: linux-kernel@vger.kernel.org
>>> CC: linux-edac@vger.kernel.org
>>> ---
>>>
>>> v2:
>>> * convert into generic arm64 edac driver
>>> * remove AMD specific references from dt binding
>>> * remove poll_msec property from dt binding
>>> * add poll_msec as a module param, default is 100ms
>>> * update copyright text
>>> * define macro mnemonics for L1 and L2 RAMID
>>> * check L2 error per-cluster instead of per core
>>> * update function names
>>> * use get_online_cpus() and put_online_cpus() to make L1 and L2 register 
>>>   read hotplug-safe
>>> * add error check in probe routine
>>>
>>>  .../devicetree/bindings/edac/armv8-edac.txt        |  15 +
>>>  drivers/edac/Kconfig                               |   6 +
>>>  drivers/edac/Makefile                              |   1 +
>>>  drivers/edac/cortex_arm64_edac.c                   | 457 +++++++++++++++++++++
>>>  4 files changed, 479 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/edac/armv8-edac.txt
>>>  create mode 100644 drivers/edac/cortex_arm64_edac.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/edac/armv8-edac.txt b/Documentation/devicetree/bindings/edac/armv8-edac.txt
>>> new file mode 100644
>>> index 0000000..dfd128f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/edac/armv8-edac.txt
>>> @@ -0,0 +1,15 @@
>>> +* ARMv8 L1/L2 cache error reporting
>>> +
>>> +On ARMv8, CPU Memory Error Syndrome Register and L2 Memory Error Syndrome
>>> +Register can be used for checking L1 and L2 memory errors.
>>> +
>>> +The following section describes the ARMv8 EDAC DT node binding.
>>> +
>>> +Required properties:
>>> +- compatible: Should be "arm,armv8-edac"
>>> +
>>> +Example:
>>> +	edac {
>>> +		compatible = "arm,armv8-edac";
>>> +	};
>>> +
>> So if there is nothing in here, why do we need the DT binding at all (I
>> think Mark hinted at that already)?
>> Can't we just use the MIDR as already suggested by others?
>> Secondly, armv8-edac is wrong here, as this feature is ARM-Cortex
>> specific and not architectural.
>>
> Yes, I was going with Mark suggestion to remove DT binding but then came across these cases which kind of hinted to keep DT binding:
>
> * Without DT binding, the driver will always be loaded on arm64 unless its blacklisted.
> * Its possible that other SoC's might handle single-bit and double-bit errors differently compare to 
>   Seattle platform. In Seattle platform both errors are handled by firmware but if other SoC 
>   wants OS to handle these errors then they might need DT binding to provide the irq numbers etc.

I totally agree with you here,  thanks for putting them together.
Different SoCs may handle the error in different ways, we need
bindings to specialize them, irq number is a good example :)

Thanks
Hanjun
