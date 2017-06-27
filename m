From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: Re: [PATCH 1/3] ARM: dts: Bindings for Altera Quadspi Controller
 Version 2
Date: Tue, 27 Jun 2017 08:57:14 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1706270833100.8058@mgerlach-VirtualBox>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com> <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com> <0bfc282d-2aec-8f36-1528-312f7ded8d9c@gmail.com> <alpine.DEB.2.20.1706270722440.8058@mgerlach-VirtualBox>
 <0ca53c35-732c-a122-8191-6d102e824d52@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0ca53c35-732c-a122-8191-6d102e824d52-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tue, 27 Jun 2017, Marek Vasut wrote:

> On 06/27/2017 04:32 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>
>>
>> On Tue, 27 Jun 2017, Marek Vasut wrote:
>>
>> Hi Marek,
>>
>> Thanks for the feedback.  See my comments below.
>>
>> Matthew Gerlach
>>
>>> On 06/26/2017 06:13 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>>> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>>
>>>> Device Tree bindings for Version 2 of the Altera Quadspi Controller
>>>> that can be optionally paired with a windowed bridge.
>>>>
>>>> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/mtd/altera-quadspi-v2.txt  | 37
>>>> ++++++++++++++++++++++
>>>>  1 file changed, 37 insertions(+)
>>>>  create mode 100644
>>>> Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>> b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>> new file mode 100644
>>>> index 0000000..8ba63d7
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>> @@ -0,0 +1,37 @@
>>>> +* Altera Quad SPI Controller Version 2
>>>> +
>>>> +Required properties:
>>>> +- compatible : Should be "altr,quadspi-v2".
>>>> +- reg : Contains at least two entries, and possibly three entries,
>>>> each of
>>>> +    which is a tuple consisting of a physical address and length.
>>>> +- reg-names : Should contain the names "avl_csr" and "avl_mem"
>>>> corresponding
>>>> +          to the control and status registers and qspi memory,
>>>> respectively.
>>>> +
>>>> +
>>>> +The Altera Quad SPI Controller Version 2 can be paired with a
>>>> windowed bridge
>>>> +in order to reduce the footprint of the memory interface.  When a
>>>> windowed
>>>> +bridge is used, reads and writes of data must be 32 bits wide.
>>>> +
>>>> +Optional properties:
>>>> +- reg-names : Should contain the name "avl_window", if the windowed
>>>> bridge
>>>> +          is used.  This name corresponds to the register space that
>>>> +          controls the window.
>>>> +- window-size : The size of the window which must be an even power
>>>> of 2.
>>>> +- read-bit-reverse : A boolean indicating the data read from the
>>>> flash should
>>>> +             be bit reversed on a byte by byte basis before being
>>>> +             delivered to the MTD layer.
>>>> +- write-bit-reverse : A boolean indicating the data written to the
>>>> flash should
>>>> +              be bit reversed on a byte by byte basis.
>>>
>>> Is there ever a usecase where you need to set just one of these props ?
>>> Also, they're altera specific, so altr, prefix should be added.
>>
>> In general, I think if bit reversal is required, it would be required in
>> both directions.  However, anything is possible when using FPGAs.  So
>> I thought separate booleans would be future proofing the bindings.
>
> Maybe we should drop this whole thing and add it when this is actually
> required.
>
> Are there any users of this in the wild currently ?
>
> What is the purpose of doing this per-byte bit reverse instead of
> storing th bits in the original order ?

Hi Marek,

Yes, there is hardware that has been in the wild for years that needs this 
bit reversal.  The specific use case is when a flash chip is connected to
a FPGA, and the contents of the flash is used to configure the 
FPGA on power up.  In this use case, there is no processor involved with 
configuring the FPGA.  I am most familiar with this feature/bug with 
Altera FPGAs, but I believe this issue exists with other programmable 
devices.

>
>> Thinking about this binding more, I wonder if the binding name(s)
>> should be (read|write)-bit8-reverse to indicate reversings the bits
>> in a byte as opposed to reversing the bits in a 32 bit word?
>>
>> I don't think bit reversal is specific to Altera/Intel components. I see
>> a nand driver performing bit reversal, and I think I've recently seen
>> other FPGA based drivers requiring bit reversal.
>
> $ git grep bit.reverse Documentation/devicetree/ | wc -l
> 0
>
> So we don't have such a generic binding . It's up to Rob (I guess) to
> decide whether this is SoC specific and should've altr, prefix or not.
> IMO it is.

I agree there is no generic binding at this time, and I look forward
to any input from Rob and anyone else on this issue.  I think it is worth 
pointing out that this really isn't an issue of an SoC, but rather it is an
issue of how data in the flash chip is accessed.  I think what makes this issue
"weird" is that we have different hardware accessing the data in the flash 
with a different perspective.  The FPGA looks at the data from one 
perspective on power up, and a processor trying to update the flash has a 
different perspective.

Thanks again,

Matthew Gerlach
>
> -- 
> Best regards,
> Marek Vasut
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
