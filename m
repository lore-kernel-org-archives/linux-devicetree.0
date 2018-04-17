From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v6 01/11] ARM: sunxi: smp: Move assembly code into a file
Date: Tue, 17 Apr 2018 11:12:41 +0800
Message-ID: <CAGb2v67VL70yqTF7xq4T3_9zA9T3UT2AV0gGarh1mqvC17r3Mg@mail.gmail.com>
References: <20180416215032.5023-1-mylene.josserand@bootlin.com> <20180416215032.5023-2-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180416215032.5023-2-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Simon <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, "open list:ARM/SHMOBILE ARM..." <linux-renesas-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, Quentin Schulz <quentin.schulz@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2018 at 5:50 AM, Mylène Josserand
<mylene.josserand@bootlin.com> wrote:
> Move the assembly code for cluster cache enabling and resuming
> into an assembly file instead of having it directly in C code.
>
> Remove the CFLAGS because we are using the ARM directive "arch"
> instead.
>
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> ---
>  arch/arm/mach-sunxi/Makefile  |  4 +--
>  arch/arm/mach-sunxi/headsmp.S | 80 +++++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-sunxi/mc_smp.c  | 82 +++----------------------------------------
>  3 files changed, 85 insertions(+), 81 deletions(-)
>  create mode 100644 arch/arm/mach-sunxi/headsmp.S

I'm still not convinced about this whole "move ASM to separate
file" thing, especially now that you aren't actually adding any
sunxi-specific ASM code beyond a simple function call.

Could you drop this for now?

ChenYu
