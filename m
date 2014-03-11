From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 1/3] [media] of: move graph helpers from
 drivers/media/v4l2-core to drivers/of
Date: Tue, 11 Mar 2014 14:55:28 +0100
Message-ID: <531F15D0.50008@samsung.com>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de>
 <1536567.OYzyi25bjL@avalon> <531D7E9F.3090708@samsung.com>
 <1401949.AJnxRNDZ0C@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1401949.AJnxRNDZ0C@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/10/2014 12:42 PM, Laurent Pinchart wrote:
> Hi Andrzej,
> 
>>> I like that idea. I would prefer making the 'port' nodes mandatory and the
>>> 'ports' and 'endpoint' nodes optional. Leaving the 'port' node out
>>> slightly decreases readability in my opinion, but making the 'endpoint'
>>> node optional increases it. That's just my point of view though.
>>
>> I want to propose another solution to simplify bindings, in fact I have
>> few ideas to consider:
>>
>> 1. Use named ports instead of address-cells/regs. Ie instead of
>> port@number schema, use port-function. This will allow to avoid ports
>> node and #address-cells, #size-cells, reg properties.
>> Additionally it should increase readability of the bindings.
>>
>> device {
>> 	port-dsi {
>> 		endpoint { ... };
>> 	};
>> 	port-rgb {
>> 		endpoint { ... };
>> 	};
>> };
>>
>> It is little bit like with gpios vs reset-gpios properties.
>> Another advantage I see we do not need do mappings of port numbers
>> to functions between dts, drivers and documentation.
> 
> The problem with this approach is that ports are identified by a number inside 
> the kernel, so we would still need to define name to number mappings, or 
> switch to port names internally first.

The mapping will be only internal in the driver.

Anyway the bindings should be kernel agnostic.

Andrzej

> 
>> 2. Similar approach can be taken to endpoint nodes, in fact
>> as endpoints are children of port node and as I understand port node
>> have no other children we can use any name instead of endpoint@number,
>> of course some convention can be helpful.
>>
>> device {
>> 	port-dsi {
>> 		ep-soc1 { ... };
>> 		ep-soc2 { ... };
>> 	};
>> 	port-rgb {
>> 		ep-panel { ... };
>> 	};
>> };
> 
> I see less issues here, as we don't need to number endpoints if I'm not 
> mistaken.
> 
>> I would like to add that those ideas would work nicely with Sylwester's
>> proposition of skipping endpoints nodes in case there is only one
>> endpoint - the most common cases are devices with one or two ports, each
>> port having only one remote endpoint.
>> The complete graph for DSI/LVDS bridge I work recently will look like:
>>
>> dsim {
>> 	dsim_ep: port-dsi {
>> 		remote-endpoint = <&bridge_dsi_ep>;
>> 	};
>> };
>>
>> bridge {
>> 	bridge_dsi_ep: port-dsi {
>> 		remote-endpoint = <&dsim_ep>;
>> 	};
>> 	bridge_lvds_ep: port-lvds {
>> 		remote-endpoint = <&panel_ep>;
>> 	};
>> };
>>
>> panel {
>> 	port-lvds {
>> 		remote-endpoint <&bridge_lvds_ep>;
>> 	};
>> };
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
