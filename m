From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v6 3/3] gpio: tps65086: Add GPO driver for the TPS65086
 PMIC
Date: Tue, 26 Jan 2016 08:38:04 -0600
Message-ID: <56A784CC.4090902@ti.com>
References: <1453737012-3130-1-git-send-email-afd@ti.com>
 <1453737012-3130-4-git-send-email-afd@ti.com> <20160126140312.GB3368@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160126140312.GB3368@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/26/2016 08:03 AM, Lee Jones wrote:
> On Mon, 25 Jan 2016, Andrew F. Davis wrote:
>
>> Add support for the TPS65086 PMIC GPOs.
>>
>> TPS65086 has four configurable GPOs that can be used for several
>> purposes. These are output only.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>   drivers/gpio/Kconfig         |   6 ++
>>   drivers/gpio/Makefile        |   1 +
>>   drivers/gpio/gpio-tps65086.c | 144 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 151 insertions(+)
>>   create mode 100644 drivers/gpio/gpio-tps65086.c
>
> Is this patch orthogonal to the other two in the set, or do they all
> need to go in together?
>

These can all go in separately, in fact Mark has already taken the regulator
component from a previous push of this series. It is only the TPS65912
driver I'm pushing that will need to go all at once due to conflicts with
the driver it is replacing.
