From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [PATCH v3 1/2] clk: add clk accuracy retrieval support
Date: Thu, 19 Dec 2013 20:41:23 +0100
Message-ID: <52B34BE3.7000208@overkiz.com>
References: <1387290983-6236-1-git-send-email-b.brezillon@overkiz.com> <1387290983-6236-2-git-send-email-b.brezillon@overkiz.com> <20131219060431.18119.64699@quantum> <52B2B42F.9010202@overkiz.com> <20131219193633.18119.57678@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131219193633.18119.57678@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Rob Landley <rob@landley.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaQ==?= =?UTF-8?B?Zw==?= <u.kleine-koenig@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 19/12/2013 20:36, Mike Turquette a =C3=A9crit :
> Quoting boris brezillon (2013-12-19 00:54:07)
>> Hello Mike,
>>
>> On 19/12/2013 07:04, Mike Turquette wrote:
>>> Quoting Boris BREZILLON (2013-12-17 06:36:22)
>>>> +unsigned long __clk_get_accuracy(struct clk *clk)
>>>> +{
>>>> +       unsigned long ret;
>>>> +
>>>> +       if (!clk)
>>>> +               return 0;
>>>> +
>>>> +       return clk->accuracy;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(__clk_get_accuracy);
>>> Any reason for exporting this?
>> This might be used by clk drivers to choose the most accurate clk
>> among its parent clks (within the determinate_rate callback).
>>
>> And as some clk drivers might be compiled as modules we need
>> to export the symbol (__clk_get_name helper function is exported
>> too).
> Does your driver need this or is this just following the existing
> __clk_get_rate / clk_get_rate model?

No, I don't need this for my driver, at least for the moment.

Do you want me to drop this EXPORT_SYMBOL ?
>
> Regards,
> Mike
>
>> Best Regards,
>>
>> Boris
>>> Regards,
>>> Mike
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
