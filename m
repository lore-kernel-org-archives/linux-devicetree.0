From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] coresight: bindings for coresight drivers
Date: Thu, 11 Sep 2014 17:03:59 -0500
Message-ID: <CAL_JsqLoFJd63ytGegermK14X1aiyCCQE6Hkig6FQvB2opom=Q@mail.gmail.com>
References: <1410451471-16121-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410451471-16121-1-git-send-email-mathieu.poirier@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 11, 2014 at 11:04 AM,  <mathieu.poirier@linaro.org> wrote:
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> Coresight IP blocks allow for the support of HW assisted tracing
> on ARM SoCs.  Bindings for the currently available blocks are
> presented herein.
>
> Signed-off-by: Pratik Patel <pratikp@codeaurora.org>
> Signed-off-by: Panchaxari Prasannamurthy <panchaxari.prasannamurthy@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

One minor issue below, but this looks pretty good to me.

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/arm/coresight.txt          | 203 +++++++++++++++++++++
>  1 file changed, 203 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> new file mode 100644
> index 0000000..96dd947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -0,0 +1,203 @@
> +* CoreSight Components:
> +
> +CoreSight components are compliant with the ARM CoreSight architecture
> +specification and can be connected in various topologies to suit a particular
> +SoCs tracing needs. These trace components can generally be classified as sinks,
> +links and sources. Trace data produced by one or more sources flows through the
> +intermediate links connecting the source to the currently selected sink. Each
> +CoreSight component device should use these properties to describe its hardware
> +characteristcs.
> +
> +* Required properties for all components *except* non-configurable replicators:
> +
> +       * compatible: These have to be supplemented with "arm,primecell" as
> +         drivers are using the AMBA bus interface.  Possible values include:
> +               - "arm,coresight-etb10", "arm,primecell";
> +               - "arm,coresight-tpiu", "arm,primecell";
> +               - "arm,coresight-tmc", "arm,primecell";
> +               - "arm,coresight-funnel", "arm,primecell";
> +               - "arm,coresight-etm3x", "arm,primecell";
> +
> +       * reg: physical base address and length of the register
> +         set(s) of the component.
> +
> +       * clocks: the clock associated to this component.
> +
> +       * clock-names: the name of the clock as referenced by the code.
> +         Since we are using the AMBA framework, the name should be
> +         "apb_pclk".
> +
> +       * port or ports: The representation of the component's port
> +         layout using the generic DT graph presentation found in
> +         "bindings/graph.txt".
> +
> +* Required properties for devices that don't show up on the AMBA bus, such as
> +  non-configurable replicators:
> +
> +       * compatible: Currently supported value is (note the absence of the
> +         AMBA markee):
> +               - "arm,coresight-replicator"
> +
> +       * id: a unique number that will identify this replicator.
> +
> +       * port or ports: same as above.
> +
> +* Optional properties for ETM/PTMs:
> +
> +       * arm,cp14: must be present if the system accesses ETM/PTM management registers
> +         via co-processor 14.
> +
> +       * cpu: the cpu phandle this ETM/PTM is affined to. When omitted the source is
> +         considered to belong to CPU0.
> +
> +* Optional property for TMC:
> +
> +       * arm,buffer-size: size of contiguous buffer space for TMC ETR
> +        (embedded trace router)
> +
> +
> +Example:
> +
> +1. Sinks
> +       etb@0,20010000 {

So we probably steered you wrong here, but a comma is only for when
you have different components like PCI bus, device, function for
addressing. So drop the comma here.

Rob
