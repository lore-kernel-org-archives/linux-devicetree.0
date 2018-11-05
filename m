From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2 00/15] mtd: maps: physmap cleanups
Date: Mon, 5 Nov 2018 22:27:11 +0100
Message-ID: <20181105222711.0de5f215@bbrezillon>
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181019074908.13226-1-boris.brezillon@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, 19 Oct 2018 09:48:53 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hello,
> 
> This is an attempt at merging physmap_of.c, gpio-addr-flash.c and
> physmap.c. The rational behind this decision is code sharing and
> consistency with what's done in other parts of the kernel:
> 
> - physmap_of is just adding OF/DT support to the physmap logic, and we
>   usually put that code in the pre-existing driver instead of creating
>   a new one
> 
> - gpio-addr-flash is just an extension of the physmap logic which is
>   needed when the platform does not have enough native ADDR lines
>   to address the whole flash. Again, I think this core belongs in the
>   physmap driver
> 
> Patches 1 to 9 are just cleanups, and are not really related to the
> merging of physmap_of and gpio-addr-flash into physmap.c.
> 
> Patch 10 to 13 are doing the actual merging work, and patch 14 is
> documenting the addr-gpios property that has been added to support
> the gpio-addr-flash on DT platforms.
> 
> Patch 15 is a cosmetic change proposed by Ricardo.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (13):
>   mtd: maps: physmap: Add SPDX header
>   mtd: maps: physmap: Rename ->map and ->mtd into ->maps and ->mtds
>   mtd: maps: physmap: Use platform_get_resource() to retrieve iomem
>     resources
>   mtd: maps: physmap: Use dev_notice() and a %pR specifier
>   mtd: maps: physmap: Use devm_ioremap_resource()
>   mtd: maps: physmap: Remove the MAX_RESOURCES limitation
>   mtd: maps: physmap: Check mtd_device_{parse_register,unregister}() ret
>     code
>   mtd: maps: physmap: Return -ENOMEM directly when info allocation fails
>   mtd: maps: physmap: Fix coding style issues reported by checkpatch
>   mtd: maps: Prepare merging of physmap and physmap_of
>   mtd: maps: Merge physmap_of.c into physmap-core.c
>   mtd: maps: Rename physmap_of_{versatile,gemini} into
>     physmap-{versatile,gemini}
>   mtd: maps: Merge gpio-addr-flash.c into physmap-core.c
> 
> Ricardo Ribalda Delgado (2):
>   dt-binding: mtd: physmap: Document the addr-gpios property
>   mtd: maps: physmap: Invert logic on if/else branch

Queued to mtd/next.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
