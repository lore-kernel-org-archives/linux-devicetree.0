From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: denali: add DT property to specify
 skipped bytes in OOB
Date: Fri, 7 Sep 2018 16:08:22 +0200
Message-ID: <20180907160822.319047c8@bbrezillon>
References: <1536317783-4942-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536317783-4942-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

On Fri,  7 Sep 2018 19:56:23 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> NAND devices need additional data area (OOB) for error correction,
> but it is also used for Bad Block Marker (BBM).  In many cases, the
> first byte in OOB is used for BBM, but the location actually depends
> on chip vendors.  The NAND controller should preserve the precious
> BBM to keep track of bad blocks.
> 
> In Denali IP, the SPARE_AREA_SKIP_BYTES register is used to specify
> the number of bytes to skip from the start of OOB.  The ECC engine
> will automatically skip the specified number of bytes when it gets
> access to OOB area.
> 
> The same value for SPARE_AREA_SKIP_BYTES should be used between
> firmware and the operating system if you intend to use the NAND
> device across the control hand-off.
> 
> In fact, the current denali.c code expects firmware to have already
> set the SPARE_AREA_SKIP_BYTES register, then reads the value out.
> 
> If no firmware (or bootloader) has initialized the controller, the
> register value is zero, which is the default after power-on-reset.
> 
> In other words, the Linux driver cannot initialize the controller
> by itself.  You cannot support the reset control either because
> resetting the controller will get register values lost.
> 
> This commit adds a way to specify it via DT.  If the property
> "denali,oob-skip-bytes" exists, the value will be set to the register.

Hm, do we really need to make this config customizable? I mean, either
you have a large-page NAND (page > 512 bytes) and the 2 first bytes
must be reserved for the BBM or you have a small-page NAND and the BBM
is at position 4 and 5. Are you sure people configure that differently?
Don't you always have SPARE_AREA_SKIP_BYTES set to 6 or 2?

Regards,

Boris
