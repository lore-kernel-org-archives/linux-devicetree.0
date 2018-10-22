From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/15] mtd: maps: physmap cleanups
Date: Mon, 22 Oct 2018 13:45:49 +0200
Message-ID: <CACRpkdbHDTcz_X_ijV+B-DkahsTWDyW2+h0n4W5o9GU3f6kmrA@mail.gmail.com>
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
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Mark Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2018 at 9:49 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

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

This series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect to test the result when rebasing my patches for Gemini,
so hope for this to hit your devel branch after v4.20-rc1.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
