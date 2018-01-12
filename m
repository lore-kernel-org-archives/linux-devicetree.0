From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
Date: Fri, 12 Jan 2018 22:34:52 +0200
Message-ID: <16302407.sBbAbgG5LB@avalon>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com> <81a9462b-6aaa-52c7-f741-e504c14838e9@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <81a9462b-6aaa-52c7-f741-e504c14838e9-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Friday, 12 January 2018 17:13:06 EET Sergei Shtylyov wrote:
> On 01/12/2018 03:58 AM, Laurent Pinchart wrote:
> > The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> > corresponding device tree bindings.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > ---
> > 
> >  .../bindings/display/bridge/renesas,lvds.txt       | 54 +++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >   2 files changed, 55 insertions(+)
> >   create mode 100644
> >   Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt new
> > file mode 100644
> > index 000000000000..459c56822eda
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -0,0 +1,54 @@
> > +Renesas R-Car LVDS Encoder
> > +==========================
> > +
> > +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> > Gen2
> > +and Gen3 SoCs.
> > +
> > +Required properties:
> > +
> > +- compatible : Shall contain one of
> > +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7790" for R8A7790 (R-Car H2) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7791" for R8A7791 (R-Car M2-W) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7793" for R8A7791 (R-Car M2-N) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS
> > encoders
> > +
> > +- reg: Base address and length for the memory-mapped registers
> > +- clocks: A phandle + clock-specifier pair for the functional clock
> > +
> > +Requires nodes:
> > +
> > +The LVDS encoder has two video ports. Their connections are modelled
> > using the
> > +OF graph bindings specified in Documentation/devicetree/bindings/
> > graph.txt.
> > +
> > +- Video port 0 corresponds to the parallel input
> 
> s/parallel/RGB/, perhaps?

Strictly speaking the LVDS output also carries RGB. I'll replace "parallel" 
with "parallel RGB".

> > +- Video port 1 corresponds to the LVDS output
> > +
> > +Each port shall have a single endpoint.
> > +
> > +
> > +Example:
> > +
> > +	lvds0: lvds@feb90000 {
> > +		compatible = "renesas,lvds-r8a7790";
> > +		reg = <0 0xfeb90000 0 0x1c>;
> > +		clocks = <&cpg CPG_MOD 726>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				lvds0_in: endpoint {
> > +					remote-endpoint = <&du_out_lvds0>;
> 
> Err, that "du_out_lvds0" label no longer reflects reality, no?

Well, it's the output of the DU connected to LVDS encoder 0, so I think the 
name still makes sense. If you can think of a better name feel free to propose 
one, otherwise I'll keep this one.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
