From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [PATCH v3 1/2] clk: add clk accuracy retrieval support
Date: Thu, 19 Dec 2013 09:54:07 +0100
Message-ID: <52B2B42F.9010202@overkiz.com>
References: <1387290983-6236-1-git-send-email-b.brezillon@overkiz.com> <1387290983-6236-2-git-send-email-b.brezillon@overkiz.com> <20131219060431.18119.64699@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131219060431.18119.64699@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Rob Landley <rob@landley.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaQ==?= =?UTF-8?B?Zw==?= <u.kleine-koenig@pengutronix.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Mike,

On 19/12/2013 07:04, Mike Turquette wrote:
> Quoting Boris BREZILLON (2013-12-17 06:36:22)
>> +unsigned long __clk_get_accuracy(struct clk *clk)
>> +{
>> +       unsigned long ret;
>> +
>> +       if (!clk)
>> +               return 0;
>> +
>> +       return clk->accuracy;
>> +}
>> +EXPORT_SYMBOL_GPL(__clk_get_accuracy);
> Any reason for exporting this?

This might be used by clk drivers to choose the most accurate clk
among its parent clks (within the determinate_rate callback).

And as some clk drivers might be compiled as modules we need
to export the symbol (__clk_get_name helper function is exported
too).

Best Regards,

Boris
>
> Regards,
> Mike
