From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v3 9/9] mtd: nand: davinci: don't request AEMIF address
 range
Date: Tue, 17 Dec 2013 12:33:28 +0200
Message-ID: <52B02878.8090703@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386264358-9738-10-git-send-email-ivan.khoronzhuk@ti.com>
 <20131217084238.GJ12034@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20131217084238.GJ12034@norris-Latitude-E6410>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12/17/2013 10:42 AM, Brian Norris wrote:
> On Thu, Dec 05, 2013 at 07:25:57PM +0200, Ivan Khoronzhuk wrote:
>> The TI AEMIF driver registers are used to setup timings for each chip
>> select. The same registers range is used to setup NAND settings.
>> The AEMIF and NAND drivers not use the same registers in this range.
>>
>> In case with TI AEMIF driver, the memory address range is requested
>> already by AEMIF, so we cannot request it twice, just ioremap.
>>
>> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
>> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> Reviewed-by: Taras Kondratiuk <taras@ti.com>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>> ---
>>   drivers/mtd/nand/davinci_nand.c |    8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
>> index f7b21b8..0cd4dbc 100644
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -636,9 +636,11 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>>   	if (IS_ERR(vaddr))
>>   		return PTR_ERR(vaddr);
>>
>> -	base = devm_ioremap_resource(&pdev->dev, res2);
>> -	if (IS_ERR(base))
>> -		return PTR_ERR(base);
>> +	base = devm_ioremap(&pdev->dev, res2->start, resource_size(res2));
>
> Since it's important that we don't re-introduce the "request resource"
> boilerplate later, can you add a comment describing the situation?
>
>> +	if (!base) {
>> +		dev_err(&pdev->dev, "ioremap failed for resource %pR\n", res2);
>> +		return -EADDRNOTAVAIL;
>> +	}
>>
>>   	info->dev		= &pdev->dev;
>>   	info->base		= base;
>
> Thanks,
> Brian
>

Yes, I'll add the comment.

-- 
Regards,
Ivan Khoronzhuk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
