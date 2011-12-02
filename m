From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Pin control mappings for DT
Date: Fri, 2 Dec 2011 11:31:57 +0100
Message-ID: <CACRpkdYL8tzwrdkeuGFWsL=NC5wPqGrhrx093VevyanqUq+QkQ@mail.gmail.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
 <20111129195937.GO13928@atomide.com>
 <CACRpkdYY0Am52m2Lss+_wxnxXA9nHiGJ2TTdXymAPk=g4Zg+Jw@mail.gmail.com>
 <20111130165415.GR13928@atomide.com>
 <CACRpkdayqNgmOQAG+Kr_xPX8aeKghmeoDdaR4mK0N3U1CcYt-A@mail.gmail.com>
 <20111201222202.GG13928@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111201222202.GG13928-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
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

On Thu, Dec 1, 2011 at 11:22 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:

> But how does the second pinmux driver instance know if it's OK
> to add to the mapping or not? The mapping exists, but it might be
> also from the previous time you loaded the pinmux driver..

The mappings are not added from pinmux drivers, atleast not
the in-tree drivers. Mappings are board data.

The existing U300 driver only defines it's pins and groups
(and these are indeed per-device)

The map is defined by arch/arm/mach-u300/core.c
and registered when that MACHINE_TYPE is registered.

So that's why I say it's like the clkdev maps.

>> That the mapping is for all devices doesn't stop you from
>> loading and unloading pinmux drivers as much as you
>> want, we already handle that (well there may be bugs in the
>> code since it's not deployed on any system adding/removing
>> controllers, but the idea sure is there...) =A0if you're only
>> using hogs and no pinmux_get() from elsewhere on it,
>> it will even work in practice :-)
>
> Well if there are dynamic maps, we still need to release
> the maps also.

Hm I think I'm not grasping the concept of dynamic maps
simply.

The current maps are dynamic in the sense that they are
registered by the board files, and can also be (with
the recent patches) additively added, say if the SoC
has one big chunk of common mappings and smaller
chunks of per-board mappings (implemented for PXA).

> How about we pass the static map in platform_data to the pinmux
> driver in question, then have the pinmux driver set it up with
> pinctrl fwk as per-pinctrl map.

That would be a refactoring making it more like how
regulators pass their consumer lists, but it's not
fixing something that is broken IMO.

> This would remove the need for the global map. This would
> also allow making the pinctrl fwk into loadable modules
> in some cases.

The drivers are loadable today, but why should the pinctrl
*framework* be a loadable module? Regulators and
clocks are bool I don't see why the pinctrl core should
be any different?

Yours,
Linus Walleij
