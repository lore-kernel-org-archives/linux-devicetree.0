From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4 3/5] pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
Date: Thu, 28 Jan 2016 15:43:23 +0530
Message-ID: <56A9E9C3.4040809@nvidia.com>
References: <1453198783-28383-1-git-send-email-ldewangan@nvidia.com>	<1453198783-28383-4-git-send-email-ldewangan@nvidia.com> <CACRpkdZEYw2aADQDNSi0kKns17nKZQZKY+harLhc0j3pA-5FuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZEYw2aADQDNSi0kKns17nKZQZKY+harLhc0j3pA-5FuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dzaw==?= =?UTF-8?B?aQ==?= <k.kozlowski@samsung.com>, vreddytalla@nv
List-Id: devicetree@vger.kernel.org


On Thursday 28 January 2016 03:34 PM, Linus Walleij wrote:
> On Tue, Jan 19, 2016 at 11:19 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO pins
>> which also act as the special function in alternate mode. Also
>> there is configuration like push-pull, open drain, FPS timing
>> etc for these pins.
>>
>> Add pincontrol driver to configure these parameters through
>> pincontrol APIs.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
> Nice. This driver looks like a lot of hard work, but I think
> it's worth it.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you very much for acknowledgement.

> I guess Lee will be merging this into the MTD tree.
>
> (I still had those comments on the DT bindings but this driver
> part looks fine.)
>
>
I have posted patch V5 for enhancing DT binding doc as suggested by you 
and Lee. Request you to help on review.

I am going to send V6 to separate out DT binding doc patch with the 
driver file which I did in V5 and so want to correct if there is any 
more pending on document enhancement.
