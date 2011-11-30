From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Pin control mappings for DT
Date: Wed, 30 Nov 2011 09:45:38 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFE75@HQMAIL01.nvidia.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
 <20111129195937.GO13928@atomide.com>
 <CACRpkdYY0Am52m2Lss+_wxnxXA9nHiGJ2TTdXymAPk=g4Zg+Jw@mail.gmail.com>
 <20111130165415.GR13928@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111130165415.GR13928-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
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
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Tony Lindgren wrote at Wednesday, November 30, 2011 9:54 AM:
> * Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111130 06:39]:
> > On Tue, Nov 29, 2011 at 8:59 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
...
> Just to give some idea of the scope of problem it solves, we already
> have static data for 9 packages in arch/arm/mach-omap2/mux*4*.c with
> omap3 three alone having 4 packages.. Even with that being incremental
> data that's marked __initdata, it's still not a scalable way of doing
> things as there will be more and more packages.

Are these purely packaging options for the same silicon, such that any
pin ID in the pinmux controller always represents the same pad on the
die, it's just that some may not actually be bonded out to actual pins
or balls on the package (or some mux functions might select controllers
that are "not present" in the die)? Or, is this the same IP block used
in multiple SoCs, where the use of each pin ID in the pinmux controller,
and the meaning of each mux function value for each pin ID, are actually
hooked up to different logical functions within the SoC?

For the former case (pure bonding options), the pinctrl documentation
recommends having the pinctrl driver expose the die pads, rather than
the package pins/balls. That way, there's a pinctrl single data set that
works across all the n package variations. The only issue here is that
when constructing the pinctrl mapping table, you need to only actually
use pins/functions that are valid for the particular SoC you know you're
using, but that's true anyway irrespective of whether the pinctrl driver
actually defines the unusable options or not.

Tegra20 is in the same situation; there are at least 2 packaging options
for it. The Tegra20 pinctrl driver has been written with 1 dataset
representing what's on the die, rather than 2 datasets fully representing
which subsets actually make it out to the package.

-- 
nvpublic
