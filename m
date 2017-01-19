From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: fix SolidRun iMX6 platforms
Date: Thu, 19 Jan 2017 12:04:37 -0200
Message-ID: <CAOMZO5DTPbKnAf4=z87vTYan5q-0Qxx001OScy5nC==p24C5+w@mail.gmail.com>
References: <E1cUC4p-00087z-NF@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1cUC4p-00087z-NF@rmk-PC.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Thu, Jan 19, 2017 at 10:44 AM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:
> Removal of skeleton.dtsi from imx6qdl.dtsi caused a regression on
> SolidRun platforms as the /chosen and /memory nodes are no longer
> populated.  Fix this by adding the nodes into the platform .dtsi
> files.
>
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x0
> Linux version 4.10.0-rc3+ (rmk@rmk-PC.arm.linux.org.uk) (gcc version 4.7.4 (GCC) ) #2066 SMP Thu Jan 19 12:31:19 GMT 2017
> CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> OF: fdt:Machine model: SolidRun Cubox-i Dual/Quad
> INITRD: 0x20000000+0x001cd000 is not a memory region - disabling initrd
> cma: Failed to reserve 256 MiB
> Memory policy: Data cache writealloc
> Kernel panic - not syncing: ERROR: Failed to allocate 0x2000 bytes below 0x0.
>
> CPU: 0 PID: 0 Comm: swapper Not tainted 4.10.0-rc3+ #2066
> Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> Backtrace: invalid frame pointer 0xc09e5e44c
> ---[ end Kernel panic - not syncing: ERROR: Failed to allocate 0x2000 bytes below 0x0.
>
> Fixes: 7f107887d199 ("ARM: dts: imx: Remove skeleton.dtsi")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

I made a previous attempt to fix this issue and realized that it was
not complete.

Just sent a v2, which hopefully will fix this problem for all i.MX dtsi files.
