From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [kernel PATCH] devicetree: document ARM bindings for QEMU's
 Firmware Config interface
Date: Fri, 28 Nov 2014 13:33:00 +0000
Message-ID: <20141128133300.GG25883@leverpostej>
References: <1417177604-21194-1-git-send-email-lersek@redhat.com>
 <4081425.dh6XptxTnn@wuerfel>
 <54787715.6030407@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54787715.6030407-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 28, 2014 at 01:22:29PM +0000, Laszlo Ersek wrote:
> On 11/28/14 13:59, Arnd Bergmann wrote:
> > On Friday 28 November 2014 13:26:44 Laszlo Ersek wrote:
> >> +Example:
> >> +
> >> +/ {
> >> +       #size-cells = <0x2>;
> >> +       #address-cells = <0x2>;
> >> +
> >> +       fw-cfg@9020000 {
> >> +               reg = <0x0 0x9020000 0x0 0x2 0x0 0x9020002 0x0 0x1>;
> >> +               compatible = "fw-cfg,mmio";
> >> +       };
> >> +};
> >>
> > 
> > "fw-cfg" is not a valid vendor string. Are you emulating an actual piece
> > of hardware here or is this something that comes from qemu?
> 
> It's a made up name.
> 
> > How about using "qemu,fwcfg" as the compatible string, and documenting
> > "qemu" as an official vendor string in Documentation/devicetree/bindings/vendor-prefixes.txt
> 
> I can do that, certainly, but I'm not sure if that implies other QEMU
> devices should follow suit.
> 
> For example, the virtio-mmio transports that qemu advertises have the
> "compatible" property "virtio,mmio". "virtio" is not a vendor prefix
> either (according to the above text file).

True, but it's a documented standard. It's obvious that 'virtio' has
something to do with the virtio standard, while it's not obvious that
'fw-cfg' as a prefix is for a qemu-specific device.

We should probably add 'virtio' as a vendor prefix.

> 
> Here's the full list of compatible strings from the generated DTB:
> 
>   compatible = "arm,cortex-a15";
>   compatible = "arm,armv7-timer";
>   compatible = "arm,cortex-a15-gic";
>   compatible = "arm,pl011", "arm,primecell";
>   compatible = "arm,pl031", "arm,primecell";
>   compatible = "arm,psci-0.2", "arm,psci";

All of these are emulated real devices or standards from ARM, so that
makes sense.

>   compatible = "cfi-flash";
>   compatible = "fixed-clock";

These are generic bindings, arguably they should have been 'linux,'
prefixed but it's too late now.

>   compatible = "fw-cfg,mmio";
>   compatible = "virtio,mmio";
>   compatible = "linux,dummy-virt";
> 
> According to
> <http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property>,
> "cfi-flash" and "fixed-clock" don't even have the correct format
> (there's no comma separating <manufacturer> from <model>).
> 
> > We don't normally list contiguous registers separately. Maybe just round
> > up to one page and make the register property
> > 
> > 	reg = <0x0 0x9020000 0x0 0x1000>;
> 
> The registers are not necessarily placed shoulder to shoulder (it's not
> a requirement in the QEMU source).

It might not be at the moment, but if no-one separates them it could be
a requirement for using this binding. Is there any benefit to having
them separated?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
