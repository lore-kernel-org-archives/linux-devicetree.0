From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v5 3/6] staging: fpga manager: framework core
Date: Fri, 19 Dec 2014 08:22:31 +0100
Message-ID: <28ea2232cf2d4d63b6a85a10decd4198@BN1AFFO11FD039.protection.gbl>
References: <1418835289-15752-1-git-send-email-atull@opensource.altera.com>
 <1418835289-15752-4-git-send-email-atull@opensource.altera.com>
 <05395a89d783481b8b7c06bb299b53e0@BL2FFO11FD020.protection.gbl>
 <alpine.DEB.2.02.1412181440490.25208@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1412181440490.25208@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>, Michal Simek <michal.simek@xilinx.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguye
List-Id: devicetree@vger.kernel.org

On 12/18/2014 09:46 PM, atull wrote:
> On Thu, 18 Dec 2014, Michal Simek wrote:
> 
>> Hi Alan,
>>
>> first of all - there are these kernel-doc warnings.
>>
>> Info(drivers/staging/fpga/fpga-mgr.c:37): Scanning doc for fpga_mgr_low_level_state
>> Warning(drivers/staging/fpga/fpga-mgr.c:43): No description found for return value of 'fpga_mgr_low_level_state'
>> Info(drivers/staging/fpga/fpga-mgr.c:51): Scanning doc for __fpga_mgr_reset
>> Warning(drivers/staging/fpga/fpga-mgr.c:55): No description found for return value of '__fpga_mgr_reset'
>> Info(drivers/staging/fpga/fpga-mgr.c:69): Scanning doc for fpga_mgr_reset
>> Warning(drivers/staging/fpga/fpga-mgr.c:73): No description found for return value of 'fpga_mgr_reset'
>> Info(drivers/staging/fpga/fpga-mgr.c:88): Scanning doc for __fpga_mgr_stage_init
>> Warning(drivers/staging/fpga/fpga-mgr.c:92): No description found for return value of '__fpga_mgr_stage_write_init'
>> Info(drivers/staging/fpga/fpga-mgr.c:108): Scanning doc for __fpga_mgr_stage_write
>> Warning(drivers/staging/fpga/fpga-mgr.c:115): No description found for return value of '__fpga_mgr_stage_write'
>> Info(drivers/staging/fpga/fpga-mgr.c:129): Scanning doc for __fpga_mgr_stage_complete
>> Warning(drivers/staging/fpga/fpga-mgr.c:133): No description found for return value of '__fpga_mgr_stage_write_complete'
>> Info(drivers/staging/fpga/fpga-mgr.c:151): Scanning doc for __fpga_mgr_write
>> Warning(drivers/staging/fpga/fpga-mgr.c:158): No description found for return value of '__fpga_mgr_write'
>> Info(drivers/staging/fpga/fpga-mgr.c:173): Scanning doc for fpga_mgr_write
>> Warning(drivers/staging/fpga/fpga-mgr.c:179): No description found for return value of 'fpga_mgr_write'
>> Info(drivers/staging/fpga/fpga-mgr.c:195): Scanning doc for fpga_mgr_firmware_write
>> Warning(drivers/staging/fpga/fpga-mgr.c:204): No description found for return value of 'fpga_mgr_firmware_write'
>> Info(drivers/staging/fpga/fpga-mgr.c:234): Scanning doc for fpga_mgr_name
>> Warning(drivers/staging/fpga/fpga-mgr.c:239): No description found for return value of 'fpga_mgr_name'
>> Info(drivers/staging/fpga/fpga-mgr.c:414): Scanning doc for fpga_mgr_register
>> Warning(drivers/staging/fpga/fpga-mgr.c:423): No description found for return value of 'fpga_mgr_register'
>> Info(drivers/staging/fpga/fpga-mgr.c:480): Scanning doc for fpga_mgr_remove
>> Warning(drivers/staging/fpga/fpga-mgr.c:484): No description found for parameter 'pdev'
>> Warning(drivers/staging/fpga/fpga-mgr.c:484): Excess function parameter 'dev' description in 'fpga_mgr_remove'
>>
> 
> I see the warnings now.  I wasn't using the '-v' option for kernel-doc.
> Fixed in v6.
> 
>>> diff --git a/drivers/staging/fpga/Makefile b/drivers/staging/fpga/Makefile
>>> new file mode 100644
>>> index 0000000..ff6c677
>>> --- /dev/null
>>> +++ b/drivers/staging/fpga/Makefile
>>> @@ -0,0 +1,10 @@
>>> +#
>>> +# Makefile for the fpga framework and fpga manager drivers.
>>> +#
>>> +
>>> +fpga-mgr-core-y += fpga-mgr.o
>>
>> remove this line - it is unused.
>>
> 
> OK
> 
>>> +static int __init fpga_mgr_dev_init(void)
>>> +{
>>> +	pr_info("FPGA Manager framework driver\n");
>>> +
>>> +	fpga_mgr_class = class_create(THIS_MODULE, "fpga_manager");
>>> +	if (IS_ERR(fpga_mgr_class))
>>> +		return PTR_ERR(fpga_mgr_class);
>>> +
>>> +	fpga_mgr_class->dev_groups = fpga_mgr_groups;
>>
>>
>> Write this here.
>>        if (IS_ENABLED(CONFIG_FPGA_MGR_SYSFS)) {
>>              fpga_mgr_class->dev_groups = fpga_mgr_groups;
>>        }
>>
>> I have tested it and it is working just fine. You can compile this
>> driver with SYSFS=n
>> The whole code is built and config option just export it.
>> I think it is better than having #if there.
>>
>> Greg: Is there any problem with this solution?
>>
> 
> I'm cool with this myself.  I'll add in v6.
> 
>> BTW: I have pushed my branch to zero day testing system to get better coverage
>>
> 
> Michal, I've already done that with each submission.  Assuming you are
> referring to the kbuild test robot.

Yes, Kbuild test robot.

Thanks,
Michal


