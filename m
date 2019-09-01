From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv1 2/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to VDDIO_AO3V3 regulator
Date: Sun, 1 Sep 2019 13:41:17 +0200
Message-ID: <CAFBinCBA-sQcshd9iAVn=ZDBKkDN3OgJs-WjKEhVLw===b0AdQ@mail.gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <20190828202723.1145-3-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828202723.1145-3-linux.amoon@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 10:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per shematics TFLASH_VDD, TF_IO, VCC3V3 fixed regulator output which
typo: "schematics"

> is supplied by VDDIO_AO3V3.
please add a short sentence to the description (since you probably
have to re-send a v2) like:
"While here, move the comment name with the signal name in the
schematics above the gpio property to make it consistent with other
regulators"

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
with the patch rebased (see below) and the two issues from above addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 98e742bf44c1..a078a1ee5004 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -67,17 +67,19 @@
>         };
>
>         tflash_vdd: regulator-tflash_vdd {
> -               /*
> -                * signal name from schematics: TFLASH_VDD_EN
> -                */
>                 compatible = "regulator-fixed";
>
>                 regulator-name = "TFLASH_VDD";
>                 regulator-min-microvolt = <3300000>;
>                 regulator-max-microvolt = <3300000>;
>
> +               /*
> +                * signal name from schematics: TFLASH_VDD_EN
> +                */
>                 gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
>                 enable-active-high;
> +               /* U16 RT9179GB */
> +               vin-supply = <&vddio_ao3v3>;
>         };
>
>         tf_io: gpio-regulator-tf_io {
> @@ -95,6 +97,8 @@
>
>                 states = <3300000 0
>                           1800000 1>;
> +               /* U12/U13 RT9179GB */
> +               vin-supply = <&vddio_ao3v3>;
>         };
thank you for the patch but I think it won't apply on top of Neil's
"arm64: dts: meson: fix boards regulators states format" (which was
applied just after you sent this series)


Martin
