From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V5 1/3] mfd: add support for ams AS3722 PMIC
Date: Mon, 21 Oct 2013 16:48:58 +0530
Message-ID: <52650DA2.60609@nvidia.com>
References: <1381321761-8898-1-git-send-email-ldewangan@nvidia.com> <1381321761-8898-2-git-send-email-ldewangan@nvidia.com> <525580A8.5050902@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <525580A8.5050902@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "lee.jones@linaro.org" <lee.jones@linaro.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "rob@landley.net" <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Florian Lobmaier <florian.lobmaier>
List-Id: devicetree@vger.kernel.org

Hi Lee/Samuel,

On Wednesday 09 October 2013 09:43 PM, Stephen Warren wrote:
> On 10/09/2013 06:29 AM, Laxman Dewangan wrote:
>> The ams AS3722 is a compact system PMU suitable for mobile phones,
>> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
>> controller, 11 LDOs, RTC, automatic battery, temperature and
>> over-current monitoring, 8 GPIOs, ADC and a watchdog.
>>
>> Add MFD core driver for the AS3722 to support core functionality.
> OK, I think the binding here is about clear enough, so the binding,
> Acked-by: Stephen Warren <swarren@nvidia.com>


I saw that Lee has already acked this (V4) for the nondt side.

As there is no issue on dt side also, can it be apply please?


