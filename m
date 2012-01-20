From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Pinmux bindings proposal
Date: Fri, 20 Jan 2012 12:28:55 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB445@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC6057885091DEA@039-SN2MPN1-013.039d.mgd.msft.net>
 <20120117082334.GA31295@S2101-09.ap.freescale.net>
 <7FE21149F4667147B645348EC6057885092D56@039-SN2MPN1-013.039d.mgd.msft.net>
 <74CDBE0F657A3D45AFBB94109FB122FF17801D22F5@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC6057885095125@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <7FE21149F4667147B645348EC6057885095125-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
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
To: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dong Aisheng wrote at Wednesday, January 18, 2012 4:06 AM:
> Stephen Warren wrote at Wednesday, January 18, 2012 3:29 AM:
> > Dong Aisheng wrote at Tuesday, January 17, 2012 2:47 AM:
> > > Shawn Guo wrote at Tuesday, January 17, 2012 4:24 PM:
> > > > On Mon, Jan 16, 2012 at 12:50:02PM +0000, Dong Aisheng-B29396 wrote:
> > > > > Stephen Warren wrote:
...
> Now i'm still thinking if the mux way we discussed here fits IMX.
> For example:
>
> > 	pinmux_sdhci: pinmux-sdhci {
> > 		mux =
> > 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_MUX_1>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_MUX_1>;
> > 	};
>
> It may work well for Tegra.
> When pinctrl core parsing the mux proterty, it will creat each maps
> For each entry in the list.
> But for IMX like:
>
> > > 	pinmux_usdhc1: pinmux-usdhc1 {
> > > 		mux = <IMX6Q_PAD_SD1_DAT1 0>
> > > 		      <IMX6Q_PAD_SD1_DAT2 0>
> > > 		      ...
> > > 	};
>
> Each entry in the list is PIN rather than group.
> So we cannot create each map for each entry in the list except we treat the PIN as
> A group(this will cause a huge maps and predefined groups and functions).

Linusw has NAKd the idea that we should not use these "virtual groups",
i.e. he believes they're fine to use if you wish.

Given that, I think what you should do is:

* Your pinctrl driver should enumerate whatever kind of groups it wishes.

* Use the same sets of groups for both board-based and DT-based systems
  (well, that's true irrespective of anything else)

* The mux properties above would not refer to pins, but whatever muxable
  entities your pinctrl driver exposes.

  For Tegra20, I'll use the raw HW pin groups.

  For Tegra30, I'll use raw HW pins here, since each pin is individually
  muxable. In the pinctrl driver, pin IDs and these mux group IDs will
  be equivalent, since there will be 1 group per pin.

  For IMX, you can use "virtual group" IDs in the DT properties.

> A little different way I'm thinking now is cover the mux difference(pin or group)
> between Tegra and IMX in Pinctrl driver, then we may not need the second mux value
> (e.g: TEGRA_PMX_MUX_1)in the standard mux property:
> The mux property can become:
>
> pinmux_sdhci: pinmux-sdhci {
> 	mux =
> 		<&tegra_pmx TEGRA_PMX_PG_DTA_X>
> 		<&tegra_pmx TEGRA_PMX_PG_DTD_Y>;
> };

I definitely don't like putting the group ID and mux function into a
single value; this seems redundant.

However, since I'm leaning towards it being up to the individual pinctrl
driver to convert the DT property values into the group/function values
that the pinctrl core uses, you are free to define your binding however
you wish.

-- 
nvpublic
