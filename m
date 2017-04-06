From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] [media] imx: assume MEDIA_ENT_F_ATV_DECODER entities
 output video on pad 1
Date: Thu, 06 Apr 2017 11:57:26 +0200
Message-ID: <1491472646.2392.23.camel@pengutronix.de>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
         <1490661656-10318-20-git-send-email-steve_longerbeam@mentor.com>
         <1490894749.2404.33.camel@pengutronix.de>
         <20170404231053.GE7909@n2100.armlinux.org.uk>
         <19f0ce92-cad6-8950-8018-e3224e2bf266@gmail.com>
         <7235285c-f39a-64bc-195a-11cfde9e67c5@gmail.com>
         <20170405082134.GF7909@n2100.armlinux.org.uk>
         <1491384859.2381.51.camel@pengutronix.de>
         <20170405115336.7135e542@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405115336.7135e542-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-04-05 at 11:53 -0300, Mauro Carvalho Chehab wrote:
[...]
> There are a number of drivers that can work with different
> types of TV demodulators. Typical examples of such hardware can be
> found at em28xx, saa7134, cx88 drivers (among lots of other drivers).
> Those drivers don't use the subdev API. Instead, they use a generic
> helper function with sets the pipelines, based on the pad number.
> 
> The problem here is that, currently, both MC API and MC core
> lacks a way to identify PAD ports per type, as the only information
> that a bridge driver has is a pad number. So, in order for a
> generic helper function to work, we had to hardcode pad numbers,
> in a way that it would work for all possible types of demods.
> 
> It shouldn't be hard to add a "pad_type" information at media_pad
> struct, but passing such info to userspace requires a new API
> (we're calling it as "properties API"). Sakari was meant to send
> us an updated RFC for it[1] with a patchset, back in 2015, but
> this never happened.
> 
> [1] https://linuxtv.org/news.php?entry=2015-08-17.mchehab
[...]

That would be most useful.

> So, in short, the tvp5150 demod doesn't decode audio, but there
> are other demods that do it.
> 
> In the case of VBI, tvp5150 has actually two ways of reporting
> it:
> 
> 1) via YOUT[7:0] pins. VBI information is transmitted as a
>    set of raw samples, via an ancillary data block, during
>    vertical/horizontal blanking intervals. So, yes, it shares
>    the same hardware output, although the VBI contents are
>    actually multiplexed there. Please notice that not all
>    video out PADS encapsulate raw VBI the same way as tvp5150
>    (and some devices even don't support raw VBI, like saa7110 and
>    some models supported by saa7115 driver).

This is the physical interface that corresponds to the output port
(should be port@1) in the device tree. It should correspond to the video
output media entity pad.
What is unclear to is me whether the VBI media entity pad also should
correspond to the same physical interface / DT port.

> 2) via an interrupt that indicates that it decoded VBI data. The
>    VBI information itself is there on FIFO, accessible via a set of
>    registers (see "VBI Data processor" chapter at the datasheet).
>
> Currently, the driver doesn't support (2), because, at the time
> I wrote the driver, I didn't find a way to read the interrupts generated
> by tvp5150 at em28xx[1], due to the lack of em28xx documentation,
> but adding support for it shoudn't be hard. I may eventually do it
> when I have some time to play with my ISEE hardware.
> 
> So, in the case of tvp5150 hardware, have those PADS:
> 
> - Input baseband;
> - Video + raw VBI output;
> - sliced VBI output.

This DEMOD_PAD_VBI_OUT, does it correspond to 1) or 2) above?

> Yet, we need an always unconnected audio output, in order to support
> different demods out there.

Are you saying we have to keep pad[DEMOD_PAD_AUDIO_OUT] in tvp5150 even
though it doesn't exist because the framework can't cope with an
audio-less ATV_DECODER that only has three pads?

> [1] tvp5150 was written to support some em28xx-based devices
> 
> > 
> > > So, it has one input and three outputs.  How does marking the direction
> > > in the port node (which would indicate that there was a data flow out of
> > > TVP5150 into the iMX6 capture) help identify which of those pads should
> > > be used?
> > >
> > > It would eliminate the input pad, but you still have three output pads
> > > to choose from.
> > > 
> > > So no, your idea can't work.  
> > 
> > In this case, removal of the VBI and audio pads might make this work,
> > but in general this is true. In my opinion, to make this truly generic,
> > we need an interface to ask the driver which media entity pad a given
> > device tree port corresponds to, as there might not even be a single
> > media entity corresponding to all ports for more complex devices.
> 
> Yes. We also need something like that at the userspace API.

thanks
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
