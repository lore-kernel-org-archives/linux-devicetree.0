From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v3 1/9] mtd: nand: davinci: fix driver registration
Date: Tue, 17 Dec 2013 12:21:12 +0200
Message-ID: <52B02598.5060004@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386264358-9738-2-git-send-email-ivan.khoronzhuk@ti.com>
 <20131217092449.GL12034@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20131217092449.GL12034@norris-Latitude-E6410>
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

On 12/17/2013 11:24 AM, Brian Norris wrote:
> On Thu, Dec 05, 2013 at 07:25:49PM +0200, Ivan Khoronzhuk wrote:
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -877,6 +877,7 @@ static int __exit nand_davinci_remove(struct platform_device *pdev)
>>   }
>>   
>>   static struct platform_driver nand_davinci_driver = {
>> +	.probe		= nand_davinci_probe,
>>   	.remove		= __exit_p(nand_davinci_remove),
> 
> I believe you need to drop the __exit_p() here. And now that you're
> using module_platform_driver(), you need to drop the __init and __exit
> from the probe() and remove() routines, to avoid section mismatch
> warnings.
> 
>>   	.driver		= {
>>   		.name	= "davinci_nand",
> 
> So on second thought, please resubmit the series with the requested
> changes.
> 
> Thanks,
> Brian
> 

Thanks, Brian.
Do you want me to drop it in stand alone patch or in this one?

-- 
Regards,
Ivan Khoronzhuk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
