Return-Path: <moritz.fischer@ettus.com>
MIME-Version: 1.0
In-Reply-To: <1438831173-8761-1-git-send-email-punnaia@xilinx.com>
References: <1438831173-8761-1-git-send-email-punnaia@xilinx.com>
Date: Fri, 21 Aug 2015 01:29:44 -0700
Message-ID: <CAAtXAHdWHx2+49ZhkvLZCPhjXAgnhpLRDtnhwvO9Ptip1TR+8A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Documentation: dt: Add Xilinx zynqmp dma device
 tree binding documentation
From: Moritz Fischer <moritz.fischer@ettus.com>
Content-Type: multipart/alternative; boundary=047d7b5d33eee3fb5e051dce117a
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: kpc528@gmail.com, dmaengine@vger.kernel.org, dan.j.williams@intel.com, michal.simek@xilinx.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, vinod.koul@intel.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, linux-arm-kernel@lists.infradead.org, pawel.moll@arm.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

--047d7b5d33eee3fb5e051dce117a
Content-Type: text/plain; charset=UTF-8

Hi Punnaiah,

On Aug 5, 2015 20:21, "Punnaiah Choudary Kalluri" <
punnaiah.choudary.kalluri@xilinx.com> wrote:
>
> Device-tree binding documentation for Xilinx zynqmp dma engine used in
> Zynq UltraScale+ MPSoC.
>
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
> Changes in v4:
> - None
> Changes in v3:
> - None
> Changes in v2:
> - None
> ---
>  .../devicetree/bindings/dma/xilinx/zynqmp_dma.txt  |   61
++++++++++++++++++++
>  1 files changed, 61 insertions(+), 0 deletions(-)
>  create mode 100644
Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> new file mode 100644
> index 0000000..e4f92b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> @@ -0,0 +1,61 @@
> +Xilinx ZynqMP DMA engine, it does support memory to memory transfers,
> +memory to device and device to memory transfers. It also has flow
> +control and rate control support for slave/peripheral dma access.
> +
> +Required properties:
> +- compatible: Should be "xlnx,zynqmp-dma-1.0"
> +- #dma-cells: Should be <1>, a single cell holding a line request number
> +- reg: Memory map for module access
> +- interrupt-parent: Interrupt controller the interrupt is routed through
> +- interrupts: Should contain DMA channel interrupt
> +- xlnx,bus-width: AXI buswidth in bits. Should contain 128 or 64
> +
> +Optional properties:
> +- xlnx,include-sg: Indicates the controller to operate in simple or
scatter
> +                  gather dma mode
> +- xlnx,ratectrl: Scheduling interval in terms of clock cycles for
> +                source AXI transaction
> +- xlnx,overfetch: Tells whether the channel is allowed to over fetch the
data
> +- xlnx,src-issue: Number of AXI outstanding transactions on source side
> +- xlnx,desc-axi-cohrnt: Tells whether the AXI transactions generated for
the
> +                       descriptor read are marked Non-coherent
> +- xlnx,src-axi-cohrnt: Tells whether the AXI transactions generated for
the
> +                       source descriptor payload are marked Non-coherent
> +- xlnx,dst-axi-cohrnt: Tells whether the AXI transactions generated for
the
> +                       dst descriptor payload are marked Non-coherent
> +- xlnx,desc-axi-qos: AXI QOS bits to be used for descriptor fetch
> +- xlnx,src-axi-qos: AXI QOS bits to be used for data read
> +- xlnx,dst-axi-qos: AXI QOS bits to be used for data write
> +- xlnx,desc-axi-cache: AXI cache bits to be used for descriptor fetch.
> +- xlnx,desc-axi-cache: AXI cache bits to be used for data read
> +- xlnx,desc-axi-cache: AXI cache bits to be used for data write
> +- xlnx,src-burst-len: AXI length for data read. Support only power of 2
values
> +                     i.e 1,2,4,8 and 16
> +- xlnx,dst-burst-len: AXI length for data write. Support only power of 2
values
> +                     i.e 1,2,4,8 and 16
> +
> +Example:
> +++++++++
> +fpd_dma_chan1: dma@FD500000 {
> +       compatible = "xlnx,zynqmp-dma-1.0";
> +       reg = <0x0 0xFD500000 0x1000>;
> +       #dma_cells = <1>;
Shouldn't this be a dash? dma-cells
> +       interrupt-parent = <&gic>;
> +       interrupts = <0 117 4>;
> +       xlnx,bus-width = <128>;
> +       xlnx,include-sg;
> +       xlnx,overfetch;
> +       xlnx,ratectrl = <0>;
> +       xlnx,src-issue = <16>;
> +       xlnx,desc-axi-cohrnt;
> +       xlnx,src-axi-cohrnt;
> +       xlnx,dst-axi-cohrnt;
> +       xlnx,desc-axi-qos = <0>;
> +       xlnx,desc-axi-cache = <0>;
> +       xlnx,src-axi-qos = <0>;
> +       xlnx,src-axi-cache = <2>;
> +       xlnx,dst-axi-qos = <0>;
> +       xlnx,dst-axi-cache = <2>;
> +       xlnx,src-burst-len = <4>;
> +       xlnx,dst-burst-len = <4>;
> +};
> --
> 1.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Cheers,
Moritz

--047d7b5d33eee3fb5e051dce117a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Punnaiah,</p>
<p dir=3D"ltr">On Aug 5, 2015 20:21, &quot;Punnaiah Choudary Kalluri&quot; =
&lt;<a href=3D"mailto:punnaiah.choudary.kalluri@xilinx.com">punnaiah.chouda=
ry.kalluri@xilinx.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Device-tree binding documentation for Xilinx zynqmp dma engine used in=
<br>
&gt; Zynq UltraScale+ MPSoC.<br>
&gt;<br>
&gt; Signed-off-by: Punnaiah Choudary Kalluri &lt;<a href=3D"mailto:punnaia=
@xilinx.com">punnaia@xilinx.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v4:<br>
&gt; - None<br>
&gt; Changes in v3:<br>
&gt; - None<br>
&gt; Changes in v2:<br>
&gt; - None<br>
&gt; ---<br>
&gt; =C2=A0.../devicetree/bindings/dma/xilinx/zynqmp_dma.txt=C2=A0 |=C2=A0 =
=C2=A061 ++++++++++++++++++++<br>
&gt; =C2=A01 files changed, 61 insertions(+), 0 deletions(-)<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/dma/xilinx/=
zynqmp_dma.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.t=
xt b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e4f92b9<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt<br>
&gt; @@ -0,0 +1,61 @@<br>
&gt; +Xilinx ZynqMP DMA engine, it does support memory to memory transfers,=
<br>
&gt; +memory to device and device to memory transfers. It also has flow<br>
&gt; +control and rate control support for slave/peripheral dma access.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible: Should be &quot;xlnx,zynqmp-dma-1.0&quot;<br>
&gt; +- #dma-cells: Should be &lt;1&gt;, a single cell holding a line reque=
st number<br>
&gt; +- reg: Memory map for module access<br>
&gt; +- interrupt-parent: Interrupt controller the interrupt is routed thro=
ugh<br>
&gt; +- interrupts: Should contain DMA channel interrupt<br>
&gt; +- xlnx,bus-width: AXI buswidth in bits. Should contain 128 or 64<br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; +- xlnx,include-sg: Indicates the controller to operate in simple or s=
catter<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gather=
 dma mode<br>
&gt; +- xlnx,ratectrl: Scheduling interval in terms of clock cycles for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source AXI tr=
ansaction<br>
&gt; +- xlnx,overfetch: Tells whether the channel is allowed to over fetch =
the data<br>
&gt; +- xlnx,src-issue: Number of AXI outstanding transactions on source si=
de<br>
&gt; +- xlnx,desc-axi-cohrnt: Tells whether the AXI transactions generated =
for the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0descriptor read are marked Non-coherent<br>
&gt; +- xlnx,src-axi-cohrnt: Tells whether the AXI transactions generated f=
or the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0source descriptor payload are marked Non-coherent<br>
&gt; +- xlnx,dst-axi-cohrnt: Tells whether the AXI transactions generated f=
or the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dst descriptor payload are marked Non-coherent<br>
&gt; +- xlnx,desc-axi-qos: AXI QOS bits to be used for descriptor fetch<br>
&gt; +- xlnx,src-axi-qos: AXI QOS bits to be used for data read<br>
&gt; +- xlnx,dst-axi-qos: AXI QOS bits to be used for data write<br>
&gt; +- xlnx,desc-axi-cache: AXI cache bits to be used for descriptor fetch=
.<br>
&gt; +- xlnx,desc-axi-cache: AXI cache bits to be used for data read<br>
&gt; +- xlnx,desc-axi-cache: AXI cache bits to be used for data write<br>
&gt; +- xlnx,src-burst-len: AXI length for data read. Support only power of=
 2 values<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0i.e 1,2,4,8 and 16<br>
&gt; +- xlnx,dst-burst-len: AXI length for data write. Support only power o=
f 2 values<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0i.e 1,2,4,8 and 16<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +++++++++<br>
&gt; +fpd_dma_chan1: dma@FD500000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;xlnx,zynqmp-dma-1.0&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0xFD500000 0x1000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0#dma_cells =3D &lt;1&gt;;<br>
Shouldn&#39;t this be a dash? dma-cells<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =3D &lt;&amp;gic&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;0 117 4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,bus-width =3D &lt;128&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,include-sg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,overfetch;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,ratectrl =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,src-issue =3D &lt;16&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,desc-axi-cohrnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,src-axi-cohrnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,dst-axi-cohrnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,desc-axi-qos =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,desc-axi-cache =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,src-axi-qos =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,src-axi-cache =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,dst-axi-qos =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,dst-axi-cache =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,src-burst-len =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xlnx,dst-burst-len =3D &lt;4&gt;;<br>
&gt; +};<br>
&gt; --<br>
&gt; 1.7.4<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-arm-kernel mailing list<br>
&gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kern=
el@lists.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a></p>
<p dir=3D"ltr">Cheers,<br>
Moritz</p>

--047d7b5d33eee3fb5e051dce117a--
