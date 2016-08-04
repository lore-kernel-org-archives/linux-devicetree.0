From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM: dts: da850: Add basic DTS for the L138/C6748 Dev Kit
Date: Thu, 04 Aug 2016 12:15:05 -0700
Message-ID: <m2popopcqu.fsf@baylibre.com>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160804144332.4841-1-kbeldan@baylibre.com> (Karl Beldan's
 message of "Thu, 4 Aug 2016 14:43:32 +0000")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Karl Beldan <kbeldan@baylibre.com>, Sekhar Nori <nsekhar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, karl.beldan+oss@gmail.com, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

+ Sekhar

Hi Karl,

Karl Beldan <kbeldan@baylibre.com> writes:

> The LCDK is the successor to the late Hawkboard and has the same machine
> number.

Machine number is only relevant for legacy (non-DT) boot and this is DT
boot, so the machine number bit really relevant for this changelog.

BTW, have you tried legacy boot on LCDK with board-omapl138-hawk.c?  I
assume it mostly works?

> Among the differences are the flash (16bits vs 8bits) and some pins
> (MMC, LEDs, buttons, some external connectors), however the main
> components remain the same (eth. PHY, Audio Codec, Video decoder and
> DAC) except for the main PMIC, different and hard-wired on the LCDK (the
> LDOs and DCDCs are always ON).
> A DT-only boot with this addition gives functional uart, reboot via
> watchdog, rtc, ethernet and MMC (I added the CD gpio for the MMC
> although davinci_mmc doesn't call yet the mmc core OF facilities).
>
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>

Tested with v4.7 on my LCDK board.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Note that I also needed CONFIG_RTC_DRV_OMAP=m enabled in
davinci_all_defconfig for the RTC driver. Could you add a patch for that
to this series as well?

Also, plese Cc the co-maintainer Sekhar Nori (now Cc'd) on all future
davinci patches.

> ---
>  Documentation/devicetree/bindings/arm/davinci.txt |  4 ++
>  arch/arm/boot/dts/Makefile                        |  1 +
>  arch/arm/boot/dts/omapl138-lcdk.dts               | 71 +++++++++++++++++++++++

I think this should be called da850-lcdk.dts.

The OMAP prefix in the DT directory is just going to cause confusion,
and the other DTs using this same SoC are already called da850.

Sekhar do you have any opinion here?

[...]

> +/ {
> +	model = "DA850/AM1808/OMAP-L138 LCDK";
> +	compatible = "ti,omapl138-lcdk", "ti,da850";
> +
> +	aliases {
> +		serial2 = &serial2;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS2,115200n8 earlycon";

earlycon is kind of a debug option, so probably should be left out of
the default DT.

> +		stdout-path = "serial2:115200n8";
> +	};

Kevin
