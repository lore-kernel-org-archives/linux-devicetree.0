From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Adding a Basic DT for the Linksys ea6500 v2 wireless home router
Date: Fri, 30 Nov 2018 10:36:20 -0800
Message-ID: <0d26bc69-6439-05c9-a219-beae33f847c2@gmail.com>
References: <CACE8ZKbUhFyWg5oK1B8+aWAa0tdqKf5Kokj80+8x1X2EUaA_DQ@mail.gmail.com>
 <CACE8ZKZEpQjOW6CSvUuM9xhjtkSCF0bYxcfQ3htSabC=rVJcTA@mail.gmail.com>
 <86f391e5-9e38-c8b0-4753-4646c322c9bc@hauke-m.de>
 <CACE8ZKb5CxEBAdCdGAhwaQHC9_nHBjTTVwxdDOXRayqgz0FK5g@mail.gmail.com>
 <CACE8ZKYCyDx_E+3sLpjQSV6xrFxGyrYwEfhEO=QZPGpm3jsBrQ@mail.gmail.com>
 <5a6a30cf-1d93-7232-e607-3919b86bbdff@gmail.com>
 <CACE8ZKaMBfa5vWJMp_xVjstkuxkjO=DDwp1srA+Am1RP46gZcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACE8ZKaMBfa5vWJMp_xVjstkuxkjO=DDwp1srA+Am1RP46gZcQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=c3=a9_Kjellerup?= <rk.katana.steel@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/27/18 6:09 PM, René Kjellerup wrote:
> 
> On Tue, Nov 27, 2018 at 4:23 PM Florian Fainelli <f.fainelli@gmail.com
> <mailto:f.fainelli@gmail.com>> wrote:
>>
>>
>>
>> On 11/26/18 4:49 PM, René Kjellerup wrote:
>> > To the broadcom kernel maintainers, (for BCM4708 CPUs)
>> >
>> > I just want to add a little attention to this patch again...
>> > let me know if there's any concerns and I will try to address
> highlighted issues
>> > as soon as possible.
>> >
>> > I've been running the development builds of OpenWrt kernels, where
>> > this patch has
>> > been included, on my Linksys EA6500v2 router for the past months,
>> > updating as new
>> > builds are available. With only the on board BCM4360 chip (5GHz
> WiFi) is being
>> > disabled, has so far been stable for my use case.
>>
>> (Please no top posting). Your submission did make it through patchwork
>> and looks okay, I will run build tests and queue it up for 4.21 if
>> everything looks good. Thanks.
>>
> ...
>>
>> --
>> Florian
> 
> thank you Florian for the update
> I appreciate the feedback

Now applied to devicetree/next, thanks. Please use git
format-patch/send-email in the future, as the patch was mangled a little
bit by being sent within the message body.

Thank you
-- 
Florian
