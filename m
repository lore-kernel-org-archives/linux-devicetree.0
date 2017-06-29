From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: Bindings for Altera Quadspi Controller
 Version 2
Date: Thu, 29 Jun 2017 17:38:35 +0200
Message-ID: <f0af2273-7c00-331d-82e0-2578b1a098ae@gmail.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com>
 <0bfc282d-2aec-8f36-1528-312f7ded8d9c@gmail.com>
 <alpine.DEB.2.20.1706270722440.8058@mgerlach-VirtualBox>
 <0ca53c35-732c-a122-8191-6d102e824d52@gmail.com>
 <alpine.DEB.2.20.1706270833100.8058@mgerlach-VirtualBox>
 <20170628230928.k3hafpxhqrr26val@rob-hp-laptop>
 <5bd89165-3e42-9db4-321d-5f3df35922ce@gmail.com>
 <alpine.DEB.2.20.1706290748230.4589@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1706290748230.4589@mgerlach-VirtualBox>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/29/2017 05:03 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
> 
> 
> On Thu, 29 Jun 2017, Marek Vasut wrote:
> 
>> On 06/29/2017 01:09 AM, Rob Herring wrote:
>>> On Tue, Jun 27, 2017 at 08:57:14AM -0700,
>>> matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>>>
>>>>
>>>> On Tue, 27 Jun 2017, Marek Vasut wrote:
>>>>
>>>>> On 06/27/2017 04:32 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>>>>>
>>>>>>
>>>>>> On Tue, 27 Jun 2017, Marek Vasut wrote:
>>>>>>
>>>>>> Hi Marek,
>>>>>>
>>>>>> Thanks for the feedback.  See my comments below.
>>>>>>
>>>>>> Matthew Gerlach
>>>>>>
>>>>>>> On 06/26/2017 06:13 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>>>>>>> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>>>>>>
>>>>>>>> Device Tree bindings for Version 2 of the Altera Quadspi Controller
>>>>>>>> that can be optionally paired with a windowed bridge.
>>>>>>>>
>>>>>>>> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>>>>>> ---
>>>>>>>>  .../devicetree/bindings/mtd/altera-quadspi-v2.txt  | 37
>>>>>>>> ++++++++++++++++++++++
>>>>>>>>  1 file changed, 37 insertions(+)
>>>>>>>>  create mode 100644
>>>>>>>> Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>>>
>>>>>>>> diff --git
>>>>>>>> a/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>>> b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..8ba63d7
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>>> @@ -0,0 +1,37 @@
>>>>>>>> +* Altera Quad SPI Controller Version 2
>>>>>>>> +
>>>>>>>> +Required properties:
>>>>>>>> +- compatible : Should be "altr,quadspi-v2".
>>>>>>>> +- reg : Contains at least two entries, and possibly three entries,
>>>>>>>> each of
>>>>>>>> +    which is a tuple consisting of a physical address and length.
>>>>>>>> +- reg-names : Should contain the names "avl_csr" and "avl_mem"
>>>>>>>> corresponding
>>>>>>>> +          to the control and status registers and qspi memory,
>>>>>>>> respectively.
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +The Altera Quad SPI Controller Version 2 can be paired with a
>>>>>>>> windowed bridge
>>>>>>>> +in order to reduce the footprint of the memory interface.  When a
>>>>>>>> windowed
>>>>>>>> +bridge is used, reads and writes of data must be 32 bits wide.
>>>>>>>> +
>>>>>>>> +Optional properties:
>>>>>>>> +- reg-names : Should contain the name "avl_window", if the
>>>>>>>> windowed
>>>>>>>> bridge
>>>>>>>> +          is used.  This name corresponds to the register space
>>>>>>>> that
>>>>>>>> +          controls the window.
>>>>>>>> +- window-size : The size of the window which must be an even power
>>>>>>>> of 2.
>>>>>>>> +- read-bit-reverse : A boolean indicating the data read from the
>>>>>>>> flash should
>>>>>>>> +             be bit reversed on a byte by byte basis before being
>>>>>>>> +             delivered to the MTD layer.
>>>>>>>> +- write-bit-reverse : A boolean indicating the data written to the
>>>>>>>> flash should
>>>>>>>> +              be bit reversed on a byte by byte basis.
>>>>>>>
>>>>>>> Is there ever a usecase where you need to set just one of these
>>>>>>> props ?
>>>>>>> Also, they're altera specific, so altr, prefix should be added.
>>>>>>
>>>>>> In general, I think if bit reversal is required, it would be
>>>>>> required in
>>>>>> both directions.  However, anything is possible when using FPGAs.  So
>>>>>> I thought separate booleans would be future proofing the bindings.
>>>>>
>>>>> Maybe we should drop this whole thing and add it when this is actually
>>>>> required.
>>>>>
>>>>> Are there any users of this in the wild currently ?
>>>>>
>>>>> What is the purpose of doing this per-byte bit reverse instead of
>>>>> storing th bits in the original order ?
>>>>
>>>> Hi Marek,
>>>>
>>>> Yes, there is hardware that has been in the wild for years that
>>>> needs this
>>>> bit reversal.  The specific use case is when a flash chip is
>>>> connected to
>>>> a FPGA, and the contents of the flash is used to configure the FPGA
>>>> on power
>>>> up.  In this use case, there is no processor involved with
>>>> configuring the
>>>> FPGA.  I am most familiar with this feature/bug with Altera FPGAs,
>>>> but I
>>>> believe this issue exists with other programmable devices.
>>>>
>>>>>
>>>>>> Thinking about this binding more, I wonder if the binding name(s)
>>>>>> should be (read|write)-bit8-reverse to indicate reversings the bits
>>>>>> in a byte as opposed to reversing the bits in a 32 bit word?
>>>>>>
>>>>>> I don't think bit reversal is specific to Altera/Intel components.
>>>>>> I see
>>>>>> a nand driver performing bit reversal, and I think I've recently seen
>>>>>> other FPGA based drivers requiring bit reversal.
>>>>>
>>>>> $ git grep bit.reverse Documentation/devicetree/ | wc -l
>>>>> 0
>>>>>
>>>>> So we don't have such a generic binding . It's up to Rob (I guess) to
>>>>> decide whether this is SoC specific and should've altr, prefix or not.
>>>>> IMO it is.
>>>>
>>>> I agree there is no generic binding at this time, and I look forward
>>>> to any input from Rob and anyone else on this issue.  I think it is
>>>> worth
>>>> pointing out that this really isn't an issue of an SoC, but rather
>>>> it is an
>>>> issue of how data in the flash chip is accessed.  I think what makes
>>>> this issue
>>>> "weird" is that we have different hardware accessing the data in the
>>>> flash
>>>> with a different perspective.  The FPGA looks at the data from one
>>>> perspective on power up, and a processor trying to update the flash
>>>> has a
>>>> different perspective.
>>>
>>> Given the comment that it is reversing bits in each byte, that seems
>>> fairly Altera specific. I'd be more in favor of a generic property if it
>>> was flipping all the bits in a word (for any size word).
>>
>> Actually, I'd prefer to fix up the FPGA bitstream in software and then
>> write the fixed up bitstream into the flash. That way there's no need
>> for any such DT property and other FPGA vendors (ie. xilinx) do it that
>> way already.
>>
>> -- 
>> Best regards,
>> Marek Vasut
>>
> 
> While I totally understand Marek's point of view regarding bit flipping,
> I think it is instructive to explore the other point of view.  For me
> the issue of flipping the bits in user space versus kernel space came
> down to laziness, which along with impatience and hubris are considered
> by some to be good traits for a software engineer.  I looked around for
> an existing user space to perform the function, but I did not find an
> existing tool, but I suppose I could look more closely at Xilinx's
> tools.  I do not want to create my own tool, and then it was pointed out
> to me that the necessary bit flipping functions already exist in the
> kernel.

Random internet search gives you ie.
https://www.xilinx.com/itp/xilinx10/isehelp/pim_r_promformatter_files.htm

I recall there was some perl script to do the same too.

> Even if we decided that performing the bit flipping in the kernel makes
> sense, my original binding proposal is clearly inadequate.  As Rob
> pointed such a binding should be more generic to support flipping the
> bits in any word size (i.e. 8, 16, 32, 64 ...).  Additionally, Marek has
> pointed out that a portion of the flash could requiring flipping, and
> another portion of the same flash would not require flipping. 
> Therefore, a bit flipping binding is not a property of the flash
> controller, but rather it is a property of a particular flash partition.

And so, we're starting to invent a convoluted scheme to describe policy
in DT ; I don't like this.

What would you do once the FPGA requires another bit order, would you
add another DT property and more stuff to the kernel to handle it ? I
don't think this scales. Going ad-absurdum, I might want to be lazy and
try to dd a SOF file into a partition and hope the kernel will convert
it to RBF and do the right thing ...

But we won't put a SOF-to-RBF parser into the kernel. I don't see a
reason why we should put this bit swapping into the kernel. Just let the
user (in this case, FPGA developer) prepare the bitstream in the correct
format and write it into the flash.

> Matthew Gerlach


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
