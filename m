From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [ANN] Meeting minutes of the Cambourne meeting
Date: Tue, 30 Aug 2011 14:41:48 +0100
Message-ID: <20110830134148.GA14976@sirena.org.uk>
References: <201107261647.19235.laurent.pinchart@ideasonboard.com>
	<201108081750.07000.laurent.pinchart@ideasonboard.com>
	<4E5A2657.7030605@gmail.com>
	<201108291508.59649.laurent.pinchart@ideasonboard.com>
	<Pine.LNX.4.64.1108300018490.5065@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1108300018490.5065-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <snjw23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-2TTamOfO6J3ta4EC/59zMBl4MBrZKKet0E9HWUfgJXw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tuukka Toivonen <tuukka.toivonen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2011 at 12:20:09AM +0200, Guennadi Liakhovetski wrote:
> On Mon, 29 Aug 2011, Laurent Pinchart wrote:

> > My idea was to let the kernel register all devices based on the DT or board 
> > code. When the V4L2 host/bridge driver gets registered, it will then call a 
> > V4L2 core function with a list of subdevs it needs. The V4L2 core would store 
> > that information and react to bus notifier events to notify the V4L2 
> > host/bridge driver when all subdevs are present. At that point the host/bridge 
> > driver will get hold of all the subdevs and call (probably through the V4L2 
> > core) their .registered operation. That's where the subdevs will get access to 
> > their clock using clk_get().

> Correct me, if I'm wrong, but this seems to be the case of sensor (and 
> other i2c-client) drivers having to succeed their probe() methods without 
> being able to actually access the hardware?

The events should only be generated after the probe() has succeeded so
if the driver talks to the hardware then it can fail probe() if need be.
