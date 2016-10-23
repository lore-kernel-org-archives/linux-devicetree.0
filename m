From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH v3 0/2] media: add et8ek8 camera sensor driver and
 documentation
Date: Sun, 23 Oct 2016 21:36:04 +0300
Message-ID: <4e9be010-a673-9f9f-ac77-6b4f41e31c83@gmail.com>
References: <1465659593-16858-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <20161023073322.GA3523@amd> <53284bf5-9a36-fbcb-5cac-4a64823c3516@gmail.com>
 <20161023181752.GA11728@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161023181752.GA11728@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: sakari.ailus@iki.fi, sre@kernel.org, pali.rohar@gmail.com, linux-media@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mchehab@osg.samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 23.10.2016 21:17, Pavel Machek wrote:
> Hi!
>
>>>> This series adds driver for Toshiba et8ek8 camera sensor found in Nokia N900
>>>>
>>>> Changes from v2:
>>>>
>>>> - fix build when CONFIG_PM is not defined
>>>>
>>>> Changes from v1:
>>>>
>>>> - driver and documentation split into separate patches
>>>> - removed custom controls
>>>> - code changed according to the comments on v1
>>>
>>>> Ivaylo Dimitrov (2):
>>>>  media: Driver for Toshiba et8ek8 5MP sensor
>>>>  media: et8ek8: Add documentation
>>>
>>> Is there any progress here? Is there any way I could help?
>>>
>>
>> There were some notes I need to address, unfortunately no spare time lately
>> :( . Feel free to fix those for me and resend the patches. If not, I really
>> don't know when I will have the time needed to focus on it.
>
> So good start would be taking these two, address the comments, and try
> to merge them?
>

Yep, the whole history should be at 
https://patchwork.kernel.org/patch/9171067/ and 
http://www.gossamer-threads.com/lists/linux/kernel/2462501

Thanks,
Ivo
