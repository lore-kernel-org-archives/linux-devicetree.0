From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: PMU node location
Date: Mon, 14 Jan 2013 10:11:29 +0000
Message-ID: <20130114101129.GB7990@e106331-lin.cambridge.arm.com>
References: <50EEC672.5050405@monstr.eu> <50F18742.5070501@gmail.com>
 <20130114091834.GK19765@e106331-lin.cambridge.arm.com>
 <CAHTX3dLm-LQzPfbRvaPMbOeTg72pBCy2+KqsnftLJKpgFskW9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAHTX3dLm-LQzPfbRvaPMbOeTg72pBCy2+KqsnftLJKpgFskW9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2013 at 09:36:10AM +0000, Michal Simek wrote:
> 2013/1/14 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> > On Sat, Jan 12, 2013 at 03:54:42PM +0000, Rob Herring wrote:
> >> On 01/10/2013 07:47 AM, Michal Simek wrote:
> >> > Hi Rob, Mark, Grant and others,
> >> >
> >> > I want to check with you the location of ARM pmu node
> >> > I see that
> >> > 1) highbank and dbx5x0 have it in soc node
> >> >
> >> > 2) vexpress and tegra have no main bus and pmu is in root like all
> >> > others devices.
> >> > (Any reason no to have main bus? Does it mean that there is no bus or
> >> > that all
> >> > devices are accessible?)
> >>
> >> That seems really wrong in general. Any memory mapped device is on a bus
> >> of some kind. I'm not sure the reasoning. Perhaps Stephen can explain.
> >>
> >> > 3) omap2/omap3 have added pmu node to root node(mailing list)
> >> >
> >> > 4) Just for completeness no platform has it in the bus.
> >> >
> >> >
> >> > That's why I have obvious question what it is proper location for pmu node?
> >>
> >> Obviously, highbank is the true and correct way. ;)
> >>
> >> The pmu is part of the cpu, so it could be part of /cpus. That may cause
> >> problems having non-cpu nodes and it would not get probed (although
> >> technically that is a Linux problem and should not influence the DT).
> >
> > If we were going to allow cpu nodes in /cpus, I'd rather we supported a pmu
> > node in each /cpus/cpuN node. That way the description of heterogeneous
> > clusters would be intuitive (each pmu node representing a single cpu-affine
> > unit rather than the collection of all cpu-affine units). That way describing
> > heterogeneous clusters would become intuitive (cpu affinity would be implicit,
> > and wouldn't have to be described separately as with my proposed binding [1]).
> >
> > and I'm not sure how you'd handle PMUs which used the same PPI
> 
> This is the same as is done with mpcore private timers which uses the same
> PPI. Based on gic binding it is solved by 3rd cell (flags) "bits[15:8]
> PPI interrupt cpu mask"

What I meant was that for PPIs, you have to use the percpu_irq functions,
requesting each PPI irq once globally, then enabling it on a subset of all
cores. You have to be very careful to ensure you don't attempt to request the
same PPI twice.  For example you might have different PPIs in different
clusters, and you have no guarantee that the nodes sharing the same PPI are
grouped together in any consistent order. Ensuring that you've dealt with all
nodes and not double-requested an irq is going to get messy.

> This also open one more question for me because we have mpcore timers
> on the bus but they are in mpcore. They should be also moved to /cpu/cpuN node.

If we're doing this it'd probably be good to have some common framework with
the PMU code for handling both cpu-affine description and global description in
the root of the tree. We have to be careful to ensure we don't break current
device trees.

> 
> 		ps7_scutimer_0: ps7-scutimer@f8f00600 {
> 			compatible = "xlnx,ps7-scutimer-1.00.a", "arm,cortex-a9-twd-timer";
> 			interrupt-parent = <&ps7_scugic_0>;
> 			interrupts = <1 13 0x0301>;
> 			reg = < 0xf8f00600 0x20 >;
> 		} ;
> 
> 
> btw: what is the main reason for Soc node name? Because of
> highbank.dts includes ecx-common.dtsi
> where soc is used as bus.
> 
> Thanks,
> Michal
> 
> 
> -- 
> Michal Simek, Ing. (M.Eng)
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
> Maintainer of Linux kernel - Xilinx Zynq ARM architecture
> Microblaze U-BOOT custodian
> 

Thanks,
Mark.
