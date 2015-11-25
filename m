From: "Simon Arlott" <simon@fire.lp0.eu>
Subject: Re: [PATCH (v6) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Wed, 25 Nov 2015 12:37:31 -0000
Message-ID: <772c4df64731e4e4f5bbbb9051cea28aaf805f4e@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
References: <56506D55.3000907@simon.arlott.org.uk>
    <20151122215945.GA5930@rob-hp-laptop>
    <56523E85.905@simon.arlott.org.uk>
    <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
    <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com>
    <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
    <210ac819ff369893bd7d10640026a5b75455e684@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
    <CAOiHx==RsnZKb93hp1PXhz-Am_uJ4g_RR3R8VQ_dnd8hd1Wcpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOiHx==RsnZKb93hp1PXhz-Am_uJ4g_RR3R8VQ_dnd8hd1Wcpw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, November 25, 2015 10:44, Jonas Gorski wrote:
> On Tue, Nov 24, 2015 at 9:21 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>> The BCM63268 has a NAND interrupt register with combined status and enable
>> registers. It also has a clock for the NAND controller that needs to be
>> enabled.
>>
>> Set up the device by enabling the clock, disabling and acking all
>> interrupts, then handle the CTRL_READY interrupt.
>>
>> Add a brcmnand_get_socdata() function so that bcm63268_nand can obtain its
>> data and disable the clock when the device is removed.
>
> To me this now mostly looks good, one thing though ...
> (snip)
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 2c8f67f..99ca69e 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -2262,6 +2262,13 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>>  }
>>  EXPORT_SYMBOL_GPL(brcmnand_probe);
>>
>> +struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev)
>> +{
>> +       struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
>> +
>> +       return ctrl ? ctrl->soc : NULL;
>> +}
>> +
>
> Don't you need to EXPORT_SYMBOL_GPL this one in case you build
> brcmnand as module?

No, because all of the code is built into the one object file:
obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= iproc_nand.o
obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm63138_nand.o
obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm63268_nand.o
obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmstb_nand.o
obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand.o

They almost have to be otherwise you could load separate parts as different
modules in the wrong order.

The existing exported symbols are not required either.

-- 
Simon Arlott
