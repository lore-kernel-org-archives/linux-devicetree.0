From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB NAND controller
Date: Wed, 06 May 2015 21:17:36 +0200
Message-ID: <2114576.uWbXPVDdyI@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <1430935194-7579-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430935194-7579-4-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 May 2015 10:59:47 Brian Norris wrote:
> +
> +static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
> +{
> +       return __raw_readl(ctrl->nand_base + offs);
> +}
> +
> +static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
> +                                u32 val)
> +{
> +       __raw_writel(val, ctrl->nand_base + offs);
> +}
> +
> 

You had mentioned previously that there might be an endianess issue in this
driver. I think this won't work on big-endian architectures other than MIPS,
so it would be good to either list in the DT the endianess of the device
and use appropriate accessors here, or hardcode it based on the architecture
(using ioread32_be in big-endian mips, but readl elsewhere).

Using __raw_writel has another problem regarding the DMA capability of this
driver, as it will not flush any write buffers or synchronize caches before
sending data off to the device, so you risk data corruption. Also, the
compiler can choose to split up the 32-bit word access into byte accesses,
which on most hardware does not do what you want.

	Arnd
