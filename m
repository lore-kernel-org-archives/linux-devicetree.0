From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4] media: spi: Add support for LMH0395
Date: Mon, 03 Nov 2014 15:42:09 +0200
Message-ID: <12414520.uxZUhSYI7c@avalon>
References: <1410342234-7444-1-git-send-email-jean-michel.hautbois@vodalys.com> <1630377.tEqlt7fWO7@avalon> <545784DA.50109@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545784DA.50109-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 03 November 2014 14:36:26 Hans Verkuil wrote:
> On 11/03/2014 02:13 PM, Laurent Pinchart wrote:
> > Hi Jean-Michel,
> > 
> > Thank you for the patch.
> 
> > On Wednesday 10 September 2014 11:43:54 Jean-Michel Hautbois wrote:
> <snip>
> 
> >> +static int lmh0395_s_routing(struct v4l2_subdev *sd, u32 input, u32
> >> output, +				u32 config)
> >> +{
> >> +	struct lmh0395_state *state = to_state(sd);
> >> +	int err = 0;
> >> +
> >> +	if (state->output_type != output)
> >> +		err = lmh0395_set_output_type(sd, output);
> >> +
> >> +	return err;
> >> 
> >         if (state->output_type == output)
> >                 return 0;
> >         
> >         return lmh0395_set_output_type(sd, output);
> > 
> > You can then get rid of the err variable.
> > 
> > I don't really like this implementation though, the output argument is
> > device- specific, you thus require explicit knowledge of the LMH0395 in
> > your bridge driver.
> 
> Well, that's the way s_routing is defined. It's the bridge driver's job to
> translate between V4L2 inputs/outputs and low-level routing information.
> 
> > I'm not sure what the config argument is used for, but naively I would
> > have
> 
> config is normally not used. There are one or two drivers that need it for
> additional routing configuration, but it's rare.

OK.

> > used it to tell whether to enable (1) or disable (0) the route from input
> > to output. The input value should then always be 0, and the output value
> > can be 1 or 2. Another option would be to use the new S_ROUTING userspace
> > ioctl I've proposed in
> > http://git.linuxtv.org/cgit.cgi/pinchartl/media.git/commit/?h=xilinx-wip&i
> > d=fc094c354338861673464ed4b8fa198089fe7bf0.
> > 
> > Hans, could you comment on that ?
> 
> Well, first of all your proposed API isn't merged yet, or even posted on the
> mailinglist, so it's a bit unfair to require someone else to use it :-)

It's not a requirement, just a proposal :-) I can send a patch series if 
there's enough interest for using that API.

> Also, while I do agree with your proposed new API I am a lot less
> enthusiastic about creating yet another duplicate pad op for an existing
> audio/video routing op.
> 
> The problem is that existing drivers are never updated for the new op and
> you are stuck with competing internal APIs. Not nice at all.

Agreed, it's not nice, feel free to propose a better solution :-)

> Bottom line is that this driver uses s_routing like any other driver
> currently in the kernel, so I have no problem with that.

I do :-)

The bridge to subdev dependency is fine for PCI or USB devices where the 
hardware topology is known to the driver. It isn't for composite embedded 
devices, as we don't want to teach all bridges about all subdevs.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
