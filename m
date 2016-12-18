From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common panel properties
Date: Sun, 18 Dec 2016 22:54:03 +0200
Message-ID: <2900223.pppRAbRhe6@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAL_JsqL0+4--nE1UDHWzqS-s18A+q2i76S8=woCb5huV3jUMew@mail.gmail.com> <2064799.n5laApbQHL@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2064799.n5laApbQHL@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tuesday 29 Nov 2016 20:23:41 Laurent Pinchart wrote:
> On Tuesday 29 Nov 2016 09:14:09 Rob Herring wrote:
> > On Tue, Nov 29, 2016 at 2:27 AM, Laurent Pinchart wrote:
> >> On Tuesday 22 Nov 2016 11:36:55 Laurent Pinchart wrote:
> >>> On Monday 21 Nov 2016 10:48:15 Rob Herring wrote:
> >>>> On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
> >>>>> Document properties common to several display panels in a central
> >>>>> location that can be referenced by the panel device tree bindings.
> >>>> 
> >>>> Looks good. Just one comment...
> >>>> 
> >>>> [...]
> >>>> 
> >>>>> +Connectivity
> >>>>> +------------
> >>>>> +
> >>>>> +- ports: Panels receive video data through one or multiple
> >>>>> connections. While
> >>>>> +  the nature of those connections is specific to the panel type, the
> >>>>> +  connectivity is expressed in a standard fashion using ports as
> >>>>> specified in
> >>>>> +  the device graph bindings defined in
> >>>>> +  Documentation/devicetree/bindings/graph.txt.
> >>>> 
> >>>> We allow panels to either use graph binding or be a child of the
> >>>> display controller.
> >>> 
> >>> I knew that some display controllers use a phandle to the panel (see
> >>> the fsl,panel and nvidia,panel properties), but I didn't know we had
> >>> panels as children of display controller nodes. I don't think we should
> >>> allow that for anything but DSI panels, as the DT hierarchy is based on
> >>> control buses. Are you sure we have other panels instantiated through
> >>> that mechanism ?
> > 
> > Some panels have no control bus, so were do we place them?
> 
> I'd say under the root node, like all similar control-less devices.
> 
> > I would say the hierarchy is based on buses with a preference for the
> > control bus when there are multiple buses. I'm not a fan of just sticking
> > things are the top level.
> 
> OK, so much for my comment a few lines up :-)
> 
> The problem with placing non-DSI panels as children of the display
> controller and not using OF graph is that the panel bindings become
> dependent of the display controller being used. A display controller using
> OF graph would require the panel to do the same, while a display controller
> expecting a panel child node (with a specific name) would require DT
> properties for the panel node.
> 
> I'm also not sure the complexity of OF graph is really that prohibitive if
> you compare it to panels as child nodes. To get the panel driver to bind to
> the panel DT node the display controller driver would need to create a
> platform device for the panel and register it. That's not very difficult,
> but parsing a single port and endpoint isn't either (and we could even
> provide a helper function for that, a version of of_drm_find_panel() that
> would take as an argument the display controller device node instead of the
> panel device node).

Ping ?

I'd like to standardize on one model for panel DT bindings, but I'm not sure 
that can be achieved given that we already have multiple competing models. In 
any case, is that blocking to merge this patch ? I only describe one 
connectivity model here as that's what my panel driver needs, but I have no 
issue adding more models later when needed. I believe this patch is a good 
step forward already.

> >> Ping ?
> >> 
> >> Please note that this file documents properties common to multiple panel
> >> DT bindings, but in no way makes it mandatory to use the OF graph
> >> bindings for panels. The decision is left to individual bindings.
> > 
> > It is mandatory in the sense that we don't want more cases of "fsl,panel".
> 
> That I agree with :-)

-- 
Regards,

Laurent Pinchart
