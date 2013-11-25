From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 1/3] mtd: nand: davinci: reuse driver for Keystone arch
Date: Mon, 25 Nov 2013 17:57:30 +0200
Message-ID: <5293736A.2060108@ti.com>
References: <1384964699-15134-1-git-send-email-ivan.khoronzhuk@ti.com> <1384964699-15134-2-git-send-email-ivan.khoronzhuk@ti.com> <201311231915.29643.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201311231915.29643.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/23/2013 08:15 PM, Arnd Bergmann wrote:
> On Wednesday 20 November 2013, Ivan Khoronzhuk wrote:
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -523,6 +523,7 @@ static struct nand_ecclayout hwecc4_2048 __initconst = {
>>   #if defined(CONFIG_OF)
>>   static const struct of_device_id davinci_nand_of_match[] = {
>>          {.compatible = "ti,davinci-nand", },
>> +       {.compatible = "ti,keystone-nand", },
>>          {},
>>   };
>>   MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
>
> Same comment as for the watchdog driver: when the devices are actually compatible,
> the driver does not need to know the new string, the preferred method is to
> set both strings from the .dts file.
>
> 	Arnd
>

Thanks. I'll correct it.

-- 
Regards,
Ivan Khoronzhuk
