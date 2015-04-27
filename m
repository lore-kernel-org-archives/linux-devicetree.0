From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v3 00/12] MIPS: ath79: Add OF support and DTS for TL-WR1043ND
Date: Mon, 27 Apr 2015 10:42:32 -0300
Message-ID: <553E3CC8.3070304@vanguardiasur.com.ar>
References: <1429875679-14973-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429875679-14973-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/24/2015 08:41 AM, Alban Bedel wrote:
> This series add OF bindings and code support for the interrupt
> controllers, clocks and GPIOs. However it was only tested on a
> TL-WR1043ND with an AR9132, others SoCs are untested, and a few are
> not supported at all.
> 
> Most code changes base on the previous bug fix series:
> [PATCH v2 0/5] MIPS: ath79: Various small fix to prepare OF support
> 
> The requested patch to move the GPIO driver to drivers/gpio is ready and
> will follow once it is clearer if this serie get merged.
> 
> ChangeLog:
> v2: * Fixed the OF bindings and DTS to use ePAPR standardized names
>     * Fixed the typos in the OF bindings
>     * Added an ngpios property to the GPIO binding and driver
>     * Removed all the soc_is_xxx() calls out of the GPIO driver probe()
>     * Updated the DTS patches to the new directory structure and merged both
>       in one. Having 3 patches to add Makefile, SoC dtsi and board DTS seemed
>       a bit overkill.
>     * Moved the patch to use the common clk API to the bug fix serie to keep
>       this one cleaner.
> 
> v3: * Moved the builtin DTB menu to the patch adding the TL-WR1043ND DTS
>     * Made the builtin DTB menu optional
>     * Fixed more typos
>     * Really fixed the DDR controller binding example to use ePAPR names
>     * Fixed the qca9550 compatible string in the PLL bindings and driver
>     * Fixed the example in the GPIO controller binding
>     * Moved the new vendor entry to the correct place
> 
> Alban Bedel (12):
>   devicetree: Add bindings for the SoC of the ATH79 family
>   MIPS: ath79: Add basic device tree support
>   devicetree: Add bindings for the ATH79 DDR controllers
>   devicetree: Add bindings for the ATH79 interrupt controllers
>   devicetree: Add bindings for the ATH79 MISC interrupt controllers
>   MIPS: ath79: Add OF support to the IRQ controllers
>   devicetree: Add bindings for the ATH79 PLL controllers
>   MIPS: ath79: Add OF support to the clocks
>   devicetree: Add bindings for the ATH79 GPIO controllers
>   MIPS: ath79: Add OF support to the GPIO driver
>   of: Add vendor prefix for TP-Link Technologies Co. Ltd
>   MIPS: Add basic support for the TL-WR1043ND version 1
> 

Hi Alban,

I've booted a Carambola2 using this (plus a custom devicetree and some
small changes):

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Just a small comment/question: Shouldn't we allow to build all the
devicetree files, instead of just the one that will be built-in?

I.e., something like this:

dtb-$(CONFIG_MATCH_ATH79_DT)   += ar9132_tl_wr1043nd_v1.dtb
dtb-$(CONFIG_MACH_ATH79_DT)    += ar9331_carambola2.dtb

It should be useful to catch errors, but also in general, as the
devicetree is supposed to be independent of the kernel and should be
built separate from it.

PS: This series depends on a previous patchset. It's usually useful to
mention this in the cover letter and make a poor tester's life easier :)

Thanks for the work,
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
