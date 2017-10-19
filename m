From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problem with commit to add overlay symbols to live device tree
Date: Thu, 19 Oct 2017 12:53:01 -0700
Message-ID: <59E9029D.1030700@gmail.com>
References: <85c5a40bb6eb4d4ebe522b3034528a36@infineon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <85c5a40bb6eb4d4ebe522b3034528a36-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org, frank.rowand-7U/KSKJipcs@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On 10/19/17 10:06, Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org wrote:
> Hi Frank, Rob,
> 
> I ran some tests with kernel v4.14-rc2, where I came across an issue
> with your commit "of: overlay: add overlay symbols to live device
> tree" (d1651b03c2df75db8eda3fbcd3a07adb337ee8b0,
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/of?h=v4.14-rc5&id=d1651b03c2df75db8eda3fbcd3a07adb337ee8b0).
> I am not sure whether this is a problem with your change or whether I
> made a mistake somewhere.
> 
> Without this commit, the following device tree overlay works fine on
> a Raspberry Pi:
> 
> /dts-v1/;
> /plugin/;
> 
> / {
> 	fragment@0 {
> 		target-path = "/soc/spi@7e204000";
> 		__overlay__ {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 			status = "okay";
> 
> 		        spidev1: spi@1 {
> 				compatible = "spidev";
> 				reg = <1>;
> 				spi-max-frequency = <5000000>;
> 			};
> 		};
> 	};
> };
> 
> But with the commit, it is rejected:
> 
> OF: overlay: no symbols in root of device tree.
> OF: overlay: of_build_overlay_info() failed for tree@/
> create_overlay: Failed to create overlay (err=-22)
> 
> Only if I remove the spidev1 label, it continues to work with the
> commit (but this is not always possible in more complex overlays).
> 
> I hope this does not make a difference, but I use the configfs
> interface to load the overlay, that is not part of mainline, but
> shipped by several distributions nonetheless (for example in the
> Raspberry Pi kernel,
> https://github.com/raspberrypi/linux/commit/cccc24635da69799335566eb464a4c9e1fb4a8ad).
>
>
> Could you tell me whether this change in behavior is intentional and
> whether I have to fix something in my usage?

Yes, the change is intentional.

If you are using overlays, the expectation is that the device tree
that was used to boot contains symbols (the paths of nodes that
have phandles) so that phandle references in the overlay can be
fixed up to match the values in the base devicetree.  Symbols
will be added to the device tree if if is compiled with the
"@" option.  This is the first method to avoid the overlay
load error.

If you compile the overlay with the "@" option then symbols
will be added to the overlay DTB.  Previous to commit
d1651b03c2df, these symbols would be ignored when an overlay
was loaded.  If you remove the "@" from the compile of
overlays, then everything should work the same way it did
before the commit.  This is the second way to avoid the
load overlay error.


> Thanks
> Alexander
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
