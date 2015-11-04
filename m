From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Wed, 4 Nov 2015 09:35:26 -0600
Message-ID: <563A25BE.90609@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151022164724.GZ8232@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/22/2015 11:47 AM, Mark Brown wrote:
> On Thu, Oct 01, 2015 at 03:37:53PM -0500, Andrew F. Davis wrote:
>
>> +static const struct of_device_id tps65912_regulator_of_match_table[] = {
>> +	{ .compatible = "ti,tps65912-regulator", },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tps65912_regulator_of_match_table);
>
> Does this IP block exist outside of the tps65912?  If not why is it
> directly represented in DT?  It seems like this is describing how Linux
> loads drivers not how the hardware is constructed but DT should describe
> the hardware.
>

Something I just noticed, when I remove this table, module loading stops
working, even with 'MODULE_ALIAS("platform:tps65912-regulator");'. It
looks like when DT is enabled platform_uevent (drivers/base/platform.c:787)
only sends out the OF MODALIAS event then returns, not sending out the
platform event, is this desired behavior? If so then I will need this
table even though I still create the device and match it on platform
name as you suggested.
