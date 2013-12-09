From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v3] ARM: davinci: aemif: get rid of davinci-nand driver
 dependency on aemif
Date: Mon, 9 Dec 2013 10:58:27 +0200
Message-ID: <52A58633.7060705@ti.com>
References: <1386267092-18615-1-git-send-email-ivan.khoronzhuk@ti.com> <52A23BE0.2000207@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52A23BE0.2000207@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, rob@landley.net, linux@arm.linux.org.uk, mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, pawel.moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On 12/06/2013 11:04 PM, Sekhar Nori wrote:
> On 12/5/2013 11:41 PM, Ivan Khoronzhuk wrote:
> 
>> diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
>> index 7aa105b..98a66ff 100644
>> --- a/arch/arm/mach-davinci/board-mityomapl138.c
>> +++ b/arch/arm/mach-davinci/board-mityomapl138.c
>> @@ -432,6 +432,9 @@ static void __init mityomapl138_setup_nand(void)
>>   {
>>   	platform_add_devices(mityomapl138_devices,
>>   				 ARRAY_SIZE(mityomapl138_devices));
>> +
>> +	if (davinci_aemif_setup(&mityomapl138_nandflash_device))
>> +		pr_warn("%s: Cannot configure AEMIF.\n", __func__);
>>   }
> 
> I must be missing something, but exactly why is this required for
> board-mityomapl138.c?
> 
> Thanks,
> Sekhar
> 

board-mityomapl138.c - only one board file with NAND_BUSWIDTH_16 option set in pdata.
By default bus width is treated as 8 bit, in another case we have to set it.
Currently bus width setup is done in davinci_aemif_setup(). So, to set bus width
correctly we have to call davinci_aemif_setup() for board in question.

-- 
Regards,
Ivan Khoronzhuk
