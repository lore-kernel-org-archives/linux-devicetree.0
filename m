From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Tue, 16 Jan 2018 18:32:55 +0200
Message-ID: <2356342.Lly4sZCK6s@avalon>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com> <71c9aaea-a721-6cec-5b7f-f14f7e21d191@gmail.com> <CAL_JsqKD_VKMrfi42hZ3eHPAMWBwryV0g_cXDUeyaKfPP99LmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKD_VKMrfi42hZ3eHPAMWBwryV0g_cXDUeyaKfPP99LmA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tuesday, 16 January 2018 16:35:26 EET Rob Herring wrote:
> On Mon, Jan 15, 2018 at 5:46 PM, Frank Rowand wrote:
> > On 01/15/18 12:29, Laurent Pinchart wrote:
> >> On Monday, 15 January 2018 22:12:33 EET Frank Rowand wrote:
> >>> On 01/15/18 11:22, Laurent Pinchart wrote:
> >>>> On Monday, 15 January 2018 21:12:44 EET Frank Rowand wrote:
> >>>>> On 01/15/18 09:09, Rob Herring wrote:
> >>>>>> On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
> >>>>>>> The internal LVDS encoders now have their own DT bindings. Before
> >>>>>>> switching the driver infrastructure to those new bindings, implement
> >>>>>>> backward-compatibility through live DT patching.
> >>>>>> 
> >>>>>> Uhh, we just got rid of TI's patching and now adding this one. I
> >>>>>> guess
> >>> 
> >>> Let me first answer the question that you ask later.  You ask "Can we
> >>> work on this together to find a solution that would suit us both ?"
> >>> 
> >>> My answer to that is emphatically YES.  I will definitely work with you
> >>> to try to find a good solution.
> >> 
> >> \o/
> >> 
> >>>>> Please no.  What we just got rid of was making it difficult for me to
> >>>>> make changes to the overlay infrastructure.  There are issues with
> >>>>> overlays that need to be fixed before overlays become really usable.
> >>>>> I am about to propose the next change, which involves removing a
> >>>>> chunk of code that I will not be able to remove if this patch is
> >>>>> accepted (the proposal is awaiting me collecting some data about
> >>>>> the impact of the change, which I expect to complete this week).
> >>> 
> >>> I should have thought just a little bit more before I hit send.  The
> >>> situation is even worse than I wrote.  One of the next steps (in
> >>> addition to what I wrote about above) is to change the overlay apply
> >>> function to accept a flattened device tree (FDT), not an expanded
> >>> device tree.  In this changed model, the unflattened overlay is
> >>> not available to be modified before it is applied.
> >> 
> >> That makes sense if we consider overlays to be immutable objects that we
> >> apply without offering a way to modify them. I won't challenge that API
> >> decision, as my use of an overlay here is a bit of a hack indeed.
> >> 
> >>> It is important for the devicetree infrastructure to have ownership
> >>> of the FDT that is used to create the unflattened tree.  (Notice
> >>> that in the proposed patch, rcar_du_of_get_overlay() follows the
> >>> TI example of doing a kmemdup of the blob (FDT), then uses the
> >>> copy for the unflatten.  The kmemdup() in this case is to create
> >>> a persistent copy of the FDT.)  The driver having ownership of
> >>> this copy, and having the ability to free it is one of the many
> >>> problems with the current overlay implementation.
> >> 
> >> Yes, that's something I've identified as well. Lots of work has been done
> >> to clean up the OF core and we're clearly not done yet. I'm happy to see
> >> all the improvements you're working on.
> >> 
> >>>>> Can you please handle both the old and new bindings through driver
> >>>>> code instead?
> >>>> 
> >>>> I could, but it would be pointless. The point here is to allow cleanups
> >>>> in the driver. The LVDS encoder handling code is very intrusive in its
> >>>> current form and I need to get rid of it. There would be zero point in
> >>>> moving to the new infrastructure, as the main point is to get rid of
> >>>> the old code which prevents moving forward. As a consequence that would
> >>>> block new boards from receiving proper upstream support. An easy option
> >>>> is to break backward compatibility. I'm personally fine with that, but
> >>>> I assume other people would complain :-)
> >>>> 
> >>>> I can, on the other hand, work with you to see how live DT patching
> >>>> could be implemented in this driver without blocking your code. When
> >>>> developing this patch series I start by patching the device tree
> >>>> manually without relying on overlays at all, but got blocked by the
> >>>> fact that I need to allocate phandles for new nodes I create. If there
> >>>> was an API to allocate an unused phandle I could avoid using the
> >>>> overlay infrastructure at all. Or there could be other
> >>> 
> >>> It seems reasonable to provide a way to autogenerate a phandle (if
> >>> requested) by the devicetree code that creates a new node.  Were you
> >>> using a function from drivers/of/dynamic.c to create the node?
> >> 
> >> Not to allocate the node, no. I allocated the device_node structure
> >> manually with kzalloc(), and inserted it in the device tree with
> >> of_attach_node(). Is that the right approach ? I haven't been able to
> >> test the code as I stopped when I realized I couldn't allocate phandles.
> >> 
> >>>> options I'm not thinking of as I don't know what the changes you're
> >>>> working on are. Can we work on this together to find a solution that
> >>>> would suit us both ?
> >>> 
> >>> Again, yes, I would be glad to work with you on this.
> >> 
> >> How would you like to proceed ? I can try the manual approach again but
> >> need information about how I could cleanly implement phandle allocation.
> >> I will likely then run into other issues for which I might need help.
> > 
> > Here are my first thoughts, based on 4.15-rc7:
> > 
> > Question to Rob and Frank: should of_attach_node() be called directly, or
> > should it be called indirectly by creating a change set that adds the
> > node?
> > 
> > Frank's off the cuff answer (but would like to think more about it): since
> > the driver is modifying its own devicetree data, and thus no other entity
> > needs to be notified about the changes, there is no need to add the
> > complexity of using a change set.
> 
> There's exactly 2 users outside of the DT core. That's generally a
> sign of an API I'd like to make private.
> 
> > The following is how of_attach_node() could be modified to dynamically
> > create a phandle on request.
> 
> How would this work for all the phandle references that need to be fixed up?

As I know which properties contain a phandle that needs to be fixed up, my 
plan is to update those properties manually with the value of the newly 
allocated phandle.

What I need here is the ability to insert the following structure in the 
device tree:

        lvds@feb90000 {
               compatible = "renesas,r8a7796-lvds"; (*)
               reg = <0 0xfeb90000 0 0x14>; (*)
               clocks = <&cpg CPG_MOD 727>; (*)

               ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                                reg = <0>;
                                lvds0_in: endpoint {
                                        remote-endpoint = <&du_out_lvds0>; (*)
                                };
                        };
                        port@1 {
                                reg = <1>;
                                lvds0_out: endpoint {
                                        remote-endpoint = <&panel_in>; (*)
                                };
                        };
                };
        };

with the node unit address and all properties marked with a (*) computed at 
runtime based on information extract from the device tree. Additionally I need 
phandles for the lvds0_in and lvds0_out nodes, and set the value of two 
properties in the tree with those phandles.

I've used overlays as that was the only way I found to allocate phandles, but 
any other API will work for me as well.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
