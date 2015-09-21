From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Mon, 21 Sep 2015 11:42:13 -0500
Message-ID: <56003365.8030803@ti.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com>
 <20150919184021.GQ30445@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150919184021.GQ30445@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/19/2015 01:40 PM, Mark Brown wrote:
> On Tue, Sep 15, 2015 at 12:57:40PM -0500, Andrew F. Davis wrote:
>> The old driver does not support DT. Rewrite the driver adding DT support
>> and use modern kernel features such as regmap and related helpers.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>   drivers/gpio/gpio-tps65912.c           | 291 ++++++------
>>   drivers/mfd/Kconfig                    |  20 +-
>>   drivers/mfd/Makefile                   |   3 +-
>>   drivers/mfd/tps65912-core.c            | 288 +++++-------
>>   drivers/mfd/tps65912-i2c.c             | 233 ++++------
>>   drivers/mfd/tps65912-irq.c             | 217 ---------
>>   drivers/mfd/tps65912-spi.c             | 236 ++++------
>>   drivers/regulator/tps65912-regulator.c | 783 ++++++++++-----------------------
>>   include/linux/mfd/tps65912.h           | 256 +++++++----
>>   9 files changed, 854 insertions(+), 1473 deletions(-)
>
> It's not OK to have a single commit that rewrites multiple drivers over
> many subsystems, that's really not something that can be sensibly
> reviewed.  You should split this into a patch series which makes one
> specific change at a time as covered in SubmittingPatches.  That will
> allow the changes to be reviewed much more sensibly.
>

I know this is hard to review, and so I would like to apologize in advance, but
the regulator and GPIO changes depend on the new driver core, as do the i2c/spi
components. I really don't know how to split this up without leaving some part
in a non-working state in-between patches (which I've heard is also not OK).
