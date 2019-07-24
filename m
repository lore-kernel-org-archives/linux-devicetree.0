From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 00/26] Add generic support for composing LED class
 device name
Date: Wed, 24 Jul 2019 23:02:52 +0200
Message-ID: <3d8890a2-47e8-2dd0-9764-93676703df2a@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <405b2806-342a-952d-67ab-47516225c54e@gmail.com> <20190718105233.GA3859@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718105233.GA3859@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, dmurphy@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net
List-Id: devicetree@vger.kernel.org

On 7/18/19 12:52 PM, Pavel Machek wrote:
> 
>> Hi all,
>>
>> I need explicit acks for some patches from this series, that
>> were either requested improvements or I modified them by myself
>> after v4.
>>
>> The patches I am talking about are the following:
>>
>> 1/26
>> 21/26
>> 23/26
>> 25/26
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Applied the patch set without patch 26/26 for now.
I had to make some formatting related changes in leds-class.rst, in
part of the added text (we had leds-class.txt -> leds-class.rst
transition in the meantime) to fix resulting html formatting.
Basically they aimed to achieve nice bullets to compensate some
sphinx issue related to lack of line breaks after quoted strings.

Current shape of leds-class.rst on linux-leds.git for-next branch can
be looked up via [0].

>> 26/26 would be nice to have but I presume it needs more discussion
>> and analysis.
> 
> Idea is good, but I'd sort the file in different way.
> 
> Best regards,
> 									Pavel
> 

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/tree/Documentation/leds/leds-class.rst?h=for-next

-- 
Best regards,
Jacek Anaszewski
