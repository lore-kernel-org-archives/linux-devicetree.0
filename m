From: Harvey Hunt <Harvey.Hunt@imgtec.com>
Subject: Re: [PATCH] MIPS: dts: ralink: Add Mediatek MT7628A SoC
Date: Fri, 18 Aug 2017 15:11:25 +0100
Message-ID: <73251933-33bf-416d-cf2a-0fad0337a512@imgtec.com>
References: <1502814530-40604-1-git-send-email-harvey.hunt@imgtec.com>
 <20170817213426.34shgxwnjowcg4sk@rob-hp-laptop>
 <97c83648-3710-cb9a-a065-9fbe8dd1b734@imgtec.com>
 <CAL_Jsq+NZWkvibcL+CFWD8curFDKF2=bBzyCVsRyyiFOFwNBbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+NZWkvibcL+CFWD8curFDKF2=bBzyCVsRyyiFOFwNBbg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 18/08/17 15:04, Rob Herring wrote:
> On Fri, Aug 18, 2017 at 4:42 AM, Harvey Hunt <Harvey.Hunt@imgtec.com> wrote:
>> Hi Rob,
>>
>> Thanks for the review.
>>
>>
>> On 17/08/17 22:34, Rob Herring wrote:
>>>
>>> On Tue, Aug 15, 2017 at 05:28:50PM +0100, Harvey Hunt wrote:
>>>>
>>>> The MT7628A is the successor to the MT7620 and pin compatible with the
>>>> MT7688A, although the latter supports only a 1T1R antenna rather than
>>>> a 2T2R antenna.
> 
> [...]
> 
>>>> +               uartlite@c00 {
>>>
>>>
>>> serial@c00
>>>
>>> And so on. IOW, use standard, generic node names as defined in the DT
>>> spec.
>>
>>
>>
>> The clocks for the UARTs are using the device names "uartlite", "uart1" and
>> "uart2" (as defined in arch/mips/ralink/mt7620.c).
> 
> You can't add clocks to the DT? Looks like mt76x8 at least should be
> pretty easy with some fixed clocks.
> 
> Depending if backwards compatibility (old dtb working on new kernel)
> is a concern on these platforms, you could just change all the names
> both in the kernel and dts.

I don't think backwards compatibility will matter - the bootloaders I've 
come across don't ship DTBs with them and I don't think there are any 
ralink devices using the upstream MT7620 DT.

John might have some thoughts on backwards compat though.

> 
>> Changing the name of the DT nodes causes the serial driver to bail as it
>> can't find the clock for the device.
>>
>> arch/mips/boot/dts/ralink/mt7620a.dtsi is already using the uartlite name,
>> although it hasn't been documented...
> 
> Generally the kernel shouldn't care what the names are (though you can
> match by name, it's not widely used).
> 
> In any case, I guess fixing this can be done later.
> 
> Rob
> 

Shall I respin this patch with the earlier nodes (intc etc) renamed and 
then send a patch later to rename the serial ports in the DT and kernel 
(assuming there are no backwards compatibility issues)?

Thanks,

Harvey
