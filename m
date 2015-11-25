From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH (v6) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Wed, 25 Nov 2015 13:53:09 +0100
Message-ID: <CAOiHx=mTPfiU40Tbz24vWELcoKEWhi=N2mqwL92SnV61dA2Myg@mail.gmail.com>
References: <56506D55.3000907@simon.arlott.org.uk> <20151122215945.GA5930@rob-hp-laptop>
 <56523E85.905@simon.arlott.org.uk> <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com> <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com> <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <210ac819ff369893bd7d10640026a5b75455e684@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <CAOiHx==RsnZKb93hp1PXhz-Am_uJ4g_RR3R8VQ_dnd8hd1Wcpw@mail.gmail.com> <772c4df64731e4e4f5bbbb9051cea28aaf805f4e@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <772c4df64731e4e4f5bbbb9051cea28aaf805f4e@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2015 at 1:37 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
> On Wed, November 25, 2015 10:44, Jonas Gorski wrote:
>> On Tue, Nov 24, 2015 at 9:21 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>>> The BCM63268 has a NAND interrupt register with combined status and enable
>>> registers. It also has a clock for the NAND controller that needs to be
>>> enabled.
>>>
>>> Set up the device by enabling the clock, disabling and acking all
>>> interrupts, then handle the CTRL_READY interrupt.
>>>
>>> Add a brcmnand_get_socdata() function so that bcm63268_nand can obtain its
>>> data and disable the clock when the device is removed.
>>
>> To me this now mostly looks good, one thing though ...
>> (snip)
>>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>>> index 2c8f67f..99ca69e 100644
>>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>>> @@ -2262,6 +2262,13 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>>>  }
>>>  EXPORT_SYMBOL_GPL(brcmnand_probe);
>>>
>>> +struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev)
>>> +{
>>> +       struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
>>> +
>>> +       return ctrl ? ctrl->soc : NULL;
>>> +}
>>> +
>>
>> Don't you need to EXPORT_SYMBOL_GPL this one in case you build
>> brcmnand as module?
>
> No, because all of the code is built into the one object file:

No it is not:

$ grep BRCMNAND .config
CONFIG_MTD_NAND_BRCMNAND=m
$ make
...
  LD      drivers/mtd/nand/brcmnand/built-in.o
  CC [M]  drivers/mtd/nand/brcmnand/iproc_nand.o
  CC [M]  drivers/mtd/nand/brcmnand/bcm63138_nand.o
  CC [M]  drivers/mtd/nand/brcmnand/brcmstb_nand.o
  CC [M]  drivers/mtd/nand/brcmnand/brcmnand.o
...
  Building modules, stage 2.
  MODPOST 6 modules
  CC      drivers/mtd/nand/brcmnand/bcm63138_nand.mod.o
  LD [M]  drivers/mtd/nand/brcmnand/bcm63138_nand.ko
  CC      drivers/mtd/nand/brcmnand/brcmnand.mod.o
  LD [M]  drivers/mtd/nand/brcmnand/brcmnand.ko
  CC      drivers/mtd/nand/brcmnand/brcmstb_nand.mod.o
  LD [M]  drivers/mtd/nand/brcmnand/brcmstb_nand.ko
  CC      drivers/mtd/nand/brcmnand/iproc_nand.mod.o
  LD [M]  drivers/mtd/nand/brcmnand/iproc_nand.ko

$

> obj-$(CONFIG_MTD_NAND_BRCMNAND)         += iproc_nand.o
> obj-$(CONFIG_MTD_NAND_BRCMNAND)         += bcm63138_nand.o
> obj-$(CONFIG_MTD_NAND_BRCMNAND)         += bcm63268_nand.o
> obj-$(CONFIG_MTD_NAND_BRCMNAND)         += brcmstb_nand.o
> obj-$(CONFIG_MTD_NAND_BRCMNAND)         += brcmnand.o

for this to be built into one it would have to look like:

obj-$(CONFIG_MTD_NAND_BRCMNAND)            += brcmnand_all.o
brcmnand_all-y         += iproc_nand.o
brcmnand_all-y         += bcm63138_nand.o
brcmnand_all-y         += bcm63268_nand.o
brcmnand_all-y         += brcmstb_nand.o
brcmnand_all-y         += brcmnand.o



Jonas
