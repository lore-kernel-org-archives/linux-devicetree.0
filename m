From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 1/1] of/overlay: of overlay callbacks
Date: Mon, 22 Feb 2016 15:40:18 -0600
Message-ID: <alpine.DEB.2.10.1602221531170.3928@atull-730U3E-740U3E>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com> <1455730885-1514-2-git-send-email-atull@opensource.altera.com> <20160222025517.GS15973@rob-hp-laptop> <6F671B0F-4F94-47F0-9CA2-04E6F905F20A@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-598698057-1456177231=:3928"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6F671B0F-4F94-47F0-9CA2-04E6F905F20A-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--8323329-598698057-1456177231=:3928
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT

On Mon, 22 Feb 2016, Pantelis Antoniou wrote:

> Hi Rob,
> 
> > On Feb 22, 2016, at 04:55 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > 
> > On Wed, Feb 17, 2016 at 11:41:25AM -0600, Alan Tull wrote:
> >> Add overlay callback functionality.
> >> 
> >> When DT overlays are being added, some drivers/subsystems
> >> will want to know about the changes before they go into the
> >> live tree.  Similarly there is a need for post-remove
> >> callbacks.
> >> 
> >> Each handler is registered with a of_device_id.  When
> >> an overlay target matches a handler's id, the handler
> >> gets called.
> >> 
> >> The following 4 cases are handled: pre-apply, post-apply,
> >> pre-remove, and post-remove.
> > 
> > So I know I suggested maybe not using notifiers, but this ends up just 
> > looking like notifiers, so we might as well use them unless we somehow 
> > change the flow. You would just need to add pre-apply and pre-remove 
> > in of_attach_node and of_detach_node, right?
> > 
> 
> 
> I agree those look just like notifiers. We could just update the notifier
> logic to handle this case.
> 
> Am I missing something else?
> 

We also need the device node of the overlay itself included in
of_reconfig_data.  Otherwise notification of each addded property goes
out with little context.  For instance, when my FPGA code gets pre-add
notification that a "firmware-name" property has been added to an
existing "fpga-region" node, the fpga-region also needs to know what
other properties are about to be added.  Having the overlay would take
care of that easily.

I'm working on it and may have something tomorrow.

Alan

> 
> > Rob
> 
> Regards
> 
> — Pantelis
> 
> 
--8323329-598698057-1456177231=:3928--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
