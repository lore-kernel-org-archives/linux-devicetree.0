From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH] reset: socfpga: use arch_initcall for early initialization
Date: Wed, 15 Oct 2014 08:53:26 -0500
Message-ID: <543E7C56.3090508@opensource.altera.com>
References: <1412822646-11257-1-git-send-email-dinguyen@opensource.altera.com> <1412845410.6809.3.camel@pengutronix.de> <54368AA2.9000104@opensource.altera.com> <20141009132835.GI15799@pengutronix.de> <alpine.DEB.2.02.1410090950540.17462@atx-linux-37> <20141009151935.GK15799@pengutronix.de> <alpine.DEB.2.02.1410101123590.11270@atx-linux-37> <alpine.DEB.2.02.1410141322160.11888@atx-linux-37> <20141015100247.GB6255@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141015100247.GB6255@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, atull <atull@opensource.altera.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, dinh.linux@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/15/14, 5:02 AM, Steffen Trumtrar wrote:
> Hi!
> 
> On Tue, Oct 14, 2014 at 01:45:29PM -0500, atull wrote:
>> The FPGA bridge driver that I submitted last year handled the following
>> things:
>>  * The bridges might have been brought out of reset in the bootloader. Some
>>    of the bridges have write-only registers (!) so this information had to
>>    be passed in DT
> 
> Regmap has infrastructure to handle this.
> 

The current implementation of Alan's bridge driver is using regmap to
toggle the reset manager bits. However, that required adding "syscon" to
the reset manager's DTS node. By doing this, the reset driver was not
able to load.

So that's the story behind why I'm looking to convert Alan's bridge
driver to use the reset driver.

Dinh
