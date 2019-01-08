MIME-Version: 1.0
Date: Tue, 8 Jan 2019 13:43:46 -0600
References: <20181212211848.26768-1-jcrouse@codeaurora.org>
	<20181212211848.26768-2-jcrouse@codeaurora.org>
	<20181217212010.GA22389@bogus>
	<20181217220146.GA18380@jcrouse-lnx.qualcomm.com>
In-Reply-To: <20181217220146.GA18380@jcrouse-lnx.qualcomm.com>
Message-ID: <CAL_JsqLSsS2n4dpjhPu52czi6TuB6eoxJd-6ecEXb0g9D_MFwg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: drm/msm/a6xx: Document GMU and update
 GPU bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: freedreno <freedreno@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, "open list:THERMAL" <linux-pm@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Viresh Kumar <vireshk@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>



On Mon, Dec 17, 2018 at 4:01 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Dec 17, 2018 at 03:20:10PM -0600, Rob Herring wrote:
> > On Wed, Dec 12, 2018 at 02:18:47PM -0700, Jordan Crouse wrote:
> > > Update the GPU bindings and document the new bindings for the GMU
> > > device found with Adreno a6xx targets.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >  .../devicetree/bindings/display/msm/gmu.txt   | 56 +++++++++++++++++++
> > >  .../devicetree/bindings/display/msm/gpu.txt   | 41 +++++++++++++-
> > >  2 files changed, 94 insertions(+), 3 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > new file mode 100644
> > > index 000000000000..6152cb551d29
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > @@ -0,0 +1,56 @@
> > > +Qualcomm adreno/snapdragon GMU (Graphics management unit)
> > > +
> > > +The GMU is a programmable power controller for the GPU. the CPU controls the
> > > +GMU which in turn handles power controls for the GPU.
> > > +
> > > +Required properties:
> > > +- compatible:
> > > +  * "qcom,adreno-gmu"
> >
> > I probably asked before, but this needs a specific compatible unless you
> > have reliable version/capability registers. If you do, please state that
> > here.
>
> Most of our decisions are made based on the type of GPU attached but it wouldn't
> hurt to make this future proof.  I'll do it.
>
> > > +- reg: Physical base address and length of the GMU registers.
> > > +- reg-names: Matching names for the register regions
> > > +  * "gmu"
> > > +  * "gmu_pdc"
> > > +  * "gmu_pdc_seg"
> > > +- interrupts: The interrupt signals from the GMU.
> > > +- interrupt-names: Matching names for the interrupts
> > > +  * "hfi"
> > > +  * "gmu"
> > > +- clocks: phandles to the device clocks
> > > +- clock-names: Matching names for the clocks
> > > +   * "gmu"
> > > +   * "cxo"
> > > +   * "axi"
> > > +   * "mnoc"
> > > +- power-domains: should be <&clock_gpucc GPU_CX_GDSC>
> > > +- iommus: phandle to the adreno iommu
> > > +- operating-points-v2: phandle to the OPP operating points
> > > +
> > > +Example:
> > > +
> > > +/ {
> > > +   ...
> > > +
> > > +   gmu: gmu@506a000 {
> > > +           compatible="qcom,adreno-gmu";
> > > +
> > > +           reg = <0x506a000 0x30000>,
> > > +                   <0xb280000 0x10000>,
> > > +                   <0xb480000 0x10000>;
> > > +           reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> > > +
> > > +           interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> > > +                <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> > > +           interrupt-names = "hfi", "gmu";
> > > +
> > > +           clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > > +                   <&gpucc GPU_CC_CXO_CLK>,
> > > +                   <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > > +                   <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> > > +           clock-names = "gmu", "cxo", "axi", "memnoc";
> > > +
> > > +           power-domains = <&gpucc GPU_CX_GDSC>;
> > > +           iommus = <&adreno_smmu 5>;
> > > +
> > > +           operating-points-v2 = <&gmu_opp_table>;
> > > +   };
> > > +};
> > > diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> > > index 43fac0fe09bb..8d9415180c22 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> > > +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> > > @@ -8,14 +8,21 @@ Required properties:
> > >    with the chip-id.
> > >  - reg: Physical base address and length of the controller's registers.
> > >  - interrupts: The interrupt signal from the gpu.
> > > -- clocks: device clocks
> > > +- interrupt-names: List of names for the interrupt signals. The following can be
> > > +  provided:
> > > +  * "kgsl_3d0_irq"
> >
> > I'm pretty sure 'kgsl' is not a hardware thing. You don't need *-names
> > when there is only one of something.
>
> This has mainly existed just for compatibility issues.  We do only have the one
> interrupt so lets zap the downstream name and never look back.
>
> > > +- clocks: device clocks (if applicable)
> >
> > What does this mean? They are now optional? If so, move to an "Optional"
> > section. Likewise for the others.
>
> They are indeed optional now.
>
> > Really, you should add a new compatible so we can validate when clocks
> > not being present is valid vs. an error in the DT.
>
> We could use the GPU revision for that, but our approach has been to make all
> clocks optional for all targets.  Eventually when we go to power up if the GPU
> core ends up needing a clock and it isn't defined we fail probe at that point.
> I'm not sure if that is resilient enough for DT purposes though.
>
> Jordan
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
