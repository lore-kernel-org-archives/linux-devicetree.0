From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
Date: Tue, 6 Jun 2017 14:48:10 +0200
Message-ID: <20170606144810.1efa0c79@bbrezillon>
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
        <1496405096-18275-2-git-send-email-boris.brezillon@free-electrons.com>
        <60f8b8ec-c83b-0609-c5e5-44b3f9302808@codeaurora.org>
        <20170606113545.3a9ab2d0@bbrezillon>
        <902ba6cf-4125-fac6-62dd-6b6198f541f3@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <902ba6cf-4125-fac6-62dd-6b6198f541f3-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 6 Jun 2017 15:40:25 +0300
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> On 06/06/17 12:35, Boris Brezillon wrote:
> > On Sat, 3 Jun 2017 23:43:17 +0530
> > Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> >   
> >> Hi,
> >>
> >> On 06/02/2017 05:34 PM, Boris Brezillon wrote:  
> >>> Document the bindings used for the Cadence DSI bridge.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>> ---
> >>>  .../bindings/display/bridge/cdns,dsi.txt           | 55 ++++++++++++++++++++++
> >>>  1 file changed, 55 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> >>> new file mode 100644
> >>> index 000000000000..770c5c5b1e93
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> >>> @@ -0,0 +1,55 @@
> >>> +Cadence DSI bridge
> >>> +==================
> >>> +
> >>> +The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.    
> >>
> >> Is this a separate chip, or an IP integrated into SoCs?  
> > 
> > It's supposed to be integrated into SoCs.
> >   
> >> If it's the 
> >> latter, I don't think DPI on the its input side is the right term to 
> >> use. Maybe RGB would be more appropriate here.  
> > 
> > Well, the datasheet explicitly mentions DPI, and you can also send
> > pixels in YUV422 and YUV420 format on this bus, so I don't think RGB is
> > appropriate, but if you really want me to use RGB I can change that.
> > 
> > BTW, can you detail why DPI is not appropriate for internal parallel
> > busses. I don't understand why it makes a difference when the bus is exposed
> > through external pins.  
> 
> I think MIPI DPI is fine, if it is indeed MIPI DPI. But mot all parallel
> video busses are MIPI DPI.
> 
> >>> +Required subnodes:
> >>> +- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
> >>> +  Currently contains a single input port at address 0 representing the DPI
> >>> +  input. Other ports will be added later to support the SDI inputs.
> >>> +  Port 0 should be connected to a DPI encoder output.    
> >>
> >> The output of the DSI bridge may be another bridge, which could be i2c
> >> controlled. In that case, it won't be a child of the DSI bridge. For
> >> such scenarios, we might want to define an output port for the bridge.  
> > 
> > Hm, okay. IIRC, this is something you mentioned when I asked how to
> > describe input/output ports for a DSI bridge a while ago.
> > 
> > I'm still not sure how the links between input and output endpoint are
> > supposed to be described.
> > 
> > For example, if you take the case where you have the DSI device
> > directly described under the DSI host controller, should I create
> > another node for this output port? Something like the following?
> > 
> > 	dsi@xxx {
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 			dpi_in: port@0 {
> > 				reg = <0>;
> > 				#address-cells = <1>;
> > 				#size-cells = <0>;
> > 
> > 				endpoint@0 {
> > 					remote-endpoint = <&dpi_out>;
> > 				};
> > 			};
> > 
> > 			dsi_out0: port@1 {
> > 				reg = <1>;
> > 				#address-cells = <1>;
> > 				#size-cells = <0>;
> > 
> > 				dsi_out0: endpoint@0 {
> > 					remote-endpoint = <&dsi_panel0_in>;
> > 				};
> > 			};
> > 
> > 			dsi_out0: port@2 {
> > 				reg = <2>;
> > 				#address-cells = <1>;
> > 				#size-cells = <0>;
> > 
> > 				dsi_out1: endpoint@0 {
> > 					remote-endpoint = <&dsi_panel1_in>;
> > 				};
> > 			};
> > 		};
> > 
> > 		panel@0 {
> > 			compatible = "...";
> > 			reg = <0>;
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			port@0 {
> > 				#address-cells = <1>;
> > 		                #size-cells = <0>;
> > 				reg = <0>;
> > 
> > 				dsi_panel0_in: endpoint@0 {
> > 					remote-endpoint = <&dsi_out0>;
> > 				};
> > 			};
> > 		};
> > 
> > 		panel@1 {
> > 			compatible = "...";
> > 			reg = <1>;
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			port@0 {
> > 				#address-cells = <1>;
> > 		                #size-cells = <0>;
> > 				reg = <0>;
> > 
> > 				dsi_panel1_in: endpoint@0 {
> > 					remote-endpoint = <&dsi_out1>;
> > 				};
> > 			};
> > 		};
> > 	};
> >   
> 
> The ports & endpoints describe the video path, and the node child-parent
> relationship describe the control path. And "port" is a physical
> connector of some sort, and endpoint is a virtual channel or such.
> 
> So, you can have DSI peripherals which are either children of the DSI
> bridge, and can be controlled with DSI commands. Or, you can have, say,
> i2c peripherals, defined under an i2c node, which just take the video
> stream from the DSI bridge. Both would have similar ports & endpoints,
> but the DT nodes would be located under different parents.
> 
> Also, you can't have two output ports unless the DSI bridge has actually
> multiple output pins. If the two panels are connected to the same DSI
> pins, and the DSI virtual channel is used to direct the output to the
> correct panel, then these should be endpoints.

Okay. Thanks for the clarification. Can you confirm that this version
is correct?

 	dsi@xxx {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
			dpi_in: port@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
 				endpoint@0 {
 					remote-endpoint = <&dpi_out>;
 				};
 			};
 
 			dsi_out: port@1 {
 				reg = <1>;
				#address-cells = <1>;
 				#size-cells = <0>;
 
 				dsi_out_vc0: endpoint@0 {
					reg = <0>;
 					remote-endpoint = <&dsi_panel0_in>;
				};

 				dsi_out_vc1: endpoint@1 {
					reg = <1>;
 					remote-endpoint = <&dsi_panel1_in>;
 				};
 			};
 		};
 
 		panel@0 {
 			compatible = "...";
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
 			port@0 {
 				#address-cells = <1>;
 		                #size-cells = <0>;
 				reg = <0>;
 
 				dsi_panel0_in: endpoint@0 {
					reg = <0>;
 					remote-endpoint = <&dsi_out_vc0>;
 				};
 			};
 		};
 
 		panel@1 {
 			compatible = "...";
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
 			port@0 {
 				#address-cells = <1>;
 		                #size-cells = <0>;
 				reg = <0>;
 
 				dsi_panel1_in: endpoint@0 {
					reg = <0>;
 					remote-endpoint = <&dsi_out_vc1>;
 				};
 			};
 		};
 	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
