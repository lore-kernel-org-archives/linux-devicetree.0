MIME-Version: 1.0
In-Reply-To: <52dae8af-e2a7-0141-61a0-b016dbcb25e3@linux.com>
References: <52dae8af-e2a7-0141-61a0-b016dbcb25e3@linux.com>
Date: Mon, 5 Mar 2018 12:04:59 -0600
Message-ID: <CAL_JsqLhyuwa8J+PTBMmbgZto3uy8aa9io9QUraX13JiE=PO1Q@mail.gmail.com>
Subject: Re: Device tree overlay properties order issue
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Lucas Tanure <tanure@linux.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 5, 2018 at 10:50 AM, Lucas Tanure <tanure@linux.com> wrote:
> Hi,
>
> I'm working with Raspberry Pi 3 and overlays.
> I'm seeing one issue with overlays, that I don't see with normal device
> trees.
>
> Using the attached patch with Rpi 4.9 kernel and loading
> dts-test-overlay.dts,
> the order that my machine driver reads properties "cpu-codec" is the
> opposite
> of what I is specified on dts.

What about mainline?

>
> [    4.558259] dts-test-order soc:sound: dts_test_probe
> [    4.558275] dts-test-order soc:sound: Dai Name cpu-codec1
> [    4.558284] dts-test-order soc:sound: Dai Name cpu-codec0

> Just for testing, commenting out drivers/of/fdt.c , line 451, did make the
> order be
> the same as dts file.

Depending on the order within the DT should mostly be solved with
deferred probe, but that does require awareness in drivers and
subsystems.

> Looking at the history of the code in that area it appears that it was
> actually trying
> to preserve the order of sub-nodes, but for some reason it no longer works
> for
> overlays on raspberry pi.

Yes, only to not change current behavior on existing DTs. However, one
should not rely on a certain order.

>
>     /*
>      * Reverse the child list. Some drivers assumes node order matches .dts
>      * node order
>      */
>     if (!dryrun)
>         reverse_nodes(root);
>
> This is a issue with overlays or I'm missing something ?
>
> Thanks
> Lucas
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  arch/arm/boot/dts/overlays/Makefile             |  1 +
>  arch/arm/boot/dts/overlays/dts-test-overlay.dts | 19 ++++++++++++
>  arch/arm/configs/bcm2709_defconfig              |  1 +
>  sound/soc/cirrus/Kconfig                        |  3 ++
>  sound/soc/cirrus/Makefile                       |  3 ++
>  sound/soc/cirrus/dts-test.c                     | 40
> +++++++++++++++++++++++++
>  6 files changed, 67 insertions(+)
>  create mode 100644 arch/arm/boot/dts/overlays/dts-test-overlay.dts
>  create mode 100644 sound/soc/cirrus/dts-test.c
>
> diff --git a/arch/arm/boot/dts/overlays/Makefile
> b/arch/arm/boot/dts/overlays/Makefile
> index e99392ca95f9..a6b78c3a513c 100644
> --- a/arch/arm/boot/dts/overlays/Makefile
> +++ b/arch/arm/boot/dts/overlays/Makefile
> @@ -17,6 +17,7 @@ dtbo-$(CONFIG_ARCH_BCM2835) += \
>      audioinjector-wm8731-audio.dtbo \
>      audremap.dtbo \
>      bmp085_i2c-sensor.dtbo \
> +    dts-test.dtbo \
>      dht11.dtbo \
>      dionaudio-loco.dtbo \
>      dionaudio-loco-v2.dtbo \
> diff --git a/arch/arm/boot/dts/overlays/dts-test-overlay.dts
> b/arch/arm/boot/dts/overlays/dts-test-overlay.dts
> new file mode 100644
> index 000000000000..e6c91c1fc5a4
> --- /dev/null
> +++ b/arch/arm/boot/dts/overlays/dts-test-overlay.dts
> @@ -0,0 +1,19 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/{
> +    compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> +
> +    fragment@0 {
> +        target = <&sound>;
> +        __overlay__ {
> +            status = "okay";
> +            compatible = "dts,test-order";
> +
> +            cpu-codec0 {
> +            };
> +            cpu-codec1 {
> +            };

Does one of these nodes already exist in the base DT? That's the only
think I can think of. That's allowed and I don't think we sort nodes
once we apply them.

Rob
