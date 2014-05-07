From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 7 May 2014 14:01:20 -0400
Message-ID: <20140507180120.GG28159@titan.lakedaemon.net>
References: <536A697D.3020002@boundarydevices.com>
 <CAOesGMiHRQV+XngH4ABSeT8KDeP=iKn1ogvTA0j1BdyBwAaWSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMiHRQV+XngH4ABSeT8KDeP=iKn1ogvTA0j1BdyBwAaWSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Eric,

To add to what Olof said:

On Wed, May 07, 2014 at 10:24:46AM -0700, Olof Johansson wrote:
> Hi,
> 
> On Wed, May 7, 2014 at 10:12 AM, Eric Nelson
> <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> > Hi all,
> >
> > I suspect that this has been discussed previously, but I'm a
> > N00b to DT and Google hasn't helped identify a discussion
> > on the list.
> >
> > While getting my feet wet with DTS, I was quite surprised to
> > see that there's no support for making parts of DTS files
> > conditional on the kernel configuration.
> >
> > We often cost-optimize BOMs for our standard boards and omit
> > bits and pieces not needed for a particular build, and
> > it would be nice to surround optional components with
> > conditionals:
> >
> >     #ifdef CONFIG_BLAH
> >     #endif
> >
> > Please advise,
> 
> The DTS is independent on what drivers the kernel is actually
> enabling. It should focus on what is actually there on hardware, and
> not what is enabled in software.

I think what your looking for is handled by the dtsi/dts paradigm (yeah,
I hate that word, but it fits).  Take the kirkwood.dtsi file for
example.  It lists a bunch of nodes with status = 'disabled'.  The
individual boardfiles then enable the nodes they actually have on the
board.

Say your family of boards used the kirkwood SoC, you could create a
kirkwood-bounddev.dtsi, then a kirkwood-bounddev-boardA.dts and so on
for each board.

The .dtsi lists all the nodes your product family uses.  The .dts
enables only those found on boardA.

If you have a node common to all products (say uart0) you could enable
it in the .dtsi and skip mentioning it in all the .dts board files.

Does that help?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
