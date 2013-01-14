From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: PMU node location
Date: Mon, 14 Jan 2013 09:18:34 +0000
Message-ID: <20130114091834.GK19765@e106331-lin.cambridge.arm.com>
References: <50EEC672.5050405@monstr.eu>
 <50F18742.5070501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50F18742.5070501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2013 at 03:54:42PM +0000, Rob Herring wrote:
> On 01/10/2013 07:47 AM, Michal Simek wrote:
> > Hi Rob, Mark, Grant and others,
> > 
> > I want to check with you the location of ARM pmu node
> > I see that
> > 1) highbank and dbx5x0 have it in soc node
> > 
> > 2) vexpress and tegra have no main bus and pmu is in root like all
> > others devices.
> > (Any reason no to have main bus? Does it mean that there is no bus or
> > that all
> > devices are accessible?)
> 
> That seems really wrong in general. Any memory mapped device is on a bus
> of some kind. I'm not sure the reasoning. Perhaps Stephen can explain.
> 
> > 3) omap2/omap3 have added pmu node to root node(mailing list)
> > 
> > 4) Just for completeness no platform has it in the bus.
> > 
> > 
> > That's why I have obvious question what it is proper location for pmu node?
> 
> Obviously, highbank is the true and correct way. ;)
> 
> The pmu is part of the cpu, so it could be part of /cpus. That may cause
> problems having non-cpu nodes and it would not get probed (although
> technically that is a Linux problem and should not influence the DT).

If we were going to allow cpu nodes in /cpus, I'd rather we supported a pmu
node in each /cpus/cpuN node. That way the description of heterogeneous
clusters would be intuitive (each pmu node representing a single cpu-affine
unit rather than the collection of all cpu-affine units). That way describing
heterogeneous clusters would become intuitive (cpu affinity would be implicit,
and wouldn't have to be described separately as with my proposed binding [1]).

and I'm not sure how you'd handle PMUs which used the same PPI

> Since it is not on a bus, then putting it at the top level probably
> makes more sense than on a bus.

Agreed. I think this makes the most sense.

> 
> Rob
> 
> > 
> > Thanks,
> > Michal
> > 
> 

Thanks,
Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/137290.html
