From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] regulator: fixed: add possibility to enable by
 clock
Date: Mon, 7 Oct 2019 07:25:43 -0700
Message-ID: <50190291-7146-5a2d-e4ae-c08c3de553d3@roeck-us.net>
References: <20190910062103.39641-1-philippe.schenker@toradex.com>
 <20190910062103.39641-2-philippe.schenker@toradex.com>
 <20191007132918.GA580@roeck-us.net>
 <3072f9de201a9d06cb0b71018be25f316c3d4435.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3072f9de201a9d06cb0b71018be25f316c3d4435.camel@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Luka Pivk <luka.pivk@toradex.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "broonie@kernel.org" <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 10/7/19 6:57 AM, Philippe Schenker wrote:
> On Mon, 2019-10-07 at 06:29 -0700, Guenter Roeck wrote:
>> On Tue, Sep 10, 2019 at 06:21:15AM +0000, Philippe Schenker wrote:
>>> This commit adds the possibility to choose the compatible
>>> "regulator-fixed-clock" in devicetree.
>>>
>>> This is a special regulator-fixed that has to have a clock, from
>>> which
>>> the regulator gets switched on and off.
>>>
>>> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
>>
>> This patch causes a crash in one of my qemu tests (kzm machine with
>> imx_v6_v7_defconfig). Reverting this patch fixes the problem.
>> Crash backtrace and bisect log attached below.
>>
>> Guenter
> 
> Axel Lin sent a patch to fix this NULL pointer issue with my patch
> (Thanks by the way :)). I guess it will help for your issue. Could you
> please test if this patch solves your issue?
> 

Yes, it does. I replied with Tested-by: on the fixup patch.

Thanks,
Guenter
