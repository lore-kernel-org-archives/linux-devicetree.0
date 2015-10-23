MIME-Version: 1.0
In-Reply-To: <CAGS+omAs4Jvu7tKEMoNL9BSMQMwW=9UHzXW8_jS=5MbajaJzOg@mail.gmail.com>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
	<1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
	<CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
	<1442823067.3277.35.camel@pengutronix.de>
	<CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
	<1443689957.3272.18.camel@pengutronix.de>
	<CAL_Jsq+aBxjvPyAR3nUtXny6JwgcopSCENrBaGzo7OKXFA1cvg@mail.gmail.com>
	<CAGS+omAs4Jvu7tKEMoNL9BSMQMwW=9UHzXW8_jS=5MbajaJzOg@mail.gmail.com>
Date: Fri, 23 Oct 2015 07:29:54 -0500
Message-ID: <CAL_JsqJcNjUW6dh9o3hMd_ZZRWFyoTCh2Y13RC7R+cO05+FfWQ@mail.gmail.com>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, "kernel@pengutronix.de" <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 1, 2015 at 9:29 AM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> On Thu, Oct 1, 2015 at 8:58 PM, Rob Herring <robh@kernel.org> wrote:
>> On Thu, Oct 1, 2015 at 3:59 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>>> Am Mittwoch, den 30.09.2015, 12:13 -0500 schrieb Rob Herring:
>>>> On Mon, Sep 21, 2015 at 3:11 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>>>> > Note how the display-subsystem node overlaps the larb node. Is that
>>>> > acceptable?
>>>>
>>>> Given what the graph looks like, perhaps. However, do you really need
>>>> a container node? It only serves to provide a list of nodes (e.g. all
>>>> the children) to include as components. There are other ways to
>>>> determine this list. You could find all nodes just searching
>>>> compatible strings for each component. You just need to bind the drm
>>>> driver to some other DT node. Is there no node you can pick as the
>>>> master component?
>>>
>>> There is the mmsys clock-controller node at the top of the MMSYS address
>>> space (0x14000000-0x14ffffff):
>>>
>>>         mmsys: clock-controller@14000000 {
>>>                 compatible = "mediatek,mt8173-mmsys", "syscon";
>>>                 reg = <0 0x14000000 0 0x1000>;
>>>                 #clock-cells = <1>;
>>>         };
>>>
>>> Its register space also contains the MMSYS_CONFIG region that controls
>>> the multiplexers between the display function blocks, so that would be a
>>> good candidate.
>>> No driver binds to this node yet, the clocks are registered with
>>> CLK_OF_DECLARE.
>>>
>>> I'll try to bind to this node and have the driver find sibling nodes
>>> using their compatible strings.
>>
>> That doesn't seem like a good choice since there are other functions
>> in the block. I was thinking one of the display related blocks like
>> whatever block provides the main crtc functions.
>
> The two "OVL" nodes correspond to the "crtc" functions of the two
> display pipes in this SoC, we would setup the display-subsystem node
> like this:
>
> display-subsystem {
>   compatible = "mediatek,display-subsystem";
>   ports = <&ovl0>, <&ovl1>;
> };

Does this serve any purpose other than having a single struct drm_device? Is that required?

> And, any node that needs to poke around in the mmsys_config area, like
> an ovl, could access it using a phandle <&mmsys> to the common
> "mediatek,mt8173-mmsys" device, like this:
>
> ovl0: ovl@1400c000 {
>        compatible = "mediatek,mt8173-ovl";
>        reg = <0 0x1400c000 0 0x1000>;
>        interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
>        clocks = <&mmsys CLK_MM_DISP_OVL0>;
>        iommus = <&iommu M4U_LARB0_ID M4U_PORT_DISP_OVL0>;
>        mediatek,mmsys = <&mmsys>;
>        status = "disabled";
> };
>
> One idea to reduce the size of the of_graph would be to just model the
> entrance/exit points from the MM subsystem in dt.  So, instead of:
>   ovl0 -> color0 -> aal -> od -> ufoe -> dsi0 -> dsi-edp-bridge
>   ovl1 -> color1 -> gamma0 -> dpi0 -> hdmi
>
> We can do something like this:
>   ovl0 -> dsi0 -> dsi-edp-bridge
>   ovl1 -> dpi0 -> hdmi

Right, so if color0 is fixed to ovl0, then there is not much point in describing that.
> But ... this might be too limiting for some applications.
> So, I think we should just live with the big graph.
> I would, however, recommend that you move the graph to its own
> mt8173-display-graph.dtsi file which would be #included into a board
> specific .dts file.
>
> If you let the board .dts include the graph, then we can possibly
> shrink the resulting board specific device tree -
> At first we would make the full graph in one .dtsi as above
> "mt8173-display-graph.dtsi".
> This is the full reference graph that will always work.
>
> Then, if a particular board used a fixed configuration, the system
> integrator could create a smaller graph with just the graph nodes that
> they care about.
>
> For example, if mt8173-evb only supports a single HDMI output, then
> perhaps you would just
> set up the endpoints for this single fixed function display pipe in
> mt8173-evb-display-graph.dtsi:
>
> &ovl1 {
>     status = "okay";
>     port {
>         ovl1_to_color1: endpoint@0 {
>             remote-endpoint = <&color1_from_ovl1>;
>         };
>     };
> };
>
> &color1 {
>     status = "okay";
>     port@0 {
>         color1_from_ovl1: endpoint@1 {
>             remote-endpoint = <&ovl1_to_color1>;
>         };
>     };
>
>     port@1 {
>         color1_to_gamma: endpoint@0 {
>             remote-endpoint = <&gamma_from_color1>;
>         };
>     };
> };
>
> &gamma {
>     status = "okay";
>     port@0 {
>         gamma_from_color1: endpoint {
>             remote-endpoint = <&color1_to_gamma>;
>         };
>     };
>
>     port@1 {
>         gamma_to_dpi0: endpoint@3 {
>             remote-endpoint = <&dpi0_from_gamma>;
>         };
>     };
> };
>
> &dpi0 {
>     status = "okay";
>     port@0 {
>         dpi0_from_gamma: endpoint@2 {
>             remote-endpoint = <&gamma_to_dpi0>;
>         };
>     };
>
>     port@1 {
>         dpi0_to_hdmi: endpoint {
>             remote-endpoint = <&hdmi_from_dpi0>;
>         };
>     };
> };
>
> Notice that this also only enables the nodes that we care about (all
> of the other nodes would be disabled by default).
>
> I this would allow full flexibility but also drastically cut down on
> the resulting .dts size.
>
> The individual component drivers would then march down their graphs
> ensuring that all of the corresponding components have been bound, and
> then themselves appropriately based on their set of endpoints that are
> available.
>
> What do you think?
>
> -Dan
>
>
>>
>> Rob
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
