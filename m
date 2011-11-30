From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Pin control mappings for DT
Date: Wed, 30 Nov 2011 14:35:44 +0100
Message-ID: <CACRpkdb=dMWhyXv1g9-8jrF3kdqe1kM+fhbJy8kRO5BSR_GBvg@mail.gmail.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB12@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB12-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2011 at 6:55 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Linus Walleij wrote at Tuesday, November 29, 2011 12:42 AM:

>> 1) Per-driver info, includes the pin controller base, its pins, their
>> =A0(optional) names and their specific presets like bias etc.
>
> I'm still planning on putting this all into the driver source code; I
> don't really see any advantage of putting this almost static data into
> DT just to parse it back out into the same tables that could be written
> straight into the driver anyway. (only almost static rather than static
> since we'll need new tables for each SoC)

I think OMAP already have a few different SoCs using the same
pinmux HW block, so for them it makes more sense.

Maybe when you have your Tegra 7 chips using the same
controller as Tegra { 3, 4, 5, 6 } with yet another pin list
it will make sense :-)

Besides - doing it one way does not exclude the other.

If the tables gets large I will have Torvalds on my tail for
putting nonsensical lists into the kernel that'd better been
kept outside it.

Yours,
Linus Walleij
