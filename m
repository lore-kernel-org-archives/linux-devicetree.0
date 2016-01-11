From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [rtc-linux] [PATCH 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Mon, 11 Jan 2016 15:26:05 +0900
Message-ID: <56934AFD.5060008@samsung.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-3-git-send-email-ldewangan@nvidia.com>
 <CAJKOXPfa0jjRWE6LKvNmwCRcG9Es7=36_03kTqCx-aB1wENx0g@mail.gmail.com>
 <20160111054627.GB3331@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <20160111054627.GB3331@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: rtc-linux@googlegroups.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 11.01.2016 14:46, Lee Jones wrote:
> On Fri, 08 Jan 2016, Krzysztof Kozlowski wrote:
> 
> Thanks for taking the time to review.
> 
>> ()2016-01-07 23:38 GMT+09:00 Laxman Dewangan <ldewangan@nvidia.com>:
>>> MAX77620/MAX20024 are Power Management IC from the MAXIM.
>>> It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
>>> watchdog, clock etc.
>>>
>>> Add MFD drier to provides common support for accessing the
>>> device; additional drivers is developed on respected subsystem
>>> in order to use the functionality of the device.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>>> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
>>> Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
>>> Tested-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
>>
>> The Testing and Reviewed are statements (see SubmittingPatches) so
>> they should be made explicitly by people. As this is v1 how they could
>> make a public statement so far?
> 
> SubmittingPatches bears no mention that Reviewed-by/Tested-by
> statements have to be provided on one of the public mailing lists.
> These can be provided privately prior to upstream submission v1.

Indeed the document does not mention that they have to be provided by
public.

In the same time these are statements given by a reviewer ("By offering
my Reviewed-by: tag, I state that:")... and how can you validate a
statement given through a private channel? Is it true? Is it a thorough
testing or just copy-paste from Gerrit (or other automated system)?

Best regards,
Krzysztof

