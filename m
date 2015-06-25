From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCHv5 2/2] mailbox: Adding driver for Xilinx LogiCORE IP mailbox.
Date: Thu, 25 Jun 2015 09:47:35 +0200
Message-ID: <558BB217.5080200@xilinx.com>
References: <1435082402-29239-1-git-send-email-moritz.fischer@ettus.com>
	 <1435082402-29239-3-git-send-email-moritz.fischer@ettus.com>
	 <1435178205.4528.77.camel@tiscali.nl> <558BA5D4.8060903@xilinx.com>
 <1435217491.16792.5.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435217491.16792.5.camel@tiscali.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>, Michal Simek <michal.simek@xilinx.com>, Moritz Fischer <moritz.fischer@ettus.com>, jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, soren.brinkmann@xilinx.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, arnd@arndb.de, joe@perches.com, jingoohan1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/25/2015 09:31 AM, Paul Bolle wrote:
> On Thu, 2015-06-25 at 08:55 +0200, Michal Simek wrote:
>> On 06/24/2015 10:36 PM, Paul Bolle wrote:
>>> On Tue, 2015-06-23 at 11:00 -0700, Moritz Fischer wrote:
>>>> +MODULE_ALIAS("platform:xilinx-mailbox");
>>>
>>> So I think this MODULE_ALIAS() is only useful if, in short, there's 
>>> a corresponding platform_device created. Ie, a platform_device with 
>>> a name "xilinx-mailbox" that will fire of a "MODALIAS=platform:xili
>>> nx-mailbox" when it's created.
>>>
>>> I couldn't spot such a platform_device. Provided git grep didn't 
>>> let me down here: what breaks if this line is dropped?
>>
>> IRC you don't need to have this platform_device in the kernel 
>> present. Only one thing which should be check is that this driver can 
>> be used as platform device driver.
>>
>> The only one problematic part is devm_clk_get() and this should be
>> checked if you can use this as platform driver. From the first look 
>> it looks like that this will break it.
>>
>> Anyway if Moritz is able to use this a platform driver he can keep 
>> this line there. If not, it should be removed.
> 
> But, assuming this works as a platform driver, where does the "xilinx
> -mailbox" platform device originate?

It has to be platform_device somewhere for sure.
In past we had folder in arch/microblaze/platform folder.
Currently you can add this code to for example
arch/microblaze/kernel/platform.c

But as I said I don't think it is really important. There will be a lot
of others drivers in the kernel which can be used as platform drivers
but you are not able to find out platform_device for it.
The important part is that driver can work as is.
Also it is quite common that users create own BSP for their custom
boards but they don't push it to mainline.

Thanks,
Michal
