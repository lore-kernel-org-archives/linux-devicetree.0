From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 00/10] Allwinner sunxi message box support
Date: Mon, 9 Sep 2019 05:22:08 +0200
Message-ID: <20190909032208.rlorx2ppytymtyej@core.my.home>
References: <20190820032311.6506-1-samuel@sholland.org>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBY4K27VQKGQEJGRTF3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190820032311.6506-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Samuel,

On Mon, Aug 19, 2019 at 10:23:01PM -0500, Samuel Holland wrote:
> This series adds support for the "hardware message box" in sun8i, sun9i,
> and sun50i SoCs, used for communication with the ARISC management
> processor (the platform's equivalent of the ARM SCP). The end goal is to
> use the arm_scpi driver as a client, communicating with firmware running
> on the AR100 CPU, or to use the mailbox to forward NMIs that the
> firmware picks up from R_INTC.
> 
> Unfortunately, the ARM SCPI client no longer works with this driver
> since it now exposes all 8 hardware FIFOs individually. The SCPI client
> could be made to work (and I posted proof-of-concept code to that effect
> with v1 of this series), but that is a low priority, as Linux does not
> directly use SCPI with the current firmware version; all SCPI use goes
> through ATF via PSCI.
> 
> As requested in the comments to v3 of this patchset, a demo client is
> provided in the final patch. This demo goes along with a toy firmware
> which shows that the driver does indeed work for two-way communication
> on all channels. To build the firmware component, run:

I've tried using this driver with mainline arm_scpi driver (which is probably
an expected future use, since crust provides SCPI interface).

The problem I've found is that arm_scpi expects message box to be
bi-directional, but this driver provides uni-directional interface.

What do you think about making this driver provide bi-directional interface?
We could halve the number of channels to 4 and mandate TX/RX configuration
(from main CPU's PoV) as ABI.

Otherwise it's impossible to use it with the arm_scpi driver.

Or do you have any other ideas? I guess arm_scpi can be fixed to add a
property that would make it possible to use single shmem with two
mailboxes, one for rx and one for tx, but making sun6i mailbox have
bi-directional interface sounds easier.

regards,
	o.

>   git clone https://github.com/crust-firmware/meta meta
>   git clone -b mailbox-demo https://github.com/crust-firmware/crust meta/crust
>   cd meta
>   make
> 
> That will by default produce a U-Boot + ATF + SCP firmware image in
> [meta/]build/pinebook/u-boot-sunxi-with-spl.bin. See the top-level
> README.md for more information, such as cross-compiler setup.
> 
> I've now used this driver with three separate clients over the past two
> years, and they all work. If there are no remaining concerns with the
> driver, I'd like it to get merged.
> 
> Even without the driver, the clock patches (1-2) can go in at any time.
> 
> Changes from v3:
>   - Rebased on sunxi-next
>   - Added Rob's Reviewed-by for patch 3
>   - Fixed a crash when receiving a message on a disabled channel
>   - Cleaned up some comments/formatting in the driver
>   - Fixed #mbox-cells in sunxi-h3-h5.dtsi (patch 7)
>   - Removed the irqchip example (no longer relevant to the fw design)
>   - Added a demo/example client that uses the driver and a toy firmware
> 
> Changes from v2:
>   - Merge patches 1-3
>   - Add a comment in the code explaining the CLK_IS_CRITICAL usage
>   - Add a patch to mark the AR100 clocks as critical
>   - Use YAML for the device tree binding
>   - Include a not-for-merge example usage of the mailbox
> 
> Changes from v1:
>   - Marked message box clocks as critical instead of hacks in the driver
>   - 8 unidirectional channels instead of 4 bidirectional pairs
>   - Use per-SoC compatible strings and an A31 fallback compatible
>   - Dropped the mailbox framework patch
>   - Include DT patches for SoCs that document the message box
> 
> Samuel Holland (10):
>   clk: sunxi-ng: Mark msgbox clocks as critical
>   clk: sunxi-ng: Mark AR100 clocks as critical
>   dt-bindings: mailbox: Add a sunxi message box binding
>   mailbox: sunxi-msgbox: Add a new mailbox driver
>   ARM: dts: sunxi: a80: Add msgbox node
>   ARM: dts: sunxi: a83t: Add msgbox node
>   ARM: dts: sunxi: h3/h5: Add msgbox node
>   arm64: dts: allwinner: a64: Add msgbox node
>   arm64: dts: allwinner: h6: Add msgbox node
>   [DO NOT MERGE] drivers: firmware: msgbox demo
> 
>  .../mailbox/allwinner,sunxi-msgbox.yaml       |  79 +++++
>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  10 +
>  arch/arm/boot/dts/sun9i-a80.dtsi              |  10 +
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  10 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  34 ++
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi  |  24 ++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  10 +
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |   3 +-
>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c        |   2 +-
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c          |   3 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-a23.c          |   3 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-a33.c          |   3 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-a83t.c         |   3 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c           |   3 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-r.c            |   2 +-
>  drivers/clk/sunxi-ng/ccu-sun9i-a80.c          |   3 +-
>  drivers/firmware/Kconfig                      |   6 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/sunxi_msgbox_demo.c          | 307 +++++++++++++++++
>  drivers/mailbox/Kconfig                       |  10 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/sunxi-msgbox.c                | 323 ++++++++++++++++++
>  22 files changed, 842 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sunxi-msgbox.yaml
>  create mode 100644 drivers/firmware/sunxi_msgbox_demo.c
>  create mode 100644 drivers/mailbox/sunxi-msgbox.c
> 
> -- 
> 2.21.0
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
