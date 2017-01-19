From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [RFC v2 4/5] DT bindings documentation for Synopsys UDC platform
 driver
Date: Thu, 19 Jan 2017 12:17:11 -0800
Message-ID: <efabd5cc-eafb-0887-852e-24b0f52019cf@gmail.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
 <1484640308-25976-5-git-send-email-raviteja.garimella@broadcom.com>
 <20170119173659.jeao5pqtlepmidek@rob-hp-laptop>
 <f86f32cd-8fed-c30f-d647-8f7992013458@broadcom.com>
 <95544a16-08aa-f983-465c-e557b4d3785e@gmail.com>
 <dce7e46f-66f7-7c8d-182d-ba8347082b52@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dce7e46f-66f7-7c8d-182d-ba8347082b52@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, Raviteja Garimella <raviteja.garimella@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/19/2017 12:07 PM, Scott Branden wrote:
> Hi Florian,
> 
> On 17-01-19 11:40 AM, Florian Fainelli wrote:
>> On 01/19/2017 11:30 AM, Scott Branden wrote:
>>> Hi Rob,
>>>
>>> On 17-01-19 09:36 AM, Rob Herring wrote:
>>>> On Tue, Jan 17, 2017 at 01:35:07PM +0530, Raviteja Garimella wrote:
>>>>> This patch adds device tree bindings documentation for Synopsys
>>>>> USB device controller platform driver.
>>>>
>>>> Bindings describe h/w, not drivers.
>>>>>
>>>>> Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
>>>>> ---
>>>>>  .../devicetree/bindings/usb/snps,dw-ahb-udc.txt    | 27
>>>>> ++++++++++++++++++++++
>>>>>  1 file changed, 27 insertions(+)
>>>>>  create mode 100644
>>>>> Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>>>>> b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>>>>> new file mode 100644
>>>>> index 0000000..0c18327
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>>>>> @@ -0,0 +1,27 @@
>>>>> +Synopsys USB Device controller.
>>>>> +
>>>>> +The device node is used for Synopsys Designware Cores AHB
>>>>> +Subsystem Device Controller (UDC).
>>>>> +
>>>>> +This device node is used by UDCs integrated it Broadcom's
>>>>> +Northstar2 and Cygnus SoC's.
>>>>
>>>> You need compatible strings for these in addition.
>>>>
>>> We don't need compatibility strings when an IP block is integrated into
>>> an SoC.  Otherwise each time we add the IP block to a new SoC we would
>>> need to update ever linux driver that supports that SoC.  That doesn't
>>> make sense?
>>
>> You probably do need such a thing, here is how the compatible strings
>> for IP blocks integrated into SoCs could be used:
>>
>> - provide a compatible strings which describes exactly the integration
>> of this peripheral into a given SoC, e.g: brcm,udc-ns2, the reason for
>> that is that you want to be able to capture the specific IP block
>> integration into a specific SoC and all its quirks
>>
>> - if the block has its own revision scheme (and it can be relied on),
>> provide it: brcm,udc-v1.2 and that is probably the most meaningful
>> compatible string for a client program here
>>
>> - have a some kind of fallback/catchall compatible string that describes
>> the block: brcm,udc which may also work just fine, although is not
>> preferred
>>
>> Defining compatible strings is meant to avoid making (possibly
>> incompatible) Device Tree binding changes in the future, and you always
>> have the liberty as a client program (OS, bootloader) to match only the
>> compatible strings you care about, from the most specific (which
>> includes the exact SoC) to the least specific.
>>
>> The key thing is that, if the full set of compatible strings are present
>> and available, you can retroactively fix your driver to be more
>> specific, very much less so your Device Tree blob (although there is
>> disagreement).
>>
> The driver stands alone from the SoC and does not need compatibility
> strings per SoC.  New SoCs will use the exact same block.

Even if you take the exact same block and put it in a different SoC,
that's still an integration work that 99% of the time goes just fine
because the validation worked great, and the 1% of the time where you
need to capture an integration bug, you are glad this SoC-specific
compatible string exists such that you can work around it in the driver.

One way to solve that is to use SoC specific compatible strings because
that presents itself as a self-contained and standardized way, or you
can have your driver call into a piece of code that reads the SoC
type/revision, but AFAICT this seems to be frowned upon because it
presents some kind of layering violation.

> 
> We don't add compatibility strings to any other drivers when we add the
> same block to a new SoC.

Ideally we would define new compatible strings for each new SoC we tape
out, yet don't necessarily match them in client programs, but just
define them as a safeguard in case something went wrong at the
integration stage that is discovered after the fact.
-- 
Florian
