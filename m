From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/4] mtd: nand: Allow MTD_NAND_BRCMNAND to be selected for ARM64
Date: Fri, 16 Oct 2015 21:25:57 +0200
Message-ID: <7901695.AWo8cP6Hz1@wuerfel>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com> <5673177.0QYFhMPCBq@wuerfel> <20151016165445.GG108923@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151016165445.GG108923@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Anup Patel <anup.patel@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Vikram Prakash <vikramp@broadcom.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Sandeep Tripathy <tripathy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Pramod KUMAR <pramodku@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 16 October 2015 09:54:45 Brian Norris wrote:
> > MTD_NAND_BRCMNAND uses the generic nand functions, but is currently allowed
> > to be built without CONFIG_MTD_NAND, which results in a link error:
> > 
> > drivers/built-in.o: In function `brcmnand_remove':
> > coresight-replicator.c:(.text+0x17ae6c): undefined reference to `nand_release'
> > drivers/built-in.o: In function `brcmnand_probe':
> > coresight-replicator.c:(.text+0x17d4b4): undefined reference to `nand_scan_ident'
> > coresight-replicator.c:(.text+0x17d948): undefined reference to `nand_scan_tail'
> 
> How did you get this? MTD_NAND_BRCMNAND is surrounded in the
> 'if MTD_NAND' block, which implicitly generates a MTD_NAND dependency.
> And I can confirm that in menuconfig, I see this when I disable MTD_NAND
> and search for BRCMNAND:
> 
>    Symbol: MTD_NAND_BRCMNAND [=n]
>    Type  : tristate
>    Prompt: Broadcom STB NAND controller
>      Location:
>        -> Device Drivers
>          -> Memory Technology Device (MTD) support (MTD [=y])
>    (1)     -> NAND Device Support (MTD_NAND [=n])
>      Defined at drivers/mtd/nand/Kconfig:394
>      Depends on: MTD [=y] && MTD_NAND [=n] && (ARM [=y] || ARM64 || MIPS)

Sorry, can't reproduce it any more. My patch is dated June 4, so it was
probably broken then but got fixed since. I normally try to verify that
the patches are still needed before I send them, but this time I only
saw the current discussion and remembered something vague about it
and sent what I had in my backlog of the randconfig-fixes series.

Sorry for the confusion.

	Arnd
