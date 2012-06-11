From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] devicetree: bindings: gpio-i2c belongs to i2c not gpio
Date: Mon, 11 Jun 2012 07:31:52 -0500
Message-ID: <4FD5E538.4050601@gmail.com>
References: <1334934487-19201-1-git-send-email-w.sang@pengutronix.de> <20120611122648.GA4407@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120611122648.GA4407@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@xenotime.net>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/11/2012 07:26 AM, Wolfram Sang wrote:
> On Fri, Apr 20, 2012 at 05:08:02PM +0200, Wolfram Sang wrote:
>> gpio-i2c describes an I2C controller (using gpios for data and clock),
>> so it must be described in i2c, not gpio.
>>
>> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
>> ---
>>  .../{gpio/gpio_i2c.txt => i2c/gpio-i2c.txt}        |    0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename Documentation/devicetree/bindings/{gpio/gpio_i2c.txt => i2c/gpio-i2c.txt} (100%)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio_i2c.txt b/Documentation/devicetree/bindings/i2c/gpio-i2c.txt
>> similarity index 100%
>> rename from Documentation/devicetree/bindings/gpio/gpio_i2c.txt
>> rename to Documentation/devicetree/bindings/i2c/gpio-i2c.txt
> 
> Any objections to me taking the patch via the i2c-tree?

That's fine.

Acked-by: Rob Herring <rob.herring@calxeda.com>
