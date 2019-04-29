Return-Path: <SRS0=IdcD=S7=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH 2/2] input: touch: eeti: read hardware state once after
 wakeup
References: <20190422083540.8380-1-daniel@zonque.org>
 <20190422083540.8380-2-daniel@zonque.org>
 <20190423031705.gllzrreptvphdrc3@penguin>
 <6b550519-4550-0872-f3de-9eba1fc0279f@zonque.org>
 <20190423084111.hqco2xgl2lfe35la@penguin>
 <f5c26867-235d-0c6e-3e44-885b54664cfe@zonque.org>
 <20190428173604.GB44908@dtor-ws>
 <256962f1-7a75-b5f7-7104-d6e70f66b23d@zonque.org>
 <20190429011759.GA125935@dtor-ws>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <d124d6e4-d708-549c-37f3-d1d393a23bef@zonque.org>
Date: Mon, 29 Apr 2019 07:49:46 +0200
MIME-Version: 1.0
In-Reply-To: <20190429011759.GA125935@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: robh+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, Sven Neumann <Sven.Neumann@teufel.de>
List-ID: <devicetree@vger.kernel.org>

On 29/4/2019 3:17 AM, Dmitry Torokhov wrote:
> On Sun, Apr 28, 2019 at 09:50:35PM +0200, Daniel Mack wrote:
>> On 28/4/2019 7:36 PM, Dmitry Torokhov wrote:
>>> On Sun, Apr 28, 2019 at 09:18:46AM +0200, Daniel Mack wrote:
>>>> On 23/4/2019 10:41 AM, Dmitry Torokhov wrote:
>>>>> On Tue, Apr 23, 2019 at 06:51:32AM +0200, Daniel Mack wrote:
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> On 23/4/2019 5:17 AM, Dmitry Torokhov wrote:
>>>>>>> On Mon, Apr 22, 2019 at 10:35:40AM +0200, Daniel Mack wrote:
>>>>>>>> For systems in which the touch IRQ is acting as wakeup source, the interrupt
>>>>>>>> controller might not latch the GPIO IRQ during sleep. In such cases, the
>>>>>>>> interrupt will never occur again after resume, hence the touch screen
>>>>>>>> appears dead.
>>>>>>>>
>>>>>>>> To fix this, call into eeti_ts_read() once to read the hardware status and
>>>>>>>> to arm the IRQ again.
>>>>>>>
>>>>>>> Can you instead make the interrupt level-triggered?
>>>>>>
>>>>>> The hardware I'm working on doesn't support that unfortunately.
>>>>>>
>>>>>> In fact, the whole attn-gpio dance is there because of that, and the
>>>>>> GPIO descriptor maps to the same pin that also causes the IRQ in my case.
>>>>>
>>>>> OK, if the interrupt controller is incapable of dealing with level
>>>>> interrupts then we have to do what you propose.
>>>>
>>>> So you consider these patches for inclusion then? I'm just asking
>>>> because I can't see them in your tree yet.
>>>
>>> I was about to, but now I wonder if we need a mutex in the isr code now,
>>> otherwise there is a chance it will be running concurrently when we are
>>> resuming if interrupt does latch.
>>
>> Actually, to address that, all we need to do is call into eeti_ts_read()
>> before enable_irq(). See my v2.
> 
> This is still a bit racy as interrupt may come after you attempted to
> read but before enable_irq() and then we need interrupt replaying code
> to work reliably, which, as far as I understand, is not always the case.
> I suppose we need at least add a comment that we rely on replays.

Ah, of course. Okay, let's just have a mutex for this then. I'll send a v3.

> What kind of hardware is that? Is there no chance of making interrupt
> controller handle level interrupts?

It's a PXA3xx platform, and their interrupt controller lacks such a feature.


Thanks,
Daniel
