From: Maxime Bizon <mbizon@freebox.fr>
Subject: Re: [RFC] MIPS: BCM63XX: add initial Device Tree support
Date: Mon, 12 Nov 2012 12:18:14 +0100
Message-ID: <1352719094.10405.18.camel@sakura.staff.proxad.net>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
Reply-To: mbizon@freebox.fr
Mime-Version: 1.0
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Florian Fainelli <florian@openwrt.org>, Kevin Cernekee <cernekee@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 2012-11-11 at 13:50 +0100, Jonas Gorski wrote:

> This patch series adds initial Device Tree support to BCM63XX by adding
> bindings for interrupts, GPIOs and clocks to Device Tree. Finally it adds
> one "real" user, the serial driver, to the device tree boards.

>  51 files changed, 1993 insertions(+), 392 deletions(-)

I've already said what I think privately to you but I will do it again

The bcm63xx code base is IMO quite clean. It does not suffer from code
duplication, and god it would have taken far less time to write it the
"bad" way.

We have only *one* register file for all the SOCs, only the different
bits are visible.

We can even build a single kernel that support all SOCs/boards.

So what's the *point* of this ?

You *cannot* abstract hardware, you just can't guess now what the next
SOC peculiarity will be.

Quoting your patch "BCM63XX: switch to common clock and Device Tree"

+Required properties:
+- compatible: one of
+  a) "brcm,bcm63xx-clock"
+  Standard BCM63XX clock.

cool a nice abstraction, one register bit = one clock

+  b) "brcm,bcm63xx-sar-clock"
+  SAR/ATM clock, which requires a reset of the SAR/ATM block.
+  c) "brcm,bcm63xx-enetsw-clock"
+  Generic ethernet switch clock, which requires a reset of the block.
+  d) "brcm,bcm6368-enetsw-clock"
+  BCM6368 ethernet switch clock, which requires additional clocks to be
+  enabled during reset.

oops that abstraction did not fly because after enabling this particular
clock on this SOC you also need to toggle other bits.

that list is going to get longer and longer and at the end won't mean anything.

and this is supposed to be a *STABLE* API

We don't add syscall everyday, because we have to support them forever.
Why would it be ok to add such abstractions that prevent further code
refactoring because they are fixed in stone ?

-- 
Maxime
