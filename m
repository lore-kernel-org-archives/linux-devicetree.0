From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND controller
Date: Sat, 7 Mar 2015 18:39:44 +0100
Message-ID: <CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
	<1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

On 7 March 2015 at 02:18, Brian Norris <computersforpeace@gmail.com> wrote:
> This core originated in Set-Top Box chips (BCM7xxx) but is used in a
> variety of other Broadcom chips, including some BCM63xxx, BCM33xx, and
> iProc/Cygnus. It's been used only on ARM and MIPS SoCs, so restrict it
> to those architectures.
>
> There are multiple revisions of this core throughout the years, and
> almost every version broke register compatibility in some small way, but
> with some effort, this driver is able to support v4.0, v5.0, v6.x, v7.0,
> and v7.1. It's been tested on v5.0, v6.0, v7.0, and v7.1 recently, so
> there hopefully are no more lurking inconsistencies.

Unfortunately, it seems I can't make this driver work with my BCM4708
based router. This is a SoC with 6.01 controller.

Sometimes I get this:
[    0.478443] brcmstb_nand 18028000.nand: timeout waiting for command 255 (9)
[    0.485385] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.588393] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    0.595326] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.698392] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    0.705322] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.711051] nand: second ID read did not match 20,20 against 20,00
[    0.717197] nand: No NAND device found

Other time:
[    0.478441] brcmstb_nand 18028000.nand: timeout waiting for command 255 (9)
[    0.485385] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.588396] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    0.595327] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.698393] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    0.705321] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.808394] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    0.815326] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.918392] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    0.925322] brcmstb_nand 18028000.nand: intfc status f0000000
[    0.931047] nand: No NAND device found

(Btw. I guess you could use 0x%x instead of %d for printing commands).

It seems that brcmnand_ctlrdy_irq never fires on my device. Just like
controller was never generating any IRQ.


I started comparing your driver with OpenWrt's bcm_nand.c (which
should be very similar to Broadcom's SDK NAND driver for ARM). Below
are few things I've noticed.

1) In bcm_nand.c IRQ handler also doesn't seem to be fired (or very rarely).

2) In brcmnand_waitfunc you seem to be always waiting for an
interrupt. This is different from OpenWrt's driver and Broadcom's
reference code. In bcm_nand.c in bcmnand_wait_cmd we first check
BIT(31) of IRQ STATUS (0x6c / 0x14 / BRCMNAND_INTFC_STATUS). If it's
set, we assume command was already completed.

3) In bcm_nand.c in IRQ waiting function bcmnand_wait_interrupt we
ack/enable/disable NANDC_IRQ_CONTROLLER_RDY (nand_ctlrdy) IRQ. I don't
see that in your code, not sure if it's important.

4) It seems bcm_nand.c also uses some extra register 0x500 and its bit
0x1 (we call it NANDC_IDM_IO_CTRL_RDY). It this bit it set, we don't
ever care about NANDC_IRQ_CONTROLLER_RDY (nand_ctlrdy) IRQ.
