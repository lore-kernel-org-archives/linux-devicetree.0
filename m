From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Pin control mappings for DT
Date: Tue, 29 Nov 2011 09:55:18 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB12@HQMAIL01.nvidia.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus Walleij wrote at Tuesday, November 29, 2011 12:42 AM:
> can we have some initial idea about DT support for pin control
> devices and how these will look? Since pin control seems to be
> a cruicial piece for people to get board data out of their kernels
> we'd better have a common understanding.
> 
> The way I've understood it, we will need three pieces of
> DT data:
> 
> 1) Per-driver info, includes the pin controller base, its pins, their
>  (optional) names and their specific presets like bias etc.

I'm still planning on putting this all into the driver source code; I
don't really see any advantage of putting this almost static data into
DT just to parse it back out into the same tables that could be written
straight into the driver anyway. (only almost static rather than static
since we'll need new tables for each SoC)

> 2) Board pin group definitions, saying "these three pins
>   belong to the group "i2c0-pins"

I think this is part of (1), if present in the DT at all.

This is HW description data, rather than higher level data being added
for the purpose of more abstract pinctrl reasons. As such, it belongs in
the pinmux HW's node.

I don't think we should force this data to be in DT at all if the driver
includes the tables itself.

There's more to a pin group than just the list of pins it includes; on
Tegra20 at least, all muxing/configuration/... is at the pin group level
rather than the pin level, so each pin group needs register address,
some representation of which configuration options are valid for it, etc.
As such, any core DT binding specified would cover a limited subset of
the data that needs to be parsed.

That said, we could standardize on the way to list the set of pins in
each group, and even provide helper functions to enumerate the list of
groups and parse the pin list, so that drivers that wish to include this
information in their bindings can use it. But I still think the driver
should be responsible for obtaining the data however it sees fit, and
passing that to the pinctrl core using the existing APIs.

> 3) Board function mapping definitions saying "the pin group
>   'i2c0-pins' is to be used with device i2c0" which can map
>   several groups to a single device.

Yes, I see this as the domain of the core pinctrl DT bindings.

> (1) should be read out by each pin controller driver and
> (2)+(3) by the pin controller, specifically  pinmux core.
...

-- 
nvpublic
