From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 03/11] dt-bindings: clock: add NXP LPC32xx clock list
 for consumers
Date: Fri, 20 Nov 2015 19:58:06 +0200
Message-ID: <564F5F2E.70607@mleia.com>
References: <1447981511-29653-1-git-send-email-vz@mleia.com> <1447981511-29653-4-git-send-email-vz@mleia.com> <4268221.QhjAE5RLYk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <4268221.QhjAE5RLYk@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@arm.linux.org.uk>, Roland Stigge <stigge@antcom.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 20.11.2015 15:56, Arnd Bergmann wrote:
> On Friday 20 November 2015 03:05:03 Vladimir Zapolskiy wrote:
>> +
>> +/* LPC32XX System Control Block clocks */
>> +#define LPC32XX_CLK_RTC                0
>> +#define LPC32XX_CLK_DMA                1
>> +#define LPC32XX_CLK_MLC                2
>> +#define LPC32XX_CLK_SLC                3
>> +#define LPC32XX_CLK_LCD                4
>> +#define LPC32XX_CLK_MAC                5
>> +#define LPC32XX_CLK_SD         6
>> +#define LPC32XX_CLK_DDRAM      7
>> +#define LPC32XX_CLK_SSP0       8
>> +#define LPC32XX_CLK_SSP1       9
>> +#define LPC32XX_CLK_UART3      10
>> +#define LPC32XX_CLK_UART4      11
>> +#define LPC32XX_CLK_UART5      12
>> +#define LPC32XX_CLK_UART6      13
>> +#define LPC32XX_CLK_IRDA       14
>> +#define LPC32XX_CLK_I2C1       15
>>
> 
> Any chance we can avoid the include file? This is going to make it really
> hard to merge everything in one merge window with the dependencies between
> the driver, the bindings and the platform code.

I see only one option to avoid this commit, namely squash it with the
CCF driver and merge it before making changes in DTS.

However I suppose ARM trees won't be synced on clk tree, so probably it
won't simplify maintainer's work.

> If there is a way to describe the clocks based on numbers from the
> data sheet instead of making up your own, that makes life much
> easier for us.

There are no any clock numbers in the datasheet, unfortunately.

--
Vladimir
