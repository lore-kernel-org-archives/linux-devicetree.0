Return-Path: <SRS0=QaAE=SZ=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH 2/2] input: touch: eeti: read hardware state once after
 wakeup
References: <20190422083540.8380-1-daniel@zonque.org>
 <20190422083540.8380-2-daniel@zonque.org>
 <20190423031705.gllzrreptvphdrc3@penguin>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <6b550519-4550-0872-f3de-9eba1fc0279f@zonque.org>
Date: Tue, 23 Apr 2019 06:51:32 +0200
MIME-Version: 1.0
In-Reply-To: <20190423031705.gllzrreptvphdrc3@penguin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: robh+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, Sven Neumann <Sven.Neumann@teufel.de>
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

On 23/4/2019 5:17 AM, Dmitry Torokhov wrote:
> On Mon, Apr 22, 2019 at 10:35:40AM +0200, Daniel Mack wrote:
>> For systems in which the touch IRQ is acting as wakeup source, the interrupt
>> controller might not latch the GPIO IRQ during sleep. In such cases, the
>> interrupt will never occur again after resume, hence the touch screen
>> appears dead.
>>
>> To fix this, call into eeti_ts_read() once to read the hardware status and
>> to arm the IRQ again.
> 
> Can you instead make the interrupt level-triggered?

The hardware I'm working on doesn't support that unfortunately.

In fact, the whole attn-gpio dance is there because of that, and the
GPIO descriptor maps to the same pin that also causes the IRQ in my case.


Thanks,
Daniel
