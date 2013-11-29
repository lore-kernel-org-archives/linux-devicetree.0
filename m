From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 1/2] memory: ti-aemif: introduce AEMIF driver
Date: Fri, 29 Nov 2013 17:35:28 +0200
Message-ID: <5298B440.1020905@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384962416-14862-2-git-send-email-ivan.khoronzhuk@ti.com>
 <5298B370.3090405@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <5298B370.3090405@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, gregkh@linuxfoundation.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/29/2013 05:32 PM, Santosh Shilimkar wrote:
> On Wednesday 20 November 2013 10:46 AM, Ivan Khoronzhuk wrote:
>> Add new AEMIF driver for EMIF16 Texas Instruments controller.
>> The EMIF16 module is intended to provide a glue-less interface to
>> a variety of asynchronous memory devices like ASRA M, NOR and NAND
>> memory. A total of 256M bytes of any of these memories can be
>> accessed at any given time via four chip selects with 64M byte access

[...]

>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id aemif_of_match[] = {
>> +	{ .compatible = "ti,davinci-aemif", },
>> +	{ .compatible = "ti,keystone-aemif", },
>> +	{ .compatible = "ti,omap-L138-aemif", },
>> +	{},
>> +};
>> +
> Looks like you are yet to update the patches from
> previous comments. Did I miss v2 or you haven't posted
> that yet ?

No. This is v2, actually :( (the mess was already noticed) it was posted 
after v1 (https://lkml.org/lkml/2013/11/11/352), but people continue 
commenting v1, for some reasons.

Next version will be posted when bindings will be clarified finally.

Regards,
-grygorii



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
