Return-Path: <SRS0=zuy1=KI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34236 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388334AbeGXRaX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Jul 2018 13:30:23 -0400
Received: by mail-qk0-f195.google.com with SMTP id b66-v6so2996255qkj.1
        for <devicetree@vger.kernel.org>; Tue, 24 Jul 2018 09:23:09 -0700 (PDT)
Subject: Re: [PATCH 00/15] ARM: dts: tegra: apalis-tk1: major revamp
References: <20180724104309.21741-1-marcel@ziswiler.com>
 <2076484.gx54F3eiOq@dimapc> <1532443499.6124.31.camel@toradex.com>
 <4715215.NZcU7pUVUy@dimapc>
From: Peter Geis <pgwipeout@gmail.com>
Message-ID: <cead13fe-4927-0807-affc-ce974222bb72@gmail.com>
Date: Tue, 24 Jul 2018 12:23:05 -0400
MIME-Version: 1.0
In-Reply-To: <4715215.NZcU7pUVUy@dimapc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
List-ID: <devicetree@vger.kernel.org>



On 07/24/2018 10:48 AM, Dmitry Osipenko wrote:
> On Tuesday, 24 July 2018 17:45:01 MSK Marcel Ziswiler wrote:
>> On Tue, 2018-07-24 at 17:31 +0300, Dmitry Osipenko wrote:
>>
>>> On Tuesday, 24 July 2018 17:16:33 MSK Marcel Ziswiler wrote:
>>>
>>>> On Tue, 2018-07-24 at 15:44 +0300, Dmitry Osipenko wrote:
>>>>
>>>>
>>>>> On Tuesday, 24 July 2018 15:24:34 MSK Marcel Ziswiler wrote:
>>>>>
>>>>>
>>>>>> Sorry, I meant to write "minor revamp" in the subject line here
>>>>>> as
>>>>>> Apalis TK1 was already in quite good a shape but this are still
>>>>>> some
>>>>>> worthy improvements (;-p).
>>>>>>
>>>>>> On Tue, 2018-07-24 at 12:42 +0200, Marcel Ziswiler wrote:
>>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Marcel,
>>>>>
>>>>> All your emails that are sent from "toradex.com" are treated as
>>>>> spam
>>>>> by Gmail
>>>>> because "This message has a from address in toradex.com but has
>>>>> failed
>>>>> toradex.com's required tests for authentication.", is there
>>>>> anything
>>>>> you could
>>>>> do to fix that?
>>>>
>>>>
>>>>
>>>> Hi Dmitry
>>>>
>>>> Hm, unfortunately, Toradex was an M$ only shop when I joined more
>>>> then
>>>> 7 years ago and so far I was unable to convince our IT to switch to
>>>> some grown up email system. Therefore, I am stuck with Exchange,
>>>> Office
>>>> 365 or whatever M$ nowadays seem to call it. Anyway, I really
>>>> thought
>>>> sending from Android or Evolution via their resp. Exchange
>>>> connectors
>>>> would properly do SPF, DKIM and even DMARC. I just confirmed this
>>>> when
>>>> sending something to my gmail address and doing "Show original".
>>>>
>>>> Since Linus himself pointed out any of my patches ending up in his
>>>> spam
>>>> folder I do send them via my private email which while not having
>>>> any
>>>> advanced security configured should still be valid. Moving it to a
>>>> fully secure configuration including DNSSEC and stuff is still
>>>> pending
>>>> on my side.
>>>>
>>>> Can you please tell me which exact email it is that you got this
>>>> reported on so I may further investigate what is going on?
>>>
>>>
>>> This email from you looks okay. Unfortunately all of your previous
>>> emails from
>>> "toradex.com" were getting into the spam folder.
>>
>>
>> You sure they were from "toradex.com"? The patches should have been
>> coming from "ziswiler.com" resp. "perfora.net".
> 
> The patches from "ziswiler.com" are fine, only your emails specifically from
> "toradex.com" had an issue. Looks like you've resolved it now.
> 
> 

For just the three of us, I had a handful of Marcel's emails in my spam 
folder as well. Gmail had them tagged as phishing attempts because they 
could not verify the emails came from toradex.com.
It seems like verification is intermittently failing, otherwise all of 
the emails would be tagged as such.
