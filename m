From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Mon, 02 Feb 2015 16:43:14 +0100
Message-ID: <54CF9B12.2070807@denx.de>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local> <20140220182257.GF23217@saruman.home> <5306F458.9010706@monstr.eu> <20140221160442.GA17506@kroah.com> <5307790A.4050806@monstr.eu> <20140221161246.GM31902@saruman.home> <53077C5F.9000407@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53077C5F.9000407-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21.02.2014 17:18, Michal Simek wrote:
> On 02/21/2014 05:12 PM, Felipe Balbi wrote:
>> On Fri, Feb 21, 2014 at 05:04:26PM +0100, Michal Simek wrote:
>>> On 02/21/2014 05:04 PM, Greg Kroah-Hartman wrote:
>>>> On Fri, Feb 21, 2014 at 07:38:16AM +0100, Michal Simek wrote:
>>>>> BTW: u-boot started to use SPDX-License-Identifier
>>>>> which will be nice to start to use.
>>>>
>>>> I agree, feel free to start sending patches to use this type of
>>>> identifier for drivers.
>>>
>>> But we probably need to add that Licenses to one location.
>>> Documentation/Licenses?
>>
>> Just add to the drivers themselves, just like u-boot is doing. A simple:
>>
>> 	$ git grep -e SPDX-License-Identifier
>>
>> will tell you filename and license. Or did I misunderstand your question ?
>
> But for doing this it is probably necessary to have location where
> you will place that licenses and you will explain what it is how
> it is done by Wolfgang in this commit.
>
> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=eca3aeb352c964bdb28b8e191d6326370245e03f
>
> Then yes, adding one line is enough.
I would like to revive this thread regarding SPDX license identifiers in 
the Linux kernel. And check how to best start / proceed with the 
integration now.

Greg, if you are open to patches adding this one-line SPDX license tag 
to the source code, how should I begin with such a task in your opinion? 
Should I add those tags for just one driver directory (e.g. 
drivers/base/*) first? And send those patches to the list(s) for review. 
Or do you have other suggestions on how to start with this task?

Any comments and / or suggestions are really appreciated. Thanks!

Thanks,
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
