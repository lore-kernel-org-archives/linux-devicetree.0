From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Re: [PATCH 0/6] mfd: 88pm800: Add 88pm860 device support
Date: Thu, 09 Jul 2015 18:14:10 +0530
Message-ID: <559E6C9A.8090004@linaro.org>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org> <CAJKOXPetR4KkfRVNz_QtVfFnjQ7p455QknErr1gnK9iBYgRY+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPetR4KkfRVNz_QtVfFnjQ7p455QknErr1gnK9iBYgRY+A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org



On Thursday 09 July 2015 05:34 PM, Krzysztof Kozlowski wrote:
> 2015-07-09 20:47 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath@linaro.org>:
>> 88PM860 falls under 88pm800 family of devices, with some feature
>> additions, for example, support for dual phase on BUCK1.
>
> Hi,
>
> There are already drivers for 88PM860: mfd, charger and battery. Isn't
> you duplicating existing code?
>

Can you please point me to MFD driver for 88PM860 (Not the charger and
battery, as I treat them subdevice) ???

I do not think 88PM860 MFD driver is supported already. Correct me if I
am wrong.

Thanks,
Vaibhav
