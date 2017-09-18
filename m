From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/2] clk: Add Aspeed G5 clock driver
Date: Mon, 18 Sep 2017 22:49:44 +0930
Message-ID: <CACPK8XeYWj_bx3qysjCQXJgdR6xWONAg09peJc-=ajX8UtFO_Q@mail.gmail.com>
References: <20170823060957.31167-1-joel@jms.id.au> <20170823060957.31167-2-joel@jms.id.au>
 <1505446920.4080.13.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1505446920.4080.13.camel@aj.id.au>
Sender: linux-clk-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 1:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2017-08-23 at 15:39 +0930, Joel Stanley wrote:
>> This driver supports the ast2500 and derivative BMC SoCs from Aspeed.
>>
>> All of the important clocks are supported, with most non-essential ones
>> also implemented where information is available. I am working with
>> Aspeed to clear up some of the missing information, including the
>> missing parent-sibling relationships.
>>
>> We need to know the rate of the apb clock in order to correctly program
>> the clocksource driver, so the apb and it's parents are created in the
>> CLK_OF_DECLARE_DRIVER callback.
>>
>> The rest of the clocks are created at normal driver probe time. I
>> followed the Gemini driver's lead with using the regmap where I could,
>> but also having a pointer to the base address for use with the common
>> clock callbacks.
>>
>> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  drivers/clk/Kconfig                      |  12 +
>>  drivers/clk/Makefile                     |   1 +
>>  drivers/clk/clk-aspeed.c                 | 547 +++++++++++++++++++++++++++++++
>
> The patch subject suggests the implementation is specific to the G5
> series SoC, but the name of the driver is generic. How similar are the
> G4 and G5 clock devices? Is the intent to expand the implementation to
> also cover the G4 series, or should this be renamed to something more
> specific?

The intent is to cover the G4 platforms with the same driver. I sent
this version along early to get feedback on the structure.

As it turns out, it was simple to get the G4 going with the same code.
I'll send a v2 in the next day or so.

Cheers,

Joel
