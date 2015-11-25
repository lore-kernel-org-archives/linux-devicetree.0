From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH (v6) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Wed, 25 Nov 2015 11:44:54 +0100
Message-ID: <CAOiHx==RsnZKb93hp1PXhz-Am_uJ4g_RR3R8VQ_dnd8hd1Wcpw@mail.gmail.com>
References: <56506D55.3000907@simon.arlott.org.uk> <20151122215945.GA5930@rob-hp-laptop>
 <56523E85.905@simon.arlott.org.uk> <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com> <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com> <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <210ac819ff369893bd7d10640026a5b75455e684@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <210ac819ff369893bd7d10640026a5b75455e684@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Nov 24, 2015 at 9:21 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
> The BCM63268 has a NAND interrupt register with combined status and enable
> registers. It also has a clock for the NAND controller that needs to be
> enabled.
>
> Set up the device by enabling the clock, disabling and acking all
> interrupts, then handle the CTRL_READY interrupt.
>
> Add a brcmnand_get_socdata() function so that bcm63268_nand can obtain its
> data and disable the clock when the device is removed.

To me this now mostly looks good, one thing though ...

>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  drivers/mtd/nand/brcmnand/Makefile        |   1 +
>  drivers/mtd/nand/brcmnand/bcm63268_nand.c | 179 ++++++++++++++++++++++++++++++
>  drivers/mtd/nand/brcmnand/brcmnand.c      |   7 ++
>  drivers/mtd/nand/brcmnand/brcmnand.h      |   1 +
>  4 files changed, 188 insertions(+)
>  create mode 100644 drivers/mtd/nand/brcmnand/bcm63268_nand.c
>

(snip)

> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 2c8f67f..99ca69e 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -2262,6 +2262,13 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  }
>  EXPORT_SYMBOL_GPL(brcmnand_probe);
>
> +struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev)
> +{
> +       struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
> +
> +       return ctrl ? ctrl->soc : NULL;
> +}
> +

Don't you need to EXPORT_SYMBOL_GPL this one in case you build
brcmnand as module?


Jonas
