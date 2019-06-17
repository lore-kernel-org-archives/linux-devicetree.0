From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 3/4] regulator: Add regulator driver for ATC260x PMICs
Date: Mon, 17 Jun 2019 18:38:53 +0200
Message-ID: <a38d26d1-213c-31ef-9cc7-1d4bdda4ceab@suse.de>
References: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
 <20190617155011.15376-4-manivannan.sadhasivam@linaro.org>
 <20190617163015.GD5316@sirena.org.uk>
 <20190617163413.GA16152@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617163413.GA16152@Mani-XPS-13-9360>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: lee.jones@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 17.06.19 um 18:34 schrieb Manivannan Sadhasivam:
> On Mon, Jun 17, 2019 at 05:30:15PM +0100, Mark Brown wrote:
>> On Mon, Jun 17, 2019 at 09:20:10PM +0530, Manivannan Sadhasivam wrote:
>>
>>> +++ b/drivers/regulator/atc260x-regulator.c
>>> @@ -0,0 +1,389 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Regulator driver for ATC260x PMICs
>>
>> Please make the entire comment a C++ one so this looks more intentional.

No, this is intentional and the official style requested by GregKH.

He suggested I patch the SPDX documentation to make this clearer, but I
did not find time for this yet (and am not the one making this rule).

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
