From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Pin control mappings for DT
Date: Thu, 1 Dec 2011 13:20:45 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDB02DE@HQMAIL01.nvidia.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
 <20111129195937.GO13928@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFE9E@HQMAIL01.nvidia.com>
 <20111130193410.GW13928@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111130193410.GW13928-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Tony Lindgren wrote at Wednesday, November 30, 2011 12:34 PM:
> * Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [111130 09:41]:
> > Tony Lindgren wrote at Tuesday, November 29, 2011 1:00 PM:
> > > * Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [111129 09:27]:
> > >
> > > I don't think so. The pinmux controller needs to know the available functions.
> > > But the functions selected for each driver are board/machine specific.
> >
> > That's certainly true.
> >
> > However, in my opinion just because the actual usage of the pinmux is
> > board-/machine-specific, that doesn't determine whether the description
> > of that usage has to be stored in the DT node of the devices that are
> > affected by the pinmux, or in some centralized table.
> 
> Yes well both should work. I guess as long as the serial driver can
> do pinmux_get(dev, NULL) the driver stays arch independent.
> 
> > There are two components to the data:
> >
> > 1) The definition of what the pinmux HW can do.
> >
> > There shouldn't be any combinations here.
> 
> But there are..

As I was trying to point out, I think what you're talking about as
"combinations" is something totally different to what I was talking
about.

I was talking about pins combining to create busses, something which can
get pretty exponential within a single SoC.

I think you're talking about different SoCs having different sets of
pins, groups, functions, etc.

For a given SoC (die + package option), there is a single table of all
known pins, groups, and functions. No combinations.

Now it may well be that you have a family of SoCs that have many
similarities between their sets if pins/groups/functions (or subsets
thereof) and I guess that's why you were talking about combinations?
But, IIRC, that's unrelated to the points I was making.

> > This data should simply list for each pin what the valid mux options are.
> > (or for each pin group if mux registers control n pins at a time as on
> > Tegra)
> 
> ..and we already have four completely different function tables and five
> subsets/incremental changes for the same IP block for omap2/3/4.

Well, sure, you have much different HW.

But the pinctrl core should only receive the 1 specific complete set of
pins/groups/functions for the particular SoC that the code is running
on.

Anything to do with constructing that list or representing it in device
tree is something implementation detail for the individual pinctrl driver.

If you have the tables in code, you can presumably merge them together
while implementing the pinctrl subsystem's callbacks. If you have the
tables in device tree, you can presumably merge them together when running
dtc, using /include/ statements from the SoC *.dtsi file.

-- 
nvpublic
