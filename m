From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 1/1] of/overlay: of overlay callbacks
Date: Wed, 24 Feb 2016 16:36:28 -0600
Message-ID: <alpine.DEB.2.02.1602241632040.13189@linuxheads99>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com> <1455730885-1514-2-git-send-email-atull@opensource.altera.com> <20160222025517.GS15973@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160222025517.GS15973@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 22 Feb 2016, Rob Herring wrote:

> On Wed, Feb 17, 2016 at 11:41:25AM -0600, Alan Tull wrote:
> > Add overlay callback functionality.
> > 
> > When DT overlays are being added, some drivers/subsystems
> > will want to know about the changes before they go into the
> > live tree.  Similarly there is a need for post-remove
> > callbacks.
> > 
> > Each handler is registered with a of_device_id.  When
> > an overlay target matches a handler's id, the handler
> > gets called.
> > 
> > The following 4 cases are handled: pre-apply, post-apply,
> > pre-remove, and post-remove.
> 
> So I know I suggested maybe not using notifiers, but this ends up just 
> looking like notifiers, so we might as well use them unless we somehow 
> change the flow. You would just need to add pre-apply and pre-remove 
> in of_attach_node and of_detach_node, right?

Just sent out a patch.  Nobody calls of_attach_node or
of_detach_node so I had to add the notifiers elsewhere.

For overlays, I wanted to add a pointer to the overlay
fragment since pre-apply notifiers won't otherwise have that
information (unlike post-apply or pre-remove notifiers where
the overlay has already made it into the live tree).
That complicated the implementation a bit further.

Alan


> 
> Rob
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
