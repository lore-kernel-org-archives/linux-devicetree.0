From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 6/6] dt-bindings: Document the Rockchip RGA bindings
Date: Mon, 17 Jul 2017 05:21:53 +0300
Message-ID: <68196359.W3MbNaIOVC@avalon>
References: <1500101920-24039-1-git-send-email-jacob-chen@iotwrt.com> <1918615.rEp9U5BAbC@avalon> <1882912.vhlUDqklbZ@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1882912.vhlUDqklbZ@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Sunday 16 Jul 2017 18:07:58 Heiko Stuebner wrote:
> Am Samstag, 15. Juli 2017, 12:23:12 CEST schrieb Laurent Pinchart:
> > On Saturday 15 Jul 2017 14:58:40 Jacob Chen wrote:
> >> Add DT bindings documentation for Rockchip RGA
> >> 
> >> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> >> ---
> >> 
> >>  .../devicetree/bindings/media/rockchip-rga.txt     | 35 +++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>  create mode 100644
> >>  Documentation/devicetree/bindings/media/rockchip-rga.txt
> >> 
> >> diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.txt
> >> b/Documentation/devicetree/bindings/media/rockchip-rga.txt new file mode
> >> 100644
> >> index 0000000..966eba0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/rockchip-rga.txt
> >> @@ -0,0 +1,35 @@
> >> +device-tree bindings for rockchip 2D raster graphic acceleration
> >> controller (RGA)
> >> +
> >> +RGA is a separate 2D raster graphic acceleration unit. It accelerates
> >> 2D
> > 
> > "Separate" from what ? Do you mean "standalone" ?
> > 
> >> +graphics operations, such as point/line drawing, image scaling,
> >> rotation,
> >> +BitBLT, alpha blending and image blur/sharpness.
> >> +
> >> +Required properties:
> >> +- compatible: value should be one of the following
> >> +		"rockchip,rk3228-rga";
> >> +		"rockchip,rk3288-rga";
> >> +		"rockchip,rk3399-rga";
> > 
> > The driver in patch 2/6 has match entry for rk3328, which is missing from
> > this list.
> > 
> > As the implementation of the driver doesn't seem to discriminate between
> > the four SoCs, wouldn't it make sense to create a generic compatible
> > string on which the driver would match ? You can have both the generic
> > and SoC-specific compatible strings in DT if there are differences
> > between the IP core in those SoCs that might need to be handled later by
> > the driver.
> 
> I think the block is named something like RGA2 in some kernel trees, but
> am not sure if that is an actual name, or someone just added a number.
> From short glances at vendor rga-code in the past, it looks like there are
> currently 2 basic versions of the in existence I.e. older Rockchip socs
> (like the rk3188 or so) use something older.
> 
> I think everywhere else we do have only (or at least mostly) soc-specifc
> compatibles, but I guess that is more a question what Rob prefers.

Many SoC vendors use SoC-specific compatible string, often in addition to more 
generic ones. When a more generic compatible string is available, drivers can 
match against it, which avoid having to update drivers every time a new SoC 
integrates the same version of the IP core. The SoC-specific compatible string 
is still specified in DT, "just in case" we later realize that the IP core 
integrated in the SoC is slightly different than the other ones and requires 
specific handling in the driver.

I'm not completely happy with that scheme, as it's really a workaround for 
defective communication with the hardware team (or possibly defective hardware 
development...), but that's the best compromise we have so far.

> >> +- interrupts: RGA interrupt number.
> > 
> > This is an "interrupt specifier", not just an "interrupt number" (as you
> > can see in the example below there are three numbers)
> > 
> >> +
> >> +- clocks: phandle to RGA sclk/hclk/aclk clocks
> >> +
> >> +- clock-names: should be "aclk" "hclk" and "sclk"
> > 
> > Nitpicking, there should be a comma after "aclk".
> > 
> >> +
> >> +- resets: Must contain an entry for each entry in reset-names.
> >> +  See ../reset/reset.txt for details.
> >> +- reset-names: should be "core" "axi" and "ahb"
> > 
> > And a comma after "core".
> > 
> >> +
> >> +Example:
> >> +SoC specific DT entry:
> >
> > s/SoC specific/SoC-specific/
> > 
> >> +	rga: rga@ff680000 {
> >> +		compatible = "rockchip,rk3399-rga";
> >> +		reg = <0xff680000 0x10000>;
> >> +		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> >> +		interrupt-names = "rga";
> > 
> > The interrupt-names property is not described above. Do you really need it
> > ?
> >
> >> +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru
> >> SCLK_RGA_CORE>;
> >> +		clock-names = "aclk", "hclk", "sclk";
> >> +
> >> +		resets = <&cru SRST_RGA_CORE>, <&cru SRST_A_RGA>, <&cru
> >> SRST_H_RGA>;
> >> +		reset-names = "core, "axi", "ahb";
> >> +	};

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
