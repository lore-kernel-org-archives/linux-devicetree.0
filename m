From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4 2/5] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Mon, 25 Jan 2016 16:50:35 +0530
Message-ID: <56A60503.1050004@nvidia.com>
References: <1453198783-28383-1-git-send-email-ldewangan@nvidia.com> <1453198783-28383-3-git-send-email-ldewangan@nvidia.com> <569F199D.9020207@samsung.com> <56A214EB.30905@nvidia.com> <20160125112936.GB3368@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160125112936.GB3368@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, vreddytalla@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Monday 25 January 2016 04:59 PM, Lee Jones wrote:
> On Fri, 22 Jan 2016, Laxman Dewangan wrote:
>
>> Thanks Krzysztof for review.
>>
>> Hi Lee,
>> Are you taking the patches from your tree? Or will go in individual
>> subsystem?
> I can take the set if there are build dependencies.  If there aren't,
> then they should be routed via their respective subsystem trees.
>
>

All drivers include the header of max77620 which is part of mfd patch. 
Hence it has build dependency.
However, config of sub module will only be enabled if MFD config enabled.

