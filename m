From: "Simon Arlott" <simon@fire.lp0.eu>
Subject: Re: [PATCH 1/2] clk: Add brcm,bcm63xx-gate-clk device tree binding
Date: Tue, 8 Dec 2015 12:24:10 -0000
Message-ID: <5efe63830cae4e3e5d1b3be5c489da0bfee8dfff@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
References: <565CB727.7030209@simon.arlott.org.uk>
    <20151204143037.GA3667@rob-hp-laptop>
    <74d29bf38adc88b27811a70ed409e9182ddeb5b5@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74d29bf38adc88b27811a70ed409e9182ddeb5b5@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, linux-mips@linux-mips.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, December 4, 2015 21:04, Simon Arlott wrote:
> On Fri, December 4, 2015 14:30, Rob Herring wrote:
>> On Mon, Nov 30, 2015 at 08:52:55PM +0000, Simon Arlott wrote:
>>> +periph_clk: periph_clk {
>>> +	compatible = "brcm,bcm63168-gate-clk", "brcm,bcm63xx-gate-clk";
>>> +	regmap = <&periph_cntl>;
>>
>> What else is in periph_cntrl? Could this all just be part of that node?
>
>      uint32        RevID;             /* (00) word 0 */
>      uint32        blkEnables;        /* (04) word 1 */ <-- gated clocks
>      uint32        pll_control;       /* (08) word 2 */ <-- system reset controller bit
>      uint32        deviceTimeoutEn;   /* (0c) word 3 */ <-- unknown
>      uint32        softResetB;        /* (10) word 4 */ <-- device reset controller bits
>     uint32        diagControl;        /* (14) word 5 */ <-- unknown
>     uint32        ExtIrqCfg;          /* (18) word 6*/ <-- external interrupt controller
>     uint32        unused1;            /* (1c) word 7 */ <-- (external interrupt controller?)
>          IrqControl_t     IrqControl[3];    /* (20) (40) (60) */ <-- normal interrupt controller

On the BCM6368 [1], blkEnables also conatains a power domain bit:
     uint32        blkEnables;        /* (04) word 1 */
#define USBH_IDDQ_EN     (1 << 19)
#define IPSEC_CLK_EN     (1 << 18)
#define NAND_CLK_EN      (1 << 17)
#define DISABLE_GLESS    (1 << 16)
#define USBH_CLK_EN      (1 << 15)
#define PCM_CLK_EN       (1 << 14)
#define UTOPIA_CLK_EN    (1 << 13)
#define ROBOSW_CLK_EN    (1 << 12)
#define SAR_CLK_EN       (1 << 11)
#define USBD_CLK_EN      (1 << 10)
#define SPI_CLK_EN       (1 << 9)
#define SWPKT_SAR_CLK_EN (1 << 8)
#define SWPKT_USB_CLK_EN (1 << 7)
#define PHYMIPS_CLK_EN   (1 << 6)
#define VDSL_CLK_EN      (1 << 5)
#define VDSL_BONDING_EN  (1 << 4)
#define VDSL_AFE_EN      (1 << 3)
#define VDSL_QPROC_EN    (1 << 2)

In order to be able to map these to devices for the BCM63xx SoCs I'm going
to define the power controller binding with "power-domain-indices" and
"power-domain-names" to mirror the clock binding. The separate clk and
generic_pm_domain devices will then handle set/clear of the relevant bits
using the regmap.


[1]
https://code.google.com/p/gfiber-gflt100/source/browse/shared/opensource/include/bcm963xx/6368_map_part.h?r=b292e8c271addbda62104bece90e3c8018714194

-- 
Simon Arlott
