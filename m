From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH v5 09/22] ARM: dts: sun5i: Use
 most-qualified system control compatibles
Date: Tue, 10 Jul 2018 22:53:44 +0800
Message-ID: <CAGb2v64HbpvJhy5KQOepc61nU7NECaWMPvhZ16dk5hJXiPBHxA@mail.gmail.com>
References: <20180710080114.31469-1-paul.kocialkowski@bootlin.com>
 <20180710080114.31469-10-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180710080114.31469-10-paul.kocialkowski@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Tom Saeger <tom.saeger@oracle.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Marco Franchi <marco.franchi@nxp.com>, Pawel Osciak <posciak@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jonathan Corbet <corbet@lwn.net>, Neil Armstrong <narmstrong@baylibre.com>, Keiichi Watanabe <keiichiw@chromium.org>, Jacob Chen <jacob-chen@iotwrt.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sami Tolvanen <samitolvanen@google.com>, Icenowy Zheng <icenowy@aosc.io>, devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Smitha
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 4:01 PM, Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
> This switches the sun5i dtsi to use the most qualified compatibles for
> the system-control block (previously named SRAM controller) as well as
> the SRAM blocks. The sun4i-a10 compatibles are kept since these hardware
> blocks are backward-compatible.

Not quite sure why they are backward-compatible. The A13 has less SRAM
mapping controls than the A10.

ChenYu

> The phandle for system control is also updated to reflect the fact that
> the controller described is really about system control rather than SRAM
> control.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/sun5i.dtsi | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> index 07f2248ed5f8..68711954c293 100644
> --- a/arch/arm/boot/dts/sun5i.dtsi
> +++ b/arch/arm/boot/dts/sun5i.dtsi
> @@ -114,8 +114,9 @@
>                 #size-cells = <1>;
>                 ranges;
>
> -               sram-controller@1c00000 {
> -                       compatible = "allwinner,sun4i-a10-sram-controller";
> +               system-control@1c00000 {
> +                       compatible = "allwinner,sun5i-a13-system-control",
> +                                    "allwinner,sun4i-a10-system-control";
>                         reg = <0x01c00000 0x30>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
> @@ -130,7 +131,8 @@
>                         };
>
>                         emac_sram: sram-section@8000 {
> -                               compatible = "allwinner,sun4i-a10-sram-a3-a4";
> +                               compatible = "allwinner,sun5i-a13-sram-a3-a4",
> +                                            "allwinner,sun4i-a10-sram-a3-a4";
>                                 reg = <0x8000 0x4000>;
>                                 status = "disabled";
>                         };
> @@ -143,7 +145,8 @@
>                                 ranges = <0 0x00010000 0x1000>;
>
>                                 otg_sram: sram-section@0 {
> -                                       compatible = "allwinner,sun4i-a10-sram-d";
> +                                       compatible = "allwinner,sun5i-a13-sram-d",
> +                                                    "allwinner,sun4i-a10-sram-d";
>                                         reg = <0x0000 0x1000>;
>                                         status = "disabled";
>                                 };
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
