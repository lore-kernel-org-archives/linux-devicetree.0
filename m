From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Tue, 16 Jan 2018 22:35:30 +0200
Message-ID: <5833406.fid2QrfmNC@avalon>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com> <2356342.Lly4sZCK6s@avalon> <CAL_Jsq+4X17Q+wva0R6sPHY02TJ5+E5vE8Y98+DB5VF2MdFy0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+4X17Q+wva0R6sPHY02TJ5+E5vE8Y98+DB5VF2MdFy0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tuesday, 16 January 2018 18:54:00 EET Rob Herring wrote:
> On Tue, Jan 16, 2018 at 10:32 AM, Laurent Pinchart wrote:
> > On Tuesday, 16 January 2018 16:35:26 EET Rob Herring wrote:
> >> On Mon, Jan 15, 2018 at 5:46 PM, Frank Rowand wrote:
> >>> On 01/15/18 12:29, Laurent Pinchart wrote:
> >>>> On Monday, 15 January 2018 22:12:33 EET Frank Rowand wrote:
> >>>>> On 01/15/18 11:22, Laurent Pinchart wrote:
> >>>>>> On Monday, 15 January 2018 21:12:44 EET Frank Rowand wrote:
> >>>>>>> On 01/15/18 09:09, Rob Herring wrote:
> >>>>>>>> On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
> >>>>>>>>> The internal LVDS encoders now have their own DT bindings. Before
> >>>>>>>>> switching the driver infrastructure to those new bindings,
> >>>>>>>>> implement backward-compatibility through live DT patching.
> 
> [...]
> 
> >>>> How would you like to proceed ? I can try the manual approach again
> >>>> but need information about how I could cleanly implement phandle
> >>>> allocation. I will likely then run into other issues for which I might
> >>>> need help.
> >>> 
> >>> Here are my first thoughts, based on 4.15-rc7:
> >>> 
> >>> Question to Rob and Frank: should of_attach_node() be called directly,
> >>> or should it be called indirectly by creating a change set that adds the
> >>> node?
> >>> 
> >>> Frank's off the cuff answer (but would like to think more about it):
> >>> since the driver is modifying its own devicetree data, and thus no other
> >>> entity needs to be notified about the changes, there is no need to add
> >>> the complexity of using a change set.
> >> 
> >> There's exactly 2 users outside of the DT core. That's generally a
> >> sign of an API I'd like to make private.
> >> 
> >>> The following is how of_attach_node() could be modified to dynamically
> >>> create a phandle on request.
> >> 
> >> How would this work for all the phandle references that need to be fixed
> >> up?
> > 
> > As I know which properties contain a phandle that needs to be fixed up, my
> > plan is to update those properties manually with the value of the newly
> > allocated phandle.
> 
> That sounds like more low level, internal detail mucking with than
> this current patch.

While I think the current patch is a bit of a hack I still like to to some 
extend, so I'm not requesting APIs to muck with OF internals instead of using 
the overlay API. It's entirely up to you and Frank (and other OF core 
developers). I'm fine with either way, all I know is that I need a solution 
:-)

> > What I need here is the ability to insert the following structure in the
> > device tree:
> > 
> >         lvds@feb90000 {
> >         
> >                compatible = "renesas,r8a7796-lvds"; (*)
> >                reg = <0 0xfeb90000 0 0x14>; (*)
> >                clocks = <&cpg CPG_MOD 727>; (*)
> 
> I'm still of the opinion that all of this should be in a per SoC overlay.
> 
> >                ports {
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> >                         
> >                         port@0 {
> >                                 reg = <0>;
> >                                 lvds0_in: endpoint {
> >                                         remote-endpoint = <&du_out_lvds0>;
> >                                         (*)
> >                                 };
> >                         };
> >                         port@1 {
> >                                 reg = <1>;
> >                                 lvds0_out: endpoint {
> >                                         remote-endpoint = <&panel_in>; (*)
> 
> Then do the fixup of just the remote-endpoint properties. While it
> would be nice to say overlays are completely static, I'm guessing
> that's not going to be the case. After all, we pretty much have
> overlays because DT being static has limitations.

Do you mean fixing them up in the parsed overlay before applying it, or 
manually in the live device tree after applying the overlay ?

> >                                 };
> >                         };
> >                 };
> >         };
> > 
> > with the node unit address and all properties marked with a (*) computed
> > at runtime based on information extract from the device tree. Additionally
> > I need phandles for the lvds0_in and lvds0_out nodes, and set the value of
> > two properties in the tree with those phandles.
> > 
> > I've used overlays as that was the only way I found to allocate phandles,
> > but any other API will work for me as well.
> 
> I don't think drivers mucking with phandles directly to avoid another
> overlay user is an improvement.

Again I'm fine either way.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
