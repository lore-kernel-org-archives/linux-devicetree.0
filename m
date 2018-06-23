Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH 3/5] input: touchscreen: eeti: add support for DT
 properties to flip screen
References: <20180617114659.367-1-daniel@zonque.org>
 <20180617114659.367-3-daniel@zonque.org> <20180622185908.GF92912@dtor-ws>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <3abfc550-6e82-7e01-5314-cb1ce38fa22a@zonque.org>
Date: Sat, 23 Jun 2018 17:41:09 +0200
MIME-Version: 1.0
In-Reply-To: <20180622185908.GF92912@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: robh+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

On Friday, June 22, 2018 08:59 PM, Dmitry Torokhov wrote:
> On Sun, Jun 17, 2018 at 01:46:57PM +0200, Daniel Mack wrote:
>> +	eeti->flip_x = flip_x || props.invert_x;
>> +	eeti->flip_y = flip_y || props.invert_y;
> 
> I would like to get rid completely of these module parameters. The only
> user of this drover in mainline is arch/arm/mach-pxa/raumfeld.c and I do
> not know how it is mounted there, but we can adjust with static board
> properties if needed.

Yeah, you're right. I know for a fact that this platform does not use 
the module parameters, so let's just drop them.

> Can we please switch to not only touchscreen_parse_properties() but also
> touchscreen_report_pos()?

Didn't know about this one. Nice. Will update the series and repost.


Thanks!
Daniel
