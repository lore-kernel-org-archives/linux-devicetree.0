From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH 1/2] edac: add support for Calxeda highbank memory controller
Date: Mon, 11 Jun 2012 12:25:20 -0300
Message-ID: <4FD60DE0.2010907@redhat.com>
References: <1339020125-20198-1-git-send-email-robherring2@gmail.com> <1339020125-20198-2-git-send-email-robherring2@gmail.com> <4FCFDB12.3090403@redhat.com> <4FD15193.8080800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FD15193.8080800@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Doug Thompson <dougthompson@xmission.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Em 07-06-2012 22:12, Rob Herring escreveu:
> Mauro,
> 
> On 06/06/2012 05:34 PM, Mauro Carvalho Chehab wrote:
>> Hi Rob,
>>
>> Em 06-06-2012 19:02, Rob Herring escreveu:
>>> From: Rob Herring <rob.herring@calxeda.com>
>>>
>>> Add support for memory controller on Calxeda Highbank platforms. Highbank
>>> platforms support a single 4GB mini-DIMM with 1-bit correction and 2-bit
>>> detection.
>>>
>>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>>> ---
>>>   .../devicetree/bindings/arm/calxeda/mem-ctrlr.txt  |   17 ++
>>>   arch/arm/boot/dts/highbank.dts                     |    6 +
>>>   drivers/edac/Kconfig                               |    9 +-
>>>   drivers/edac/Makefile                              |    2 +
>>>   drivers/edac/highbank_mc_edac.c                    |  238 ++++++++++++++++++++
>>>   5 files changed, 271 insertions(+), 1 deletion(-)
>>>   create mode 100644 Documentation/devicetree/bindings/arm/calxeda/mem-ctrlr.txt
>>>   create mode 100644 drivers/edac/highbank_mc_edac.c
> 
> [snip]
> 
>>> +
>>> +static struct mcidev_sysfs_attribute highbank_mc_sysfs_attributes[] = {
>>> +	{
>>> +	 .attr = {
>>> +		  .name = "inject_ctrl",
>>> +		  .mode = (S_IRUGO | S_IWUSR)
>>> +		  },
>>> +	 .store = highbank_mc_inject_ctrl_store,
>>> +	},
>>> +	{
>>> +	 .attr = {.name = NULL} /* End of list */
>>> +	}
>>> +};
>>
>> This won't work after the kobj->struct device conversion patches that are at
>> -next tree, as this struct will not exist anymore.
>>
>> Also, as this is for error injection, the better is to use debugfs.
>>
>> It shouldn't be hard to change it to use debugfs. If you want an example, you
>> can take a look on this patch:
>>
>> 	http://git.kernel.org/?p=linux/kernel/git/mchehab/linux-edac.git;a=commitdiff;h=303f3e2113d81d49feef9c0803c2958d41513f14
>>
> 
> I've got this working, but don't really like the resulting debugfs
> layout. I end-up with something like this (using dev_name() of platform
> driver):
> 
> /mc0/fake*
> /fff00000.memory-controller/inject_ctrl

Yeah, that looks weird.
> 
> It would be nice if there was a top level edac directory and any entries
> I add are added under mcX. I can do that for the next version if that's
> okay.

Yeah, that sounds the right thing to do, e. g. having the error injection
code under <debugfs>/edac/mc[0-9]+/.

Regards,
Mauro.
> 
> Rob
> 
