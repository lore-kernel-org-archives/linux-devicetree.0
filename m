From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v6 4/4] staging: fpga manager: add driver for socfpga
 fpga manager
Date: Fri, 19 Dec 2014 15:05:50 +0100
Message-ID: <2d65a072f8c14d1e839307465f177a1a@BY2FFO11FD046.protection.gbl>
References: <1418941748-16111-1-git-send-email-atull@opensource.altera.com>
 <1418941748-16111-5-git-send-email-atull@opensource.altera.com>
 <20141219085516.GF13070@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141219085516.GF13070@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguyen@
List-Id: devicetree@vger.kernel.org

On 12/19/2014 09:55 AM, Steffen Trumtrar wrote:
> Hi!
> 
> Just a minor nitpick, but...
> 
> On Thu, Dec 18, 2014 at 04:29:08PM -0600, atull@opensource.altera.com wrote:
>> From: Alan Tull <atull@opensource.altera.com>
>>
>> Add driver to fpga manager framework to allow configuration
>> of FPGA in Altera SoCFPGA parts.
>>
>> Signed-off-by: Alan Tull <atull@opensource.altera.com>
>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>> v2: fpga_manager struct now contains struct device
>>     fpga_manager_register parameters now take device
>>
>> v3: skip a version to align versions
>>
>> v4: move to drivers/staging
>>
>> v5: fix array_size.cocci warnings
>>     fix platform_no_drv_owner.cocci warnings
>>     Remove .owner = THIS_MODULE
>>     include asm/irq.h
>>     clean up list of includes
>>     use altera_fpga_reset for ops
>>     use enum fpga_mgr_states or u32 as needed
>>     use devm_request_irq
>>     check irq <= 0 instead of == NO_IRQ
>>     Use ARRAY_SIZE
>>     rename altera -> socfpga
>>     static const socfpga_fpga_ops
>>     header moved to linux/fpga/ folder
>>     remove ifdef'ed code
>>     use platform_get_resource and platform_get_irq
>>     move .probe and .remove lines adjacent
>>     use module_platform_driver
>>     use __maybe_unused
>>     only need to 'if (IS_ENABLED(CONFIG_REGULATOR))' in one fn
>>     fix "unsigned 'mode' is never < 0"
>>
>> v6: return error for (unused) default of case statement
>> ---
>   ^^^
> 
> ...if you remove these, than that changelog will not land in the final
> commit which I would prefer. Nobody cares for the changelog of a
> patch once it is in its final state. And this is a rather noisy one.
> When someone in the future looks at this, he will see two lines of
> information and 10 times that of uninteresting noise.
> 
> Not a dealbreaker, but just something to consider for future patches.


When you run git-am you will see that changelog is not there.

I can't see any problem here. Can you please try it or clear what
are you referring to here?

Thanks,
Michal

