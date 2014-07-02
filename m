From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC] drm/msm: DT support for 8960/8064
Date: Wed, 2 Jul 2014 19:09:28 +0100
Message-ID: <20140702180928.GA29837@leverpostej>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 01, 2014 at 07:57:35PM +0100, Rob Clark wrote:
> Now that we (almost) have enough dependencies in place (MMCC, RPM, etc),
> add necessary DT support so that we can use drm/msm on upstream kernel.
> 
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> ---
> Commence bikeshedding :-)
> 
>  Documentation/devicetree/bindings/drm/msm/gpu.txt  | 51 ++++++++++++++++++++
>  Documentation/devicetree/bindings/drm/msm/hdmi.txt | 43 +++++++++++++++++
>  Documentation/devicetree/bindings/drm/msm/msm.txt  | 40 ++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  2 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                    | 55 ++++++++++++++--------
>  drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c            | 10 ++--
>  drivers/gpu/drm/msm/msm_drv.c                      | 29 ++++++++++--
>  7 files changed, 204 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/drm/msm/gpu.txt
>  create mode 100644 Documentation/devicetree/bindings/drm/msm/hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/drm/msm/msm.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/msm/gpu.txt b/Documentation/devicetree/bindings/drm/msm/gpu.txt
> new file mode 100644
> index 0000000..6e33efe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/msm/gpu.txt
> @@ -0,0 +1,51 @@
> +Qualcomm adreno/snapdragon GPU
> +
> +Required properties:
> +- compatible: "qcom,adreno-3xx"

As Olof said, choose a definite name here, and have variants claim
compatibility with that in addition to a variant specific string.

> +- reg: Physical base address and length of the controller's registers.

Just the one reg entry?

The example has reg-names. Either document the name or drop it.

> +- interrupts: The interrupt outputs from the controller.

How many? Which ones? Names?

> +- clocks: device clocks
> +  See ../clocks/clock-bindings.txt for details.

Similarly?

I should be able to read the binding and put together a DTS. Currently I
cannot.

> +- qcom,chipid: gpu chip-id.  Note this may become optional for future
> +  devices if we can reliably read the chipid from hw

What's the problem with reading chipid from HW at the moment?

Should this possibly be optional, and only if not possible to read from
HW?

> +- qcom,gpu-pwrlevels: array of OPPs, sorted highest to lowest

This is confusing. This is a node rather than a property, and in general
it's not a good idea to rely on node ordering (there's no such thing as
an array of nodes in the DTB).

> +  - compatible: "qcom,gpu-pwrlevels"
> +  - for each qcom,gpu-pwrlevel:

Is that a compatible string for each node, name, or what?

Any reason for having this as a container node at all?

> +    - qcom,gpu-freq: requested gpu clock speed
> +    - NOTE: downstream android driver defines additional parameters to
> +      configure memory bandwidth scaling per OPP.

So? Either define those or don't bother. Having a halfway house binding
is not helpful.

> +
> +Optional properties:
> +- n/a

Drop this if there are no optional properties.

> +
> +Example:
> +
> +/ {
> +       ...
> +
> +       gpu: qcom,kgsl-3d0@4300000 {
> +               compatible = "qcom,adreno-3xx";
> +               reg = <0x04300000 0x20000>;
> +               reg-names = "kgsl_3d0_reg_memory";
> +               interrupts = <GIC_SPI 80 0>;
> +               interrupt-names = "kgsl_3d0_irq";
> +               clock-names =
> +                   "core_clk",
> +                   "iface_clk",
> +                   "mem_iface_clk";
> +               clocks =
> +                   <&mmcc GFX3D_CLK>,
> +                   <&mmcc GFX3D_AHB_CLK>,
> +                   <&mmcc MMSS_IMEM_AHB_CLK>;
> +               qcom,chipid = <0x03020100>;
> +               qcom,gpu-pwrlevels {
> +                       compatible = "qcom,gpu-pwrlevels";
> +                       qcom,gpu-pwrlevel@0 {
> +                               qcom,gpu-freq = <450000000>;
> +                       };
> +                       qcom,gpu-pwrlevel@1 {
> +                               qcom,gpu-freq = <27000000>;
> +                       };
> +               };
> +       };
> +};
> diff --git a/Documentation/devicetree/bindings/drm/msm/hdmi.txt b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
> new file mode 100644
> index 0000000..051a49f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
> @@ -0,0 +1,43 @@
> +Qualcomm adreno/snapdragon hdmi output
> +
> +Required properties:
> +- compatible: "qcom,hdmi-tx-8x60", "qcom,hdmi-tx-8960", "qcom,hdmi-tx-8x74"

Please don't use wildcard strings.

Is a node expected to have one of these entries, or all?

I would recommend using a bulleted list to describe compatible strings.
It allows for easier extension and the easy addition of notes. e.g.

- compatible: should contain:
  * "foo,bar-xtreme" for bar variants with the xtreme extensions.
  * "foo,bar" for all bar variants (inc. xtreme).
  * "foo,baz" for baz variants.
  * "foo,foo" for all variants.

> +- reg: Physical base address and length of the controller's registers.
> +- interrupts: The interrupt outputs from the controller.
> +- clocks: device clocks

One entry? Multiple?

What do they correspond to on the data sheet?

Names?

> +  See ../clocks/clock-bindings.txt for details.
> +- qcom,hdmi-tx-ddc-clk: ddc clk pin
> +- qcom,hdmi-tx-ddc-data: ddc data pin
> +- qcom,hdmi-tx-hpd: hpd pin

GPIOs should be called *-gpios.

> +- core-vdda-supply: phandle to supply regulator
> +- hdmi-mux-supply: phandle to mux regulator
> +
> +Optional properties:
> +- qcom,hdmi-tx-mux-en: hdmi mux enable pin
> +- qcom,hdmi-tx-mux-sel: hdmi mux select pin

GPIOs again.

> +
> +Example:
> +
> +/ {
> +       ...
> +
> +       hdmi: qcom,hdmi-tx-8960@4a00000 {
> +               compatible = "qcom,hdmi-tx-8960";
> +               reg-names = "core_physical";
> +               reg = <0x04a00000 0x1000>;
> +               interrupts = <GIC_SPI 79 0>;
> +               clock-names =
> +                   "core_clk",
> +                   "master_iface_clk",
> +                   "slave_iface_clk";
> +               clocks =
> +                   <&mmcc HDMI_APP_CLK>,
> +                   <&mmcc HDMI_M_AHB_CLK>,
> +                   <&mmcc HDMI_S_AHB_CLK>;
> +               qcom,hdmi-tx-ddc-clk = <&msmgpio 70 GPIO_ACTIVE_HIGH>;
> +               qcom,hdmi-tx-ddc-data = <&msmgpio 71 GPIO_ACTIVE_HIGH>;
> +               qcom,hdmi-tx-hpd = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
> +               core-vdda-supply = <&pm8921_hdmi_mvs>;
> +               hdmi-mux-supply = <&ext_3p3v>;
> +       };
> +};
> diff --git a/Documentation/devicetree/bindings/drm/msm/msm.txt b/Documentation/devicetree/bindings/drm/msm/msm.txt
> new file mode 100644
> index 0000000..484cc12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/msm/msm.txt
> @@ -0,0 +1,40 @@
> +Qualcomm adreno/snapdragon

What exactly is this unit? Judging by the GPU phandle it's not the GPU
itself.

> +
> +Required properties:
> +- compatible: "qcom,mdp" (mdp4) or "qcom,mdss_mdp" (mdp5)
> +- reg: Physical base address and length of the controller's registers.
> +- interrupts: The interrupt outputs from the controller.

All of my prior points for these properties stand.

> +- connectors: array of phandles for output device(s)

What are valid devices to point this at?

> +- clocks: device clocks

Likewise, see my above points regarding clocks.

> +  See ../clocks/clock-bindings.txt for details.
> +
> +Optional properties:
> +- gpus: phandle for gpu device

What exactly is this used for?

Thanks,
Mark.
