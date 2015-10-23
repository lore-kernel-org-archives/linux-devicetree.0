From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] EDAC: Add ARM64 EDAC
Date: Fri, 23 Oct 2015 10:51:54 +0100
Message-ID: <562A033A.5050105@arm.com>
References: <1445460097-10260-1-git-send-email-brijeshkumar.singh@amd.com>
 <56282550.4000201@arm.com> <5628F6B5.5080701@amd.com>
 <56299042.5090109@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56299042.5090109-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huxinwei <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23/10/15 02:41, Hanjun Guo wrote:
> Hi Brijesh,
> 
> On 2015/10/22 22:46, Brijesh Singh wrote:
>> Hi Andre,
>>
>> On 10/21/2015 06:52 PM, Andre Przywara wrote:
>>> On 21/10/15 21:41, Brijesh Singh wrote:
>>>> Add support for Cortex A57 and A53 EDAC driver.
>>> Hi Brijesh,
>>>
>>> thanks for the quick update! Some comments below.
>>>
>>>> Signed-off-by: Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>
>>>> CC: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
>>>> CC: pawel.moll-5wv7dgnIgG8@public.gmane.org
>>>> CC: mark.rutland-5wv7dgnIgG8@public.gmane.org
>>>> CC: ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
>>>> CC: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
>>>> CC: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org
>>>> CC: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org
>>>> CC: mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org
>>>> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> CC: guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
>>>> CC: andre.przywara-5wv7dgnIgG8@public.gmane.org
>>>> CC: arnd-r2nGTMty4D4@public.gmane.org
>>>> CC: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> CC: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> ---
>>>>
>>>> v2:
>>>> * convert into generic arm64 edac driver
>>>> * remove AMD specific references from dt binding
>>>> * remove poll_msec property from dt binding
>>>> * add poll_msec as a module param, default is 100ms
>>>> * update copyright text
>>>> * define macro mnemonics for L1 and L2 RAMID
>>>> * check L2 error per-cluster instead of per core
>>>> * update function names
>>>> * use get_online_cpus() and put_online_cpus() to make L1 and L2 register 
>>>>   read hotplug-safe
>>>> * add error check in probe routine
>>>>
>>>>  .../devicetree/bindings/edac/armv8-edac.txt        |  15 +
>>>>  drivers/edac/Kconfig                               |   6 +
>>>>  drivers/edac/Makefile                              |   1 +
>>>>  drivers/edac/cortex_arm64_edac.c                   | 457 +++++++++++++++++++++
>>>>  4 files changed, 479 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/edac/armv8-edac.txt
>>>>  create mode 100644 drivers/edac/cortex_arm64_edac.c
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/edac/armv8-edac.txt b/Documentation/devicetree/bindings/edac/armv8-edac.txt
>>>> new file mode 100644
>>>> index 0000000..dfd128f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/edac/armv8-edac.txt
>>>> @@ -0,0 +1,15 @@
>>>> +* ARMv8 L1/L2 cache error reporting
>>>> +
>>>> +On ARMv8, CPU Memory Error Syndrome Register and L2 Memory Error Syndrome
>>>> +Register can be used for checking L1 and L2 memory errors.
>>>> +
>>>> +The following section describes the ARMv8 EDAC DT node binding.
>>>> +
>>>> +Required properties:
>>>> +- compatible: Should be "arm,armv8-edac"
>>>> +
>>>> +Example:
>>>> +	edac {
>>>> +		compatible = "arm,armv8-edac";
>>>> +	};
>>>> +
>>> So if there is nothing in here, why do we need the DT binding at all (I
>>> think Mark hinted at that already)?
>>> Can't we just use the MIDR as already suggested by others?
>>> Secondly, armv8-edac is wrong here, as this feature is ARM-Cortex
>>> specific and not architectural.
>>>
>> Yes, I was going with Mark suggestion to remove DT binding but then came across these cases which kind of hinted to keep DT binding:
>>
>> * Without DT binding, the driver will always be loaded on arm64 unless its blacklisted.

So I checked the x86 code: the driver is always loaded as soon as the
hardware is there (looking at PCI device IDs from the on-chip
northbridge, for instance). The trick here is to have the Kconfig option
defaulting to "=n", so a kernel builder would have to explicitly enable
this. Android or embedded kernels wouldn't do this, for instance, while
a server distribution would do.
If a user doesn't want to be bothered with the driver, there is always
the possibility of blacklisting the module.
Setting a system policy is IMHO out of scope for a DT binding.

>> * Its possible that other SoC's might handle single-bit and double-bit errors differently compare to 
>>   Seattle platform. In Seattle platform both errors are handled by firmware but if other SoC 
>>   wants OS to handle these errors then they might need DT binding to provide the irq numbers etc.

What do you mean exactly with "firmware handles these errors"?
What would the firmware do? I guess just logging the error and then
possibly reset the register? How would this change the driver?

> I totally agree with you here,  thanks for putting them together.
> Different SoCs may handle the error in different ways, we need
> bindings to specialize them, irq number is a good example :)

But how does this affect this very driver, polling just those two registers?
Where would the interrupt come into the game here? Where is the proposed
DT binding for that interrupt?

AFAICT EL3 firmware handling errors would just hide this information
from the driver, so if the f/w decides to "handle" uncorrectable ECC
errors in a fatal way, there is nothing the driver could do anyway, right?

Can you sketch a concrete example where we would actually need the
driver to know about the firmware capabilities?

Cheers,
Andre.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
