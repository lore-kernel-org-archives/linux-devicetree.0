From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v5 2/3] clocksource: keystone: add bindings for keystone timer
Date: Wed, 5 Feb 2014 11:41:34 -0600
Message-ID: <CAL_JsqL6YDcZJa5xziR7dP-bEt1CO4BtL1vsO8Qm+hFwgCiQ1w@mail.gmail.com>
References: <1391608060-10760-1-git-send-email-ivan.khoronzhuk@ti.com>
	<1391608060-10760-3-git-send-email-ivan.khoronzhuk@ti.com>
	<CAL_JsqKVc2fdg1Q+TH6ro9kpJmUYyHw8FCwhORfm2_oj6GYM2Q@mail.gmail.com>
	<52F26444.5090707@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52F26444.5090707@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 5, 2014 at 10:18 AM, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com> wrote:
>
> On 02/05/2014 04:39 PM, Rob Herring wrote:
>>
>> On Wed, Feb 5, 2014 at 7:47 AM, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>> wrote:
>>>
>>> This patch provides bindings for the 64-bit timer in the KeyStone
>>> architecture devices. The timer can be configured as a general-purpose
>>> 64-bit
>>> timer, dual general-purpose 32-bit timers. When configured as dual 32-bit
>>> timers, each half can operate in conjunction (chain mode) or
>>> independently
>>> (unchained mode) of each other.
>>
>> This is software configurable or h/w design time configurations?
>>
>> Rob
>>
>
> This is h/w design time configurations

Then it seems like the binding should provide for describing those
differences either with a property or different compatible strings.

Rob
