From: <Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>
Subject: RE: Problem with commit to add overlay symbols to live device tree
Date: Mon, 13 Nov 2017 12:11:40 +0000
Message-ID: <5a3447ded9eb407989b5af4cc2ad4aab@infineon.com>
References: <85c5a40bb6eb4d4ebe522b3034528a36@infineon.com>
 <59E9029D.1030700@gmail.com> <d0bd4312e9314c8ba6c56d800d07c0a9@infineon.com>
 <59EA6348.5020205@gmail.com> <c4deba835169411ea2645c27c734dd31@infineon.com>
 <a444bccd-1d42-44b9-398c-095fb4fb9055@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a444bccd-1d42-44b9-398c-095fb4fb9055-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frank.rowand-7U/KSKJipcs@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On 11/09/17 09:09, Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org wrote:
> >> On 10/20/17 05:11, Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org wrote:
> >>>> Hi Alexander,
> >>>>
> >>>> On 10/19/17 10:06, Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org wrote:
> >>>>> Hi Frank, Rob,
> >>>>>
> >>>>> I ran some tests with kernel v4.14-rc2, where I came across an issu=
e
> >>>>> with your commit "of: overlay: add overlay symbols to live device
> >>>>> tree" (d1651b03c2df75db8eda3fbcd3a07adb337ee8b0,
> >>>>>
> >>>>
> >>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/d
> >>>> rivers/of?h=3Dv4.14-
> >> rc5&id=3Dd1651b03c2df75db8eda3fbcd3a07adb337ee8b0).
> >>>>> I am not sure whether this is a problem with your change or whether=
 I
> >>>>> made a mistake somewhere.
> >>>>>
> >>>>> Without this commit, the following device tree overlay works fine o=
n
> >>>>> a Raspberry Pi:
> >>>>>
> >>>>> /dts-v1/;
> >>>>> /plugin/;
> >>>>>
> >>>>> / {
> >>>>> 	fragment@0 {
> >>>>> 		target-path =3D "/soc/spi@7e204000";
> >>>>> 		__overlay__ {
> >>>>> 			#address-cells =3D <1>;
> >>>>> 			#size-cells =3D <0>;
> >>>>> 			status =3D "okay";
> >>>>>
> >>>>> 		        spidev1: spi@1 {
> >>>>> 				compatible =3D "spidev";
> >>>>> 				reg =3D <1>;
> >>>>> 				spi-max-frequency =3D <5000000>;
> >>>>> 			};
> >>>>> 		};
> >>>>> 	};
> >>>>> };
> >>>>>
> >>>>> But with the commit, it is rejected:
> >>>>>
> >>>>> OF: overlay: no symbols in root of device tree.
> >>>>> OF: overlay: of_build_overlay_info() failed for tree@/
> >>>>> create_overlay: Failed to create overlay (err=3D-22)
> >>>>>
> >>>>> Only if I remove the spidev1 label, it continues to work with the
> >>>>> commit (but this is not always possible in more complex overlays).
> >>>>>
> >>>>> I hope this does not make a difference, but I use the configfs
> >>>>> interface to load the overlay, that is not part of mainline, but
> >>>>> shipped by several distributions nonetheless (for example in the
> >>>>> Raspberry Pi kernel,
> >>>>>
> >>>>
> >>
> https://github.com/raspberrypi/linux/commit/cccc24635da69799335566eb46
> >>>> 4a4c9e1fb4a8ad).
> >>>>>
> >>>>>
> >>>>> Could you tell me whether this change in behavior is intentional an=
d
> >>>>> whether I have to fix something in my usage?
> >>>>
> >>>> Yes, the change is intentional.
> >>>>
> >>>> If you are using overlays, the expectation is that the device tree
> >>>> that was used to boot contains symbols (the paths of nodes that
> >>>> have phandles) so that phandle references in the overlay can be
> >>>> fixed up to match the values in the base devicetree.  Symbols
> >>>> will be added to the device tree if if is compiled with the
> >>>> "@" option.  This is the first method to avoid the overlay
> >>>> load error.
> >>>
> >>> Ah, thanks, this does solve the problem. I use nothing special to
> >>> generate the base devicetree, just "make dtbs". Would it make sense
> >>> to add the "@" option to the kernel Makefile, so that symbols are
> >>> added by default? Or does this have any downside? I'd suspect that
> >>
> >> Yes, there is a large downside.  Compiling with the "@" option will
> >> increase the size of the DTB.  Most boards will not use overlays,
> >> and in those cases this overhead has no value.  So "@" should be
> >> opt-in, not default.
> >
> > I see. Is there a way (a config option maybe?) that I can use to get th=
is
> behavior without patching the Makefile?
>=20
> To compile a DTB with -@, you can specify the value of DTC_FLAGS
> on the make command line.  For example:
>=20
>    DTC_FLAGS=3D"-@" make qcom-apq8074-dragonboard.dtb
>=20
> This will work for arm.

I tried that for my Raspberry Pi 2, with the mainline kernel (so no Raspber=
ry Pi specific patches, still v4.14-rc2). Unfortunately, with that DTB the =
machine does not boot anymore, there is no output at all from the kernel:

---
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found U-Boot script /boot.scr
reading /boot.scr
696 bytes read in 11 ms (61.5 KiB/s)
## Executing script at 02000000
reading /zImage
6017520 bytes read in 791 ms (7.3 MiB/s)
reading /dtbs/bcm2836-rpi-2-b.dtb
18795 bytes read in 188 ms (96.7 KiB/s)
reading /initramfs-linux.img
4173703 bytes read in 546 ms (7.3 MiB/s)
Kernel image @ 0x1000000 [ 0x000000 - 0x5bd1f0 ]
## Flattened Device Tree blob at 00000100
   Booting using the fdt blob at 0x000100
   reserving fdt memory region: addr=3D0 size=3D1000
   Using Device Tree in place at 00000100, end 00007a6a

Starting kernel ...
---

Using an older DTB for the same kernel build works though.

I've used the dtc to get back the source for both DTBs and compared those. =
They are identical, except for several (linux,)phandle properties that appe=
ared in various nodes and the large __symbols__ section. Also, the dtc gene=
rates two more warnings when parsing the new DTB, but I'm not sure whether =
those are significant:

Warning (clocks_property): property 'clocks' size (21) is invalid, expected=
 multiple of 4 in node /__symbols__
Warning (gpios_property): property 'gpio' size (19) is invalid, expected mu=
ltiple of 4 in node /__symbols__

Can something else be broken in the DTB, that is not visible within the DTS=
? Or could this be a size issue? The new DTB is ~6KB larger than the old on=
e (18KB vs. 12KB). Any idea how to debug this further?

> For some other architectures, you may want to
> add additional flags to DTC_FLAGS, and for microblaze this will not work
> with the current makefile (the arch makefiles should probably be changed
> to be: DTC_FLAGS +=3D ... or to remove the "-p 1024" if no longer needed)=
:
>=20
>   $ git grep DTC_FLAGS | grep Makefile: | grep arch
>   arch/c6x/boot/dts/Makefile:DTC_FLAGS ?=3D -p 1024
>   arch/microblaze/boot/dts/Makefile:DTC_FLAGS :=3D -p 1024
>   arch/openrisc/boot/dts/Makefile:#DTC_FLAGS ?=3D -p 1024
>   arch/powerpc/boot/Makefile:DTC_FLAGS	?=3D -p 1024
>=20
>=20
> >>> many more people will be hit by this change, since most tutorials for
> >>> overlays that I have seen include the "@" option for the dtc calls.>
> >>>> If you compile the overlay with the "@" option then symbols
> >>>> will be added to the overlay DTB.  Previous to commit
> >>>> d1651b03c2df, these symbols would be ignored when an overlay
> >>>> was loaded.  If you remove the "@" from the compile of
> >>>> overlays, then everything should work the same way it did
> >>>> before the commit.  This is the second way to avoid the
> >>>> load overlay error.
> >
> > Do I understand that correctly, that when I remove the "@" option
> > from the dtc calls, the same call should work both with an old
> > (pre-d1651b03c2df) and a new kernel? If the old kernel just ignored
> > the symbols, they were not used for anything, so it should not matter
> > whether they were contained in the overlay DTB or not, right?
>=20
> I just mentioned that workaround as another temporary way to work
> around your specific case.  You should probably just forget I even
> mentioned it.
>=20
>=20
> >>>>
> >>>>
> >>>>> Thanks
> >>>>> Alexander
> >>>>> --
> >>>>> To unsubscribe from this list: send the line "unsubscribe devicetre=
e"
> in
> >>>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>>>> More majordomo info at  http://vger.kernel.org/majordomo-
> info.html
> >>>
> >>
> >
> >
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
