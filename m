From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v6 01/26] ARM: shmobile: Add watchdog support
Date: Thu, 1 Mar 2018 10:44:34 +0100
Message-ID: <20180301094434.tnk5uxlbkhv6pcb7@verge.net.au>
References: <CAMuHMdUx3A_8MeZmrwiBRqUS0oGjwrg13fy1QMsA2SUw+dR0Hg@mail.gmail.com>
 <1519839622-6109-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1519839622-6109-1-git-send-email-fabrizio.castro@bp.renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das@bp.renesas.com>, Stephen Boyd <sboyd@codeaurora.org>, Guenter Roeck <linux@roeck-us.net>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 28, 2018 at 05:40:22PM +0000, Fabrizio Castro wrote:
> On R-Car Gen2 and RZ/G1 platforms, we use the SBAR registers to make non
> boot CPUs run a routine designed to bring up SMP and deal with hot plug.
> The value contained in the SBAR registers is not initialized by a WDT
> triggered reset, which means that after a WDT triggered reset we jump
> to the SMP bring up routine, preventing the system from executing the
> bootrom code.
> 
> The purpose of this patch is to jump to the bootrom code in case of a
> WDT triggered reset, and keep the SMP functionality untouched.
> In order to tell if the code had been called due to the WDT overflowing
> we are testing WOVF from register RWTCSRA.
> 
> The new function shmobile_boot_vector_gen2 isn't replacing
> shmobile_boot_vector for backward compatibility reasons. The kernel
> will install the best option (either shmobile_boot_vector or
> shmobile_boot_vector_gen2) to ICRAM1 after parsing the device tree,
> according to the amount of memory available.
> 
> Since shmobile_boot_vector has become bigger, "reg" property of nodes
> compatible with "renesas,smp-sram" now need to be set to a value
> greater or equal to "<0 0x60>".
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Thanks, I have marked this as deferred as I would like dependencies to
be merged first.
