From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: moxart: Add AST2500 compatible string
Date: Tue, 30 May 2017 10:54:40 +0200
Message-ID: <1a165856-6863-ad51-d66c-eda062f4d98e@linaro.org>
References: <20170516075840.23130-1-andrew@aj.id.au>
 <CACRpkdZsbzwBKRj1FXAoCW9nD357SNNK8t=gOO-OBtV_pwjpKg@mail.gmail.com>
 <0f526d58-3138-d7ea-0dc7-5ef623fb0547@linaro.org>
 <CACRpkdYbicYPJvaeTMpHSn4F77ognBfnEbj7OknFiZgfK1qizA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYbicYPJvaeTMpHSn4F77ognBfnEbj7OknFiZgfK1qizA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
List-Id: devicetree@vger.kernel.org

On 30/05/2017 09:44, Linus Walleij wrote:
> On Sun, May 28, 2017 at 8:27 PM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>> On 28/05/2017 15:59, Linus Walleij wrote:
>>> On Tue, May 16, 2017 at 9:58 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>
>>>> Also clean up space-before-tab issues in the documentation.
>>>>
>>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Does this collide with Daniel's 2500 patch?
>>>
>>> Sorry for the mess, tell me if I need to fix something up :(
>>
>> It is ok, an usual collision change to be fixed when merging ;)
>>
>> By the way, can you have a look at fttmr010_read_sched_clock to remove
>> the local_fttmr->count_down test?
> 
> I guess what we can do is make two different sched_clock()
> callbacks: one for upward and one for downward counting.
> 
> Would you like an optimization like that?
> 
> (It makes sense.)

Yes, thanks Linus!

  -- Daniel



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
