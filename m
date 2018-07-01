From: Parthiban Nallathambi <pn@denx.de>
Subject: Re: [PATCH v2 0/3] Add clock driver for Actions S700 SoC
Date: Sun, 1 Jul 2018 20:24:56 +0200
Message-ID: <440c9eed-b930-5a4c-4320-11eec682add6@denx.de>
References: <20180626192820.28237-3-sravanhome@gmail.com>
 <20180628191805.3722-1-sravanhome@gmail.com>
 <8503ae31-aaf3-e4ba-f385-859a6cd3f8d6@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8503ae31-aaf3-e4ba-f385-859a6cd3f8d6@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Saravanan Sekar <sravanhome@gmail.com>
Cc: sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, manivannan.sadhasivam@linaro.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jeff Chen <jeff.chen@actions-semi.com>, "Thomas C. Liau" <thomas.liau@actions-semi.com>, Cubietech support <support@cubietech.com>, linux <linux@cubietech.com>
List-Id: devicetree@vger.kernel.org

Hello Andreas,

On 07/01/2018 08:05 PM, Andreas Färber wrote:
> Hi Saravannan,
> 
> Am 28.06.2018 um 21:18 schrieb Saravanan Sekar:
>> Changelog v2:
>> Fixed 0 day compilation warning
>> Modified existing dts Actions S900 clock bindings common to Actions
>> Soc family
> 
> Please post v3 without --in-reply-to. It's becoming messy to read.
> 
>> This patchset adds clock support for Actions Semi OWL series S700 SoC
>> with relevant clock bindings and device tree info. 
>>
>> Changed the UART clock using CMU instance and changes are tested in
>> cubieboard7
> 
> Did you find any better way of testing than my "reboot bootloader" from
> preinstalled Android?

Flashing bootloader.bin and u-boot-dtb.img at below offset trigger the
automatic boot from SD. But ADFU needs to long pressed before connecting
the power.

sudo dd if=bootloader.bin of=/dev/sdX bs=512 seek=4097
sudo dd if=u-boot-dtb.img of=/dev/sdX bs=1024 seek=3072

With this is place, u-boot expects GPT layout by default. I am able to boot
the kernel from FAT/ext by updating the bootcmd/u-boot env accordingly. 

I haven't tried flashing/replacing u-boot in eMMC still.

> 
> In addition to missing Actions Semi you may want to CC Cubietech.

+Added cubitech linux group.

> 
> Thanks,
> Andreas
> 

-- 
Thanks,
Parthiban N
