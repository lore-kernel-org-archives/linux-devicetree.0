From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/3 RESEND] clocksource: Augment bindings for Faraday
 timer
Date: Sat, 8 Apr 2017 00:03:22 +0200
Message-ID: <a4e1b49d-68a2-b05f-b2f2-e27dc6cfc85e@linaro.org>
References: <20170407215513.25706-1-linus.walleij@linaro.org>
 <CAL_JsqJ6HWRiU2iQtJapRLwuWdUM6KCgYfseJzMtie-xG_UKxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ6HWRiU2iQtJapRLwuWdUM6KCgYfseJzMtie-xG_UKxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/04/2017 00:01, Rob Herring wrote:
> On Fri, Apr 7, 2017 at 4:55 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> It turns out that the Cortina Gemini timer block is just a
>> standard IP block from Faraday Technology named FTTMR010.
>>
>> In order to make things clear and understandable, we rename the
>> bindings with a Faraday compatible as primary and the Cortina
>> gemini as a more specific case.
>>
>> For the plain Faraday timer we require two clock references,
>> while the Gemini can keep it's syscon lookup pattern.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  .../bindings/timer/cortina,gemini-timer.txt        | 22 ---------------
>>  .../devicetree/bindings/timer/faraday,fttmr010.txt | 33 ++++++++++++++++++++++
>>  2 files changed, 33 insertions(+), 22 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
>>  create mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
> 
> Does the -M option not work here?
> 
> In any case,
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
