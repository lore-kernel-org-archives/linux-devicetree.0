From: <Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>
Subject: RE: Problem with commit to add overlay symbols to live device tree
Date: Thu, 9 Nov 2017 17:09:01 +0000
Message-ID: <c4deba835169411ea2645c27c734dd31@infineon.com>
References: <85c5a40bb6eb4d4ebe522b3034528a36@infineon.com>
 <59E9029D.1030700@gmail.com> <d0bd4312e9314c8ba6c56d800d07c0a9@infineon.com>
 <59EA6348.5020205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59EA6348.5020205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frank.rowand-7U/KSKJipcs@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On 10/20/17 05:11, Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org wrote:
> >> Hi Alexander,
> >>
> >> On 10/19/17 10:06, Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org wrote:
> >>> Hi Frank, Rob,
> >>>
> >>> I ran some tests with kernel v4.14-rc2, where I came across an issue
> >>> with your commit "of: overlay: add overlay symbols to live device
> >>> tree" (d1651b03c2df75db8eda3fbcd3a07adb337ee8b0,
> >>>
> >>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/d
> >> rivers/of?h=3Dv4.14-
> rc5&id=3Dd1651b03c2df75db8eda3fbcd3a07adb337ee8b0).
> >>> I am not sure whether this is a problem with your change or whether I
> >>> made a mistake somewhere.
> >>>
> >>> Without this commit, the following device tree overlay works fine on
> >>> a Raspberry Pi:
> >>>
> >>> /dts-v1/;
> >>> /plugin/;
> >>>
> >>> / {
> >>> 	fragment@0 {
> >>> 		target-path =3D "/soc/spi@7e204000";
> >>> 		__overlay__ {
> >>> 			#address-cells =3D <1>;
> >>> 			#size-cells =3D <0>;
> >>> 			status =3D "okay";
> >>>
> >>> 		        spidev1: spi@1 {
> >>> 				compatible =3D "spidev";
> >>> 				reg =3D <1>;
> >>> 				spi-max-frequency =3D <5000000>;
> >>> 			};
> >>> 		};
> >>> 	};
> >>> };
> >>>
> >>> But with the commit, it is rejected:
> >>>
> >>> OF: overlay: no symbols in root of device tree.
> >>> OF: overlay: of_build_overlay_info() failed for tree@/
> >>> create_overlay: Failed to create overlay (err=3D-22)
> >>>
> >>> Only if I remove the spidev1 label, it continues to work with the
> >>> commit (but this is not always possible in more complex overlays).
> >>>
> >>> I hope this does not make a difference, but I use the configfs
> >>> interface to load the overlay, that is not part of mainline, but
> >>> shipped by several distributions nonetheless (for example in the
> >>> Raspberry Pi kernel,
> >>>
> >>
> https://github.com/raspberrypi/linux/commit/cccc24635da69799335566eb46
> >> 4a4c9e1fb4a8ad).
> >>>
> >>>
> >>> Could you tell me whether this change in behavior is intentional and
> >>> whether I have to fix something in my usage?
> >>
> >> Yes, the change is intentional.
> >>
> >> If you are using overlays, the expectation is that the device tree
> >> that was used to boot contains symbols (the paths of nodes that
> >> have phandles) so that phandle references in the overlay can be
> >> fixed up to match the values in the base devicetree.  Symbols
> >> will be added to the device tree if if is compiled with the
> >> "@" option.  This is the first method to avoid the overlay
> >> load error.
> >
> > Ah, thanks, this does solve the problem. I use nothing special to
> > generate the base devicetree, just "make dtbs". Would it make sense
> > to add the "@" option to the kernel Makefile, so that symbols are
> > added by default? Or does this have any downside? I'd suspect that
>=20
> Yes, there is a large downside.  Compiling with the "@" option will
> increase the size of the DTB.  Most boards will not use overlays,
> and in those cases this overhead has no value.  So "@" should be
> opt-in, not default.

I see. Is there a way (a config option maybe?) that I can use to get this b=
ehavior without patching the Makefile?

> > many more people will be hit by this change, since most tutorials for
> > overlays that I have seen include the "@" option for the dtc calls.>
> >> If you compile the overlay with the "@" option then symbols
> >> will be added to the overlay DTB.  Previous to commit
> >> d1651b03c2df, these symbols would be ignored when an overlay
> >> was loaded.  If you remove the "@" from the compile of
> >> overlays, then everything should work the same way it did
> >> before the commit.  This is the second way to avoid the
> >> load overlay error.

Do I understand that correctly, that when I remove the "@" option from the =
dtc calls, the same call should work both with an old (pre-d1651b03c2df) an=
d a new kernel? If the old kernel just ignored the symbols, they were not u=
sed for anything, so it should not matter whether they were contained in th=
e overlay DTB or not, right?

> >>
> >>
> >>> Thanks
> >>> Alexander
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> >>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
