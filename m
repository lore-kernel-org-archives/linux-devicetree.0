From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] reset: img: Add pistachio reset controller binding
 document
Date: Fri, 15 Jan 2016 17:48:31 +0100
Message-ID: <1452876511.6067.92.camel@pengutronix.de>
References: <1452869073-27608-1-git-send-email-james.hartley@imgtec.com>
	  <1452869073-27608-2-git-send-email-james.hartley@imgtec.com>
	 <1452873439.6067.86.camel@pengutronix.de> <56991F23.8010500@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56991F23.8010500-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Damien Horsley <damien.horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <govindraj.raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, den 15.01.2016, 16:32 +0000 schrieb James Hartley:
> Hi Philipp,
> 
> Thanks for the quick review,
> 
> On 01/15/16 15:57, Philipp Zabel wrote:
> > Am Freitag, den 15.01.2016, 14:44 +0000 schrieb James Hartley:
> [..]
> >> +Example:
> >> +
> >> +	pistachio_reset: reset-controller {
> >> +		compatible = "img,pistachio-reset";
> >> +		img,cr-periph = <&cr_periph>;
> >> +		#reset-cells = <1>;
> >> +	};
> > If this is just a register in the cr_periph syscon, why not put the
> > reset-controller node inside the cr_periph node:
> >
> >      cr_periph: syscon@xyz {
> >          compatible = "syscon", "simple-mfd";
> >          pistachio_reset: reset-controller {
> >              compatible = "img,pistachio-reset";
> >              #reset-cells = <1>;
> >          };
> >      };
> >
> > And in the driver use
> >      syscon_node_to_regmap(np->parent);
> > instead of
> >      syscon_regmap_lookup_by_phandle(np, "img,cr-periph");
> > ?
> 
> Yes that makes sense, I'll look at changing that for a V2 patchset.
> 
> > Do you need a reg property, or is will the register offset be 0 in all
> > pistachio variants?
> 
> The offset will always be 0 for all pistachio variants.

Ok.

> [..]
> > +Example:
> > +
> > +	spdif_out: spdif-out@18100d00 {
> > +		...
> > +		resets = <&pistachio_reset PISTACHIO_RESET_SPDIF_OUT>;
> > +		reset-names = "rst";
> > reset-names is not needed for devices that only have one reset.
> 
> Agreed, but there are already audio drivers that pistachio uses that 
> have been merged upstream
> using this name in their dt-entries - is there any harm in leaving it in?

That was just a remark. As long as this requirement is there from the
beginning and it is used consistently, I don't mind.

best regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
