From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
Date: Mon, 3 Dec 2018 10:01:17 +0100
Message-ID: <95299838-4954-4cb8-d026-82a33eb941a3@baylibre.com>
References: <20181130170634.9467-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181130170634.9467-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Gregory Clement <gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebas
List-Id: devicetree@vger.kernel.org

On 30/11/2018 18:06, Rob Herring wrote:
> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
> 
> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Yes, I'm being lazy and not splitting this up into dozens of sub-arch 
> patches. I don't think this should conflict nor should we be getting new 
> dependencies on skeleton.dtsi. So please apply directly to arm-soc.
> 
> Rob
> 
>  arch/arm/boot/dts/alphascale-asm9260.dtsi      |  3 ++-
>  arch/arm/boot/dts/alpine.dtsi                  |  8 +++++++-
>  arch/arm/boot/dts/arm-realview-eb.dtsi         |  4 +++-
>  arch/arm/boot/dts/arm-realview-pb1176.dts      |  4 +++-
>  arch/arm/boot/dts/arm-realview-pb11mp.dts      |  4 +++-
>  arch/arm/boot/dts/arm-realview-pbx.dtsi        |  4 +++-
>  arch/arm/boot/dts/armada-38x.dtsi              |  4 +++-
>  arch/arm/boot/dts/armada-39x.dtsi              |  3 ++-
>  arch/arm/boot/dts/artpec6.dtsi                 |  3 ++-
>  arch/arm/boot/dts/at91rm9200.dtsi              |  4 +++-
>  arch/arm/boot/dts/at91sam9260.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9261.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9263.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9g45.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9n12.dtsi             |  4 +++-
>  arch/arm/boot/dts/at91sam9rl.dtsi              |  4 +++-
>  arch/arm/boot/dts/at91sam9x5.dtsi              |  4 +++-
>  arch/arm/boot/dts/atlas6-evb.dts               |  1 +
>  arch/arm/boot/dts/atlas6.dtsi                  |  1 -
>  arch/arm/boot/dts/atlas7.dtsi                  |  1 -
>  arch/arm/boot/dts/axm55xx.dtsi                 |  4 ++--
>  arch/arm/boot/dts/bcm-cygnus.dtsi              |  9 +++++++--
>  arch/arm/boot/dts/bcm-nsp.dtsi                 |  4 ++--
>  arch/arm/boot/dts/bcm11351.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm21664-garnet.dts          |  1 +
>  arch/arm/boot/dts/bcm21664.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm23550-sparrow.dts         |  1 +
>  arch/arm/boot/dts/bcm23550.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm28155-ap.dts              |  1 +
>  arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts    |  1 +
>  .../boot/dts/bcm47081-buffalo-wzr-600dhp2.dts  |  1 +
>  .../boot/dts/bcm47081-buffalo-wzr-900dhp.dts   |  1 +
>  arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts  |  1 +
>  arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts  |  1 +
>  .../boot/dts/bcm47081-tplink-archer-c5-v2.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts  |  1 +
>  .../arm/boot/dts/bcm47094-linksys-panamera.dts |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts  |  1 +
>  arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts  |  1 +
>  .../boot/dts/bcm47094-luxul-xwr-3150-v1.dts    |  1 +
>  arch/arm/boot/dts/bcm47094-netgear-r8500.dts   |  1 +
>  arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts  |  1 +
>  arch/arm/boot/dts/bcm47189-luxul-xap-810.dts   |  1 +
>  arch/arm/boot/dts/bcm47189-tenda-ac9.dts       |  1 +
>  arch/arm/boot/dts/bcm5301x.dtsi                |  3 ++-
>  .../boot/dts/bcm53340-ubnt-unifi-switch8.dts   |  1 +
>  arch/arm/boot/dts/bcm53573.dtsi                |  3 ++-
>  arch/arm/boot/dts/bcm63138.dtsi                |  4 ++--
>  arch/arm/boot/dts/bcm7445.dtsi                 |  2 --
>  arch/arm/boot/dts/bcm947189acdbmr.dts          |  1 +
>  arch/arm/boot/dts/bcm953012er.dts              |  1 +
>  arch/arm/boot/dts/bcm953012hr.dts              |  1 +
>  arch/arm/boot/dts/bcm953012k.dts               |  1 +
>  arch/arm/boot/dts/cx92755.dtsi                 |  4 ++--
>  arch/arm/boot/dts/dove.dtsi                    |  4 ++--
>  arch/arm/boot/dts/ep7209.dtsi                  |  4 ++--
>  arch/arm/boot/dts/ep7211-edb7211.dts           |  1 +
>  arch/arm/boot/dts/integrator.dtsi              | 10 ++++++++--
>  arch/arm/boot/dts/kirkwood.dtsi                |  3 ++-
>  arch/arm/boot/dts/lpc32xx.dtsi                 |  4 ++--
>  arch/arm/boot/dts/ls1021a.dtsi                 |  8 +++++++-
>  arch/arm/boot/dts/meson.dtsi                   |  3 ++-
>  arch/arm/boot/dts/meson6-atv1200.dts           |  1 +
>  arch/arm/boot/dts/meson8-minix-neo-x8.dts      |  1 +
>  arch/arm/boot/dts/meson8b-ec100.dts            |  1 +
>  arch/arm/boot/dts/meson8b-mxq.dts              |  1 +
>  arch/arm/boot/dts/meson8b-odroidc1.dts         |  1 +
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts      |  1 +
>  arch/arm/boot/dts/mmp2-brownstone.dts          |  1 +
>  arch/arm/boot/dts/mmp2.dtsi                    |  4 +++-
>  arch/arm/boot/dts/moxart.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt2701-evb.dts               |  1 +
>  arch/arm/boot/dts/mt2701.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt6580-evbp1.dts             |  1 +
>  arch/arm/boot/dts/mt6580.dtsi                  |  1 -
>  arch/arm/boot/dts/mt6589-aquaris5.dts          |  1 +
>  arch/arm/boot/dts/mt6589.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt6592-evb.dts               |  2 +-
>  arch/arm/boot/dts/mt6592.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt8127-moose.dts             |  1 +
>  arch/arm/boot/dts/mt8127.dtsi                  |  3 ++-
>  arch/arm/boot/dts/mt8135-evbp1.dts             |  1 +
>  arch/arm/boot/dts/mt8135.dtsi                  |  3 ++-
>  arch/arm/boot/dts/nspire.dtsi                  |  4 ++--
>  arch/arm/boot/dts/orion5x-lacie-d2-network.dts |  1 +
>  .../orion5x-lacie-ethernet-disk-mini-v2.dts    |  1 +
>  arch/arm/boot/dts/orion5x-lswsgl.dts           |  1 +
>  .../dts/orion5x-maxtor-shared-storage-2.dts    |  1 +
>  arch/arm/boot/dts/orion5x-netgear-wnr854t.dts  |  1 +
>  arch/arm/boot/dts/orion5x-rd88f5182-nas.dts    |  1 +
>  arch/arm/boot/dts/orion5x.dtsi                 |  4 ++--
>  arch/arm/boot/dts/ox810se.dtsi                 |  4 +++-
>  arch/arm/boot/dts/ox820.dtsi                   |  4 +++-
>  arch/arm/boot/dts/picoxcell-pc3x2.dtsi         |  1 -
>  arch/arm/boot/dts/picoxcell-pc3x3.dtsi         |  1 -
>  arch/arm/boot/dts/prima2-evb.dts               |  1 +
>  arch/arm/boot/dts/prima2.dtsi                  |  1 -
>  arch/arm/boot/dts/pxa168.dtsi                  |  4 +++-
>  arch/arm/boot/dts/pxa2xx.dtsi                  |  3 ++-
>  arch/arm/boot/dts/pxa910.dtsi                  |  4 +++-
>  arch/arm/boot/dts/qcom-apq8064.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/qcom-apq8084.dtsi            |  9 +++++++--
>  arch/arm/boot/dts/qcom-ipq4019.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/qcom-ipq8064.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi     |  1 +
>  arch/arm/boot/dts/qcom-mdm9615.dtsi            |  4 ++--
>  arch/arm/boot/dts/qcom-msm8660.dtsi            |  9 +++++++--
>  arch/arm/boot/dts/qcom-msm8960.dtsi            |  9 +++++++--
>  arch/arm/boot/dts/qcom-msm8974.dtsi            |  8 +++++++-
>  arch/arm/boot/dts/sama5d2.dtsi                 |  4 +++-
>  arch/arm/boot/dts/sama5d3.dtsi                 |  4 +++-
>  arch/arm/boot/dts/sama5d4.dtsi                 |  4 +++-
>  arch/arm/boot/dts/skeleton.dtsi                | 18 ------------------
>  arch/arm/boot/dts/skeleton64.dtsi              | 14 --------------
>  arch/arm/boot/dts/spear13xx.dtsi               |  4 ++--
>  arch/arm/boot/dts/spear3xx.dtsi                |  4 ++--
>  arch/arm/boot/dts/spear600.dtsi                |  4 ++--
>  arch/arm/boot/dts/ste-nomadik-stn8815.dtsi     |  2 +-
>  arch/arm/boot/dts/ste-u300.dts                 |  2 +-
>  arch/arm/boot/dts/stm32429i-eval.dts           |  1 +
>  arch/arm/boot/dts/stm32746g-eval.dts           |  1 +
>  arch/arm/boot/dts/stm32f429-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32f429.dtsi               |  4 +++-
>  arch/arm/boot/dts/stm32f469-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32f746-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32f746.dtsi               |  4 +++-
>  arch/arm/boot/dts/stm32f769-disco.dts          |  1 +
>  arch/arm/boot/dts/stm32h743.dtsi               |  4 +++-
>  arch/arm/boot/dts/stm32h743i-disco.dts         |  1 +
>  arch/arm/boot/dts/stm32h743i-eval.dts          |  1 +
>  arch/arm/boot/dts/stm32mp157c-ed1.dts          |  1 +
>  arch/arm/boot/dts/sun5i-a10s.dtsi              |  4 ++--
>  arch/arm/boot/dts/sun5i-a13.dtsi               |  4 ++--
>  arch/arm/boot/dts/sun5i.dtsi                   |  9 +++++++--
>  arch/arm/boot/dts/sun6i-a31.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun7i-a20.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi           |  4 ++--
>  arch/arm/boot/dts/sun8i-a23.dtsi               |  1 +
>  arch/arm/boot/dts/sun8i-a33.dtsi               |  1 +
>  arch/arm/boot/dts/versatile-ab.dts             |  2 +-
>  arch/arm/boot/dts/vt8500.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8505.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8650.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8750.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/wm8850.dtsi                  |  9 +++++++--
>  arch/arm/boot/dts/zx296702-ad1.dts             |  1 +
>  arch/arm/boot/dts/zx296702.dtsi                |  4 +++-
>  149 files changed, 330 insertions(+), 153 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/skeleton.dtsi
>  delete mode 100644 arch/arm/boot/dts/skeleton64.dtsi
> 

[...]

> diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
> index c2b48a1838eb..3a26650de4eb 100644
> --- a/arch/arm/boot/dts/ox810se.dtsi
> +++ b/arch/arm/boot/dts/ox810se.dtsi
> @@ -6,11 +6,12 @@
>   * Licensed under GPLv2 or later
>   */
>  
> -/include/ "skeleton.dtsi"
>  #include <dt-bindings/clock/oxsemi,ox810se.h>
>  #include <dt-bindings/reset/oxsemi,ox810se.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
>  	compatible = "oxsemi,ox810se";
>  
>  	cpus {
> @@ -25,6 +26,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		/* Max 256MB @ 0x48000000 */
>  		reg = <0x48000000 0x10000000>;
>  	};
> diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
> index 085bbd33eadc..f3239586f38d 100644
> --- a/arch/arm/boot/dts/ox820.dtsi
> +++ b/arch/arm/boot/dts/ox820.dtsi
> @@ -6,12 +6,13 @@
>   * Licensed under GPLv2 or later
>   */
>  
> -/include/ "skeleton.dtsi"
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/oxsemi,ox820.h>
>  #include <dt-bindings/reset/oxsemi,ox820.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
>  	compatible = "oxsemi,ox820";
>  
>  	cpus {
> @@ -35,6 +36,7 @@
>  	};
>  
>  	memory {
> +		device_type = "memory";
>  		/* Max 512MB @ 0x60000000 */
>  		reg = <0x60000000 0x20000000>;
>  	};

[...]

For Oxnas,

Acked-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Thanks,
Neil
