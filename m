From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PMU node location
Date: Sat, 12 Jan 2013 09:54:42 -0600
Message-ID: <50F18742.5070501@gmail.com>
References: <50EEC672.5050405@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50EEC672.5050405-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
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
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/10/2013 07:47 AM, Michal Simek wrote:
> Hi Rob, Mark, Grant and others,
> 
> I want to check with you the location of ARM pmu node
> I see that
> 1) highbank and dbx5x0 have it in soc node
> 
> 2) vexpress and tegra have no main bus and pmu is in root like all
> others devices.
> (Any reason no to have main bus? Does it mean that there is no bus or
> that all
> devices are accessible?)

That seems really wrong in general. Any memory mapped device is on a bus
of some kind. I'm not sure the reasoning. Perhaps Stephen can explain.

> 3) omap2/omap3 have added pmu node to root node(mailing list)
> 
> 4) Just for completeness no platform has it in the bus.
> 
> 
> That's why I have obvious question what it is proper location for pmu node?

Obviously, highbank is the true and correct way. ;)

The pmu is part of the cpu, so it could be part of /cpus. That may cause
problems having non-cpu nodes and it would not get probed (although
technically that is a Linux problem and should not influence the DT).
Since it is not on a bus, then putting it at the top level probably
makes more sense than on a bus.

Rob

> 
> Thanks,
> Michal
> 
