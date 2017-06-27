From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: Bindings for Altera Quadspi Controller
 Version 2
Date: Tue, 27 Jun 2017 21:56:10 +0200
Message-ID: <6d1cba23-afc9-96db-00d1-47e6aefcc9f0@gmail.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com>
 <0bfc282d-2aec-8f36-1528-312f7ded8d9c@gmail.com>
 <alpine.DEB.2.20.1706270722440.8058@mgerlach-VirtualBox>
 <0ca53c35-732c-a122-8191-6d102e824d52@gmail.com>
 <alpine.DEB.2.20.1706270833100.8058@mgerlach-VirtualBox>
 <a7e3bb21-6e05-4117-0a25-8782a75b93ad@gmail.com>
 <alpine.DEB.2.20.1706271004460.8058@mgerlach-VirtualBox>
 <510a1968-3e5c-8621-a2f1-116cfe8f6eac@gmail.com>
 <alpine.DEB.2.20.1706271226100.8058@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1706271226100.8058@mgerlach-VirtualBox>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/27/2017 09:32 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:

[...]

>>> Hi Marek,
>>>
>>> I am trying to write an MTD/spi-nor driver for version 2 of the
>>> Altera Quadspi contoller.  This controller is soft IP that is deployed
>>> in a FPGA.  As such, this component/driver can be used in wide range of
>>> use cases.  The controller could be used to update EPCQ/EPCS flash
>>> stores containing bit streams, but this component could be used for
>>> flash for filesystems or any non-volatile data store.  My hope is that
>>> all possible use cases should be covered by this driver.
>>
>> How does this particular case where you have to reverse the bits look
>> like ?
> 
> The use case for reversing the bits involves a processor updating
> EPCQ/EPCS flash whose contents are read by the FPGA on power up.  The
> processor and Altera Quadspi component, inside the configured FPGA,
> access the bits in one way serially, but the hardware that accesses the
> flash during power accesses the bits in the opposite way serially.

So it's the same crap Xilinx does, they have some tool to do this with
their bitstream before they write it into flash.

But then, you only have to do it with your bitstream. If you put ie. UBI
after the bitstream part, the UBI can be in normal bit ordering.
So instead of polluting the DT bindings with this, make a similar tool
to what Xilinx has, do the bit shuffling using that tool and then write
the bitstream into the flash in the correct order.

>>>>>>> Thinking about this binding more, I wonder if the binding name(s)
>>>>>>> should be (read|write)-bit8-reverse to indicate reversings the bits
>>>>>>> in a byte as opposed to reversing the bits in a 32 bit word?
>>>>>>>
>>>>>>> I don't think bit reversal is specific to Altera/Intel components.
>>>>>>> I see
>>>>>>> a nand driver performing bit reversal, and I think I've recently
>>>>>>> seen
>>>>>>> other FPGA based drivers requiring bit reversal.
>>>>>>
>>>>>> $ git grep bit.reverse Documentation/devicetree/ | wc -l
>>>>>> 0
>>>>>>
>>>>>> So we don't have such a generic binding . It's up to Rob (I guess) to
>>>>>> decide whether this is SoC specific and should've altr, prefix or
>>>>>> not.
>>>>>> IMO it is.
>>>>>
>>>>> I agree there is no generic binding at this time, and I look forward
>>>>> to any input from Rob and anyone else on this issue.  I think it is
>>>>> worth pointing out that this really isn't an issue of an SoC, but
>>>>> rather
>>>>> it is an
>>>>> issue of how data in the flash chip is accessed.I think what makes
>>>>> this issue
>>>>> "weird" is that we have different hardware accessing the data in the
>>>>> flash with a different perspective.  The FPGA looks at the data
>>>>> from one
>>>>> perspective on power up, and a processor trying to update the flash
>>>>> has
>>>>> a different perspective.
>>>>
>>>> Another thing I'd ask here is, is that bit-reverse a hardware property
>>>> or is that some software configuration thing ?
>>>
>>> I would say the bit reversal is a property of the FPGA that is reading
>>> the flash at power up.
>>
>> So it's not a property of the block, but rather of the bus somewhere ?
> 
> You are correct, it is not a property of the Altera Quadspi component, but
> a property of the fpga and external hardware that access the flash on
> power up.

So yes, it's a property of that small thing which loads the bitstream
from the EPCS/EPCQ and programs the cells in the FPGA. This shouldn't be
in this driver nor it's bindings, see above.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
