From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [rtc-linux] [PATCH 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Fri, 8 Jan 2016 22:32:37 +0900
Message-ID: <CAJKOXPfOKoV2A1NMyyL5kc=3v6eyTS2T4tRmqM_0=3jBoAZiNg@mail.gmail.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
	<1452177524-23192-3-git-send-email-ldewangan@nvidia.com>
	<CAJKOXPfa0jjRWE6LKvNmwCRcG9Es7=36_03kTqCx-aB1wENx0g@mail.gmail.com>
	<568F7E7B.1010501@nvidia.com>
	<568FB62C.9020109@samsung.com>
	<568FB757.9080303@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <568FB757.9080303@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: rtc-linux@googlegroups.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

2016-01-08 22:19 GMT+09:00 Laxman Dewangan <ldewangan@nvidia.com>:
>
> On Friday 08 January 2016 06:44 PM, Krzysztof Kozlowski wrote:
>>
>>
>> To avoid compilation warning,  I need to use inline here.
>> Because this shouldn't be defined in header at the first place. Instead
>> define it in main MFD driver with EXPORT_SYMBOL() and put in headers
>> just declaration.
>>
> what about __maybe_unused instead on inline and keep in header.
>
> Anyhow, I do not have any personal choice here.

This just shouldn't be defined in header because that makes it
spreading over many object files. There are just no benefits.

Best regards,
Krzysztof
