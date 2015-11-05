From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Thu, 5 Nov 2015 12:04:00 -0600
Message-ID: <563B9A10.4020907@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk> <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151105101417.GM1717@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/05/2015 04:14 AM, Mark Brown wrote:
> On Wed, Nov 04, 2015 at 09:35:26AM -0600, Andrew F. Davis wrote:
>
>> Something I just noticed, when I remove this table, module loading stops
>> working, even with 'MODULE_ALIAS("platform:tps65912-regulator");'. It
>> looks like when DT is enabled platform_uevent (drivers/base/platform.c:787)
>> only sends out the OF MODALIAS event then returns, not sending out the
>> platform event, is this desired behavior? If so then I will need this
>> table even though I still create the device and match it on platform
>> name as you suggested.
>
> That sounds like a bug to me, it'll have broken a bunch of existing
> devices.
>

Most OF drivers have the OF MODALIAS.

'platform_uevent' can only emit one MODALIAS string per device (only
the last emitted one seems to count), so for any device with
'dev->of_node' set it will be the OF MODALIAS string. So I need
that table (to generate the OF MODALIAS) or this sub-device module
will not be loaded.
