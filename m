From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common panel properties
Date: Tue, 29 Nov 2016 10:27:58 +0200
Message-ID: <2454182.olmziLZUmD@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161121164815.bxca4rfvifloizdh@rob-hp-laptop> <2307840.2mk6E40XHl@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2307840.2mk6E40XHl@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tuesday 22 Nov 2016 11:36:55 Laurent Pinchart wrote:
> On Monday 21 Nov 2016 10:48:15 Rob Herring wrote:
> > On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
> >> Document properties common to several display panels in a central
> >> location that can be referenced by the panel device tree bindings.
> > 
> > Looks good. Just one comment...
> > 
> > [...]
> > 
> >> +Connectivity
> >> +------------
> >> +
> >> +- ports: Panels receive video data through one or multiple connections.
> >> While
> >> +  the nature of those connections is specific to the panel type, the
> >> +  connectivity is expressed in a standard fashion using ports as
> >> specified in
> >> +  the device graph bindings defined in
> >> +  Documentation/devicetree/bindings/graph.txt.
> > 
> > We allow panels to either use graph binding or be a child of the display
> > controller.
> 
> I knew that some display controllers use a phandle to the panel (see the
> fsl,panel and nvidia,panel properties), but I didn't know we had panels as
> children of display controller nodes. I don't think we should allow that for
> anything but DSI panels, as the DT hierarchy is based on control buses. Are
> you sure we have other panels instantiated through that mechanism ?

Ping ?

Please note that this file documents properties common to multiple panel DT 
bindings, but in no way makes it mandatory to use the OF graph bindings for 
panels. The decision is left to individual bindings.

> > Using the graph is preferred, but in the simple cases just a child node is
> > sufficient. This should be described here or somewhere in this doc.

-- 
Regards,

Laurent Pinchart
