From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 05/12] ARM: davinci: da850: switch to using the
 clocksource driver
Date: Fri, 8 Feb 2019 18:07:35 +0530
Message-ID: <acd3f8ca-8ed7-f86a-9bdf-24e4e6e9a6a4@ti.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-6-brgl@bgdev.pl>
 <9d423e18-8c85-731b-388a-1843067db242@ti.com>
 <CAMpxmJW0qMi0BmiK2SOwdagw2-t8+1g20XJR418mWb8f1dwxtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJW0qMi0BmiK2SOwdagw2-t8+1g20XJR418mWb8f1dwxtQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, arm-soc <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/02/19 6:04 PM, Bartosz Golaszewski wrote:
> pt., 8 lut 2019 o 13:06 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>
>> On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:
>>> +static const struct davinci_timer_cfg da850_timer_cfg = {
>>> +     .reg = {
>>> +             .start          = DA8XX_TIMER64P0_BASE,
>>> +             .end            = DA8XX_TIMER64P0_BASE + SZ_4K,
>>
>> SZ_4K - 1
>>
>> This should have prevented watchdog timer from getting registered.
>>
>> Thanks,
>> Sekhar
> 
> My clocksource driver doesn't call request_region() so a subsequent
> devm_ioremap_resource() in the watchdog driver would still succeed. I
> now fixed both the missing call and the value here.

Ah, got it. Perhaps a call to request_region() should be added to catch
issues?

Thanks,
Sekhar
