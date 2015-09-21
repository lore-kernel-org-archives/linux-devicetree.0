From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Mon, 21 Sep 2015 14:46:50 -0500
Message-ID: <56005EAA.3000208@ti.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com>
 <20150919184021.GQ30445@sirena.org.uk> <56003365.8030803@ti.com>
 <20150921192645.GA30445@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150921192645.GA30445@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/21/2015 02:26 PM, Mark Brown wrote:
> On Mon, Sep 21, 2015 at 11:42:13AM -0500, Andrew F. Davis wrote:
>
>> I know this is hard to review, and so I would like to apologize in advance, but
>> the regulator and GPIO changes depend on the new driver core, as do the i2c/spi
>> components. I really don't know how to split this up without leaving some part
>> in a non-working state in-between patches (which I've heard is also not OK).
>
> So split that interface change between the MFD and the function drivers
> out into a separate change - you've got way more than just an interface
> change in here (and you've not enumerated the various things that are
> being changed in the changelog).
>

I'm not really "changing" anything, this is a ground-up re-write. This
fundamentally changes the way the MFD core and the function drivers interact,
I would consider this a whole new driver that just happens to replace an older
driver, not a bunch of incremental changes although I kept the same filenames.
