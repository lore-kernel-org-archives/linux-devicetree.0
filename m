From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM64: dts: Add support for Meson GXM
Date: Mon, 21 Nov 2016 09:06:54 -0800
Message-ID: <m2wpfw3gpd.fsf@baylibre.com>
References: <20161121162905.14285-1-narmstrong@baylibre.com>
        <20161121162905.14285-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161121162905.14285-2-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Neil
        Armstrong's message of "Mon, 21 Nov 2016 17:29:04 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Following the Amlogic Linux kernel, it seem the only differences
> between the GXL and GXM SoCs are the CPU Clusters.
>
> This commit renames the gxl-s905d-p23x DTSI in a common file for
> S905D p20x and S912 q20x boards.
>
> Then adds a meson-gxm dtsi and reproduce the P23x to Q20x boards
> dts files since the S905D and S912 SoCs shares the same pinout
> and the P23x and Q20x boards are identical.
>
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt  |   6 +
>  arch/arm64/boot/dts/amlogic/Makefile               |   2 +
>  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi | 190 +++++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |  19 +++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |   7 +
>  .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |   3 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-p231.dts      |   3 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi     | 188 --------------------
>  .../arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts |  77 +++++++++
>  .../arm64/boot/dts/amlogic/meson-gxm-s912-q201.dts |  58 +++++++
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         | 114 +++++++++++++
>  11 files changed, 477 insertions(+), 190 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
>  delete mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-s912-q201.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi

Applied.

Git tip: for future reference, set 'git config diff.renames true' so and
the diffstat shows a better summary when files are moved/renamed.

e.g, rather than the large ++ and -- above, you'd see:

 ...gxl-s905d-p23x.dtsi => meson-gx-p23x-q20x.dtsi} |   4 +-
 
Which is much more comforting to a maintainer than a bunch of
(potentially unrelated) adds and removes.

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
