From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] DT: mfd: add device-tree binding doc fro PMIC max77620/max20024
Date: Fri, 8 Jan 2016 08:19:37 -0600
Message-ID: <CAL_JsqJ=bhFF2X-LHFtboWFP3Ch=W8VBr2gv1EFRTb4EgtM=2w@mail.gmail.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-2-git-send-email-ldewangan@nvidia.com> <20160107231249.GA17514@rob-hp-laptop>
 <568F51FF.7000102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <568F51FF.7000102@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux@googlegroups.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 8, 2016 at 12:06 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> Thanks Rob for review.
> I have taken care of all comment except following which I have query.
>
> On Friday 08 January 2016 04:42 AM, Rob Herring wrote:
>>
>> +       - maxim,low-battery-reset-enable: Enable low battery reset.
>> +       - maxim,low-battery-reset-disable: Disable low battery reset.
>> Why not boolean? Not present means keep default value? I'd prefer
>> boolean or tristate of not present, 0 to disable, or 1 to enable.
>>
>>
> Here, the properties are boolean. I will add this on the description.
>
> I like to enable or disable with the DT and properties are not there then
> left to default.
> So added two properties for enable and disable. If properties are there, do
> the activity.
>
> Here tristate is also possible:
> maxim,low-battery-reset: tristate, low battery reset control. 0 for disable,
> 1 for enable and
>                                  absence of this will leave configuration on
> default.
>
> Does it look fine?

Yes.

Rob
