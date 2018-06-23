Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v4 5/5] leds: lt3593: update email address and switch to
 SPDX license header
References: <20180621202322.11581-1-daniel@zonque.org>
 <20180621202322.11581-6-daniel@zonque.org>
 <42bb7da0-3a5f-48e5-b12c-332307c794f3@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <37153111-e1b9-f41b-6074-e1a4ddbb68c9@zonque.org>
Date: Sat, 23 Jun 2018 21:52:18 +0200
MIME-Version: 1.0
In-Reply-To: <42bb7da0-3a5f-48e5-b12c-332307c794f3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Friday, June 22, 2018 11:56 PM, Jacek Anaszewski wrote:
>> -MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
>> +MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
>>    MODULE_DESCRIPTION("LED driver for LT3593 controllers");
>>    MODULE_LICENSE("GPL");
> 
> I've just noticed the pre-existing discrepancy between the license
> message (GPL v2) and MODULE_LICENSE("GPL"). Is there a reason to keep
> it that way?

Ah, no, that's just a mistake. I'll send a patch to update the string.

Thanks for your reviews and all!

Daniel
