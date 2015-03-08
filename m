From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND controller
Date: Sun, 8 Mar 2015 01:44:02 +0100
Message-ID: <CACna6rxEU08d4DC0_mX3ett=KGZWpyyT-MqGQ+_wBSPGkaD0WQ@mail.gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
	<1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
	<CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

On 7 March 2015 at 18:39, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wr=
ote:
> It seems that brcmnand_ctlrdy_irq never fires on my device. Just like
> controller was never generating any IRQ.
>
>
> I started comparing your driver with OpenWrt's bcm_nand.c (which
> should be very similar to Broadcom's SDK NAND driver for ARM). Below
> are few things I've noticed.
>
> 1) In bcm_nand.c IRQ handler also doesn't seem to be fired (or very r=
arely).

Oh, wait, I was wrong there. So in bcm_nand.c IRQ handler fires very
often, just not during the early phase (RESET, READID), when we don't
use IRQs. During standard read/program/etc IRQ is commonly used.

So maybe all we're missing in case of brcmstb_nand.c is
enabling/acking/disabling IRQ?

It seem that my controller 6.01 has:

1) Following IRQs:
DIREC_READ_MISS
ERASE_COMPLETE
COPYBACK_COMPLETE
PROGRAM_COMPLETE
CONTROLLER_RDY
RDBSY_RDY
ECC_UNCORRECTABLE
ECC_CORRECTABLE

2) Registers for reading/acking above IRQs:
0xf00 DIREC_READ_MISS
0xf04 ERASE_COMPLETE
0xf08 COPYBACK_COMPLETE
0xf0c PROGRAM_COMPLETE
0xf10 CONTROLLER_RDY
0xf14 RDBSY_RDY
0xf18 ECC_UNCORRECTABLE
0xf1c ECC_CORRECTABLE
(if 0x1 is set, it means IRQ was raised, writing 0x1 ack-es it)

3) Register 0x408 for enabling/disabling IRQs:
0x00000004 DIREC_READ_MISS
0x00000008 ERASE_COMPLETE
0x00000010 COPYBACK_COMPLETE
0x00000020 PROGRAM_COMPLETE
0x00000040 CONTROLLER_RDY
0x00000080 RDBSY_RDY
0x00000100 ECC_UNCORRECTABLE
0x00000200 ECC_CORRECTABLE
