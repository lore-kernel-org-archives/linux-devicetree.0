From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Tue, 16 Feb 2016 14:14:20 +0530
Message-ID: <56C2E164.8020004@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
 <20160202220353.GA10273@rob-hp-laptop>
 <C2D7FE5348E1B147BCA15975FBA23075F4E87B33@us01wembx1.internal.synopsys.com>
 <CAL_Jsq+15SERAN8B5vcKVG=O8=pLLw5_0-p2STHjyGUu7mx-7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+15SERAN8B5vcKVG=O8=pLLw5_0-p2STHjyGUu7mx-7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arcml <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Noam Camus <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 03 February 2016 09:09 PM, Rob Herring wrote:
> On Wed, Feb 3, 2016 at 2:04 AM, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Rob,
>>
>> On Wednesday 03 February 2016 03:33 AM, Rob Herring wrote:
>>> On Tue, Feb 02, 2016 at 04:28:52PM +0530, Vineet Gupta wrote:
>>>> +Required properties:
>>>> +
>>>> +- compatible : should be "snps,arc-timer0"
>>>
>>> timer0 and timer1 are different h/w blocks, not just different
>>> instances?
>>
>> Functionality wise they are identical (only the address of aux regs used to
>> program them are different). Either can be configured to interrupt-on-limit or
>> free-run-and-wrap-around. So we can indeed consider them 2 instances. ARC Linux
>> uses timer0 for tick handling, timer1 for gtod.
>>
>> Do you prefer they not be differentiated as timer0 and timer1 ?
>>
>> So we have
>>
>> CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer0", arc_clockevent_setup);
>> CLOCKSOURCE_OF_DECLARE(arc_timer1, "snps,arc-timer1", arc_cs_setup_timer1);
>>
>> I don't know how to achieve above, by keeping the DT names the same.
> 
> You just need a single CLOCKSOURCE_OF_DECLARE which will be called
> twice. On the first call, setup one timer and on the 2nd call setup
> the other one. IIRC the sp804 timer has something similar.
> 
> You'll need a unit address in the node name to distinguish them.

So this is just to distinguish them in DT, but the callback uses a static counter
to do 1st vs. 2nd (and this unit address is not really exposed to code) - correct ?


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
