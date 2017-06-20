From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
Date: Tue, 20 Jun 2017 09:22:19 +0200
Message-ID: <0c04a677-391b-ab2c-8ef9-09e87d75addf@samsung.com>
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496405096-18275-2-git-send-email-boris.brezillon@free-electrons.com>
 <60f8b8ec-c83b-0609-c5e5-44b3f9302808@codeaurora.org>
 <20170606113545.3a9ab2d0@bbrezillon>
 <902ba6cf-4125-fac6-62dd-6b6198f541f3@ti.com>
 <20170606144810.1efa0c79@bbrezillon>
 <CGME20170606125931epcas4p38f171f2d25914513894121ca95012510@epcas4p3.samsung.com>
 <9ca829e6-4696-7c3a-aed3-6a2af3161557@ti.com>
 <cb4c3bc1-5c61-25dd-a229-64753de68af4@samsung.com>
 <20170619121231.5ac1fc95@bbrezillon>
 <44b693f5-152e-cb0c-4a99-c8d1b0d8e3d9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <44b693f5-152e-cb0c-4a99-c8d1b0d8e3d9-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20.06.2017 08:56, Archit Taneja wrote:
>
> On 06/19/2017 03:42 PM, Boris Brezillon wrote:
>> On Tue, 13 Jun 2017 11:02:47 +0200
>> Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>
>>> Hi,
>>>
>>> Just spotted this thread.
>>>
>>> On 06.06.2017 14:58, Tomi Valkeinen wrote:
>>>> On 06/06/17 15:48, Boris Brezillon wrote:
>>>>   
>>>>> Okay. Thanks for the clarification. Can you confirm that this version
>>>>> is correct?
>>>>>
>>>>>   	dsi@xxx {
>>>>>   		#address-cells = <1>;
>>>>>   		#size-cells = <0>;
>>>>>   
>>>>>   		ports {
>>>>>   			#address-cells = <1>;
>>>>>   			#size-cells = <0>;
>>>>> 			dpi_in: port@0 {
>>>>>   				reg = <0>;
>>>>>   				#address-cells = <1>;
>>>>>   				#size-cells = <0>;
>>>>>   
>>>>>   				endpoint@0 {
>>>>>   					remote-endpoint = <&dpi_out>;
>>>>>   				};
>>>>>   			};
>>>>>   
>>>>>   			dsi_out: port@1 {
>>>>>   				reg = <1>;
>>>>> 				#address-cells = <1>;
>>>>>   				#size-cells = <0>;
>>>>>   
>>>>>   				dsi_out_vc0: endpoint@0 {
>>>>> 					reg = <0>;
>>>>>   					remote-endpoint = <&dsi_panel0_in>;
>>>>> 				};
>>>>>
>>>>>   				dsi_out_vc1: endpoint@1 {
>>>>> 					reg = <1>;
>>>>>   					remote-endpoint = <&dsi_panel1_in>;
>>>>>   				};
>>>>>   			};
>>>>>   		};
>>>>>   
>>>>>   		panel@0 {
>>>>>   			compatible = "...";
>>>>>   			reg = <0>;
>>>>>   			#address-cells = <1>;
>>>>>   			#size-cells = <0>;
>>>>>   
>>>>>   			port@0 {
>>>>>   				#address-cells = <1>;
>>>>>   		                #size-cells = <0>;
>>>>>   				reg = <0>;
>>>>>   
>>>>>   				dsi_panel0_in: endpoint@0 {
>>>>> 					reg = <0>;
>>>>>   					remote-endpoint = <&dsi_out_vc0>;
>>>>>   				};
>>>>>   			};
>>>>>   		};
>>>>>   
>>>>>   		panel@1 {
>>>>>   			compatible = "...";
>>>>>   			reg = <1>;
>>>>>   			#address-cells = <1>;
>>>>>   			#size-cells = <0>;
>>>>>   
>>>>>   			port@0 {
>>>>>   				#address-cells = <1>;
>>>>>   		                #size-cells = <0>;
>>>>>   				reg = <0>;
>>>>>   
>>>>>   				dsi_panel1_in: endpoint@0 {
>>>>> 					reg = <0>;
>>>>>   					remote-endpoint = <&dsi_out_vc1>;
>>>>>   				};
>>>>>   			};
>>>>>   		};
>>>>>   	};
>>>>>   
>>>> Looks correct to me. I think it can be a bit shorter though:
>>>>
>>>> - You don't need #address-cells and #size-cells for all. I think those
>>>> are inherited from the parent.
>>>> - If there's just one port and one endpoint, you can leave the 'reg'
>>>> out, as it's considered to be 0 by default.
>>>>
>>>> So for the panel, you can have just:
>>>>
>>>> port {
>>>> 	dsi_panel1_in: endpoint {
>>>> 		remote-endpoint = <&dsi_out_vc1>;
>>>> 	};
>>>> };
>>> In case DSI bus is used to both control and sending video signal you can
>>> skip video links from dsi-host to dsi-child, so nodes can look like:
>>>
>>>
>>>   	dsi@xxx {
>>>   		#address-cells = <1>;
>>>   		#size-cells = <0>;
>>>   
>>>   		ports {
>>>   			#address-cells = <1>;
>>>   			#size-cells = <0>;
>>> 			dpi_in: port@0 {
>>>   				reg = <0>;
>>>   				#address-cells = <1>;
>>>   				#size-cells = <0>;
>>>   
>>>   				endpoint@0 {
>>>   					remote-endpoint = <&dpi_out>;
>>>   				};
>>>   			};
>>>   
>>>   		};
>>>   
>>>   		panel@0 {
>>>   			compatible = "...";
>>>   			reg = <0>;
>>>   		};
>>>   
>>>   		panel@1 {
>>>   			compatible = "...";
>>>   			reg = <1>;
>>>   		};
>>>   	};
>>>
>> Does that mean I should make port1 (AKA DSI ouput port) optional?
>> IMHO, it's clearer when these links are explicitly described in the DT,
>> but maybe there are good reasons to keep it implicit for the "control
>> through DSI" case.
>>
>> Tomi, Archit, any opinion on this?
> I guess there isn't any harm in having the links explicitly described. It's
> just that those ports won't be used by the driver in the "control through DSI"
> case.
>
> For the MSM DSI host bindings, we actually keep the DSI 'data-lanes' param in the
> DSI output port, so it's mandatory even if the panel/bridge is controlled via
> the host DSI bus.
>
> Andrzej,
>
> Are there any reasons why keeping the host-to-child links in the "control through
> DSI" case could be harmful?

They are redundant - DSI bus already describes the 'link', so there are
classical potential issues connected with redundancy:
- which info should be parsed by the driver,
- what to do if links provide different information than DSI bus.
And as I understand current device-tree policy is to avoid them in such
case, see [1].

[1]: http://marc.info/?l=dri-devel&m=148354108702517&w=2

Regards
Andrzej


>
> Archit
>
>> Regards,
>>
>> Boris
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
