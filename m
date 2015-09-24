From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v2 1/9] ARM: dts: consolidate aliases for Cygnus dt files
Date: Thu, 24 Sep 2015 15:23:48 -0700
Message-ID: <560477F4.5060508@broadcom.com>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com>
 <25764744.UdkoAR05y0@wuerfel> <55FC85D6.7050506@broadcom.com>
 <20046098.CeNft0Jl1D@wuerfel> <56031DAF.5070503@broadcom.com>
 <56031E42.5010601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56031E42.5010601@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/23/2015 2:48 PM, Florian Fainelli wrote:
> On 23/09/15 14:46, Ray Jui wrote:
>>
>>
>> On 9/23/2015 2:31 PM, Arnd Bergmann wrote:
>>> On Friday 18 September 2015 14:44:54 Ray Jui wrote:
>>>> On 9/18/2015 2:27 PM, Arnd Bergmann wrote:
>>>>> On Friday 18 September 2015 14:24:06 Ray Jui wrote:
>>>>>
>>>>> The SoC has at least four uarts according to this, so it seems unlikely that
>>>>> each board really only uses only the fourth one of them and labels it '0'
>>>>> on the board. As soon as you get one board that has more than one uart wired
>>>>> up, you would need to undo this.
>>>>>
>>>>
>>>> I think Scott might have explained this in the past. uart3 is going to
>>>> be used on all Cygnus boards (including all future boards) because the
>>>> bootrom was designed to use uart3 as console and that won't change.
>>>>
>>>> Let me know if you still think I need to move this back to the dts.
>>>
>>> I would still like to see them stay in the .dts file, if only for
>>> consistency with other platforms. 
>>>
>>> Also, even if you can guarantee that uart3 is always used for the
>>> console, that doesn't prevent board designers from adding more than
>>> one uart, right?
>>>
>>> 	Arnd
>>>
>>
>> Okay. Given that this patch series has been merged by Florian, I'll
>> submit another patch to move it back to .dts files.
> 
> You could send me either a replacement patch series (all 9), or an
> individual patch to replace a previous version (e.g; replace v2 with a
> v3), or an incremental one, whatever works for you.
> 
> Thanks!
> 

Hi Florian, I just sent you an incremental patch to move the alias back
to .dts files.

Thanks,

Ray
