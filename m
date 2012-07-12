From: Ricky Ng-Adam <rngadam-Cdz4rsCscHxBDgjK7y7TUQ@public.gmane.org>
Subject: ATAG and DTB /chosen for kernel parameters
Date: Thu, 12 Jul 2012 21:09:09 +0800
Message-ID: <CAOAMTYQRqXq+xu6d1Ph_hJqpuhVBo-2RwuDAn2FNFczKSitPiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5160051317042896093=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Shyu Lee <shyu.lee-Cdz4rsCscHxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============5160051317042896093==
Content-Type: multipart/alternative; boundary=e89a8f3ba4b948dd8704c4a1ab5b

--e89a8f3ba4b948dd8704c4a1ab5b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello all!

We're building a new machine derived from MACH_AT91SAM9M10G45EK. As it is
very similar, we'd prefer to use DeviceTree, especially as we have slightly
different revisions already.

What we are planning to do:

   - generate the machine dtb from dts and stored on the machine persistent
   storage (not linked to kernel to facilitate updates)
   - build a zImage stored on the machine persistent storage with generic
   AT91 DT support
   - create a text file containing kernel parameters on machine persistent
   storage
   - custom bootloader starts on machine
      - load zImage from machine storage into memory
      - load dtb from machine storage into memory
      - set ATAGs, including kernel parameters from text file
      - pass location of loaded DTB using ATAG
      - boot kernel
      - kernel creates devicetree from DTB

We prefer ATAG as this is how we specify the kernel parameters line sourced
from a text file on the local storage. It's simple and it works.

This option in the kernel is tantalizing:

CONFIG_ARM_ATAG_DTB_COMPAT:


   Some old bootloaders can't be updated to a DTB capable one, yet
   they provide ATAGs with memory configuration, the ramdisk address,
   the kernel cmdline string, etc.  Such information is dynamically
   provided by the bootloader and can't always be stored in a static
   DTB.  To allow a device tree enabled kernel to be used with such
   bootloaders, this option allows zImage to extract the information
   from the ATAG list and store it at run time into the appended DTB.

However, it is only enabled if CONFIG_ARM_APPENDED_DTB is on. This is
reflected in arch/arm/boot/compressed/head.S with one being a #ifdef inside
the other. The magic seems to happen in a call
to arch/arm/boot/compressed/atags_to_fdt.c for the conversion.

As we've explained above, we'd rather load DTB to RAM independently and
pass the location using something like ATAG_DEVTREE (I've seen patches for
adding this ATAG floating around).

The only alternative I found is the r2 mechanism from the current kernel
document (Documentation/platform/booting-without-of.txt) where it seems to
be either ATAG *OR* DTB.

Would adding ATAG_DEVTREE and making it work
with CONFIG_ARM_ATAG_DTB_COMPAT be a valid approach?  I'd imagine parsing
the ATAG and then applying the code from atags_to_fdt to it. I'm not sure
why this conversion call is early in the assembly right now instead of
in arch/arm/kernel/devtree.c:setup_machine_fdt...

On the subject of ATAG and DTB, All I could find so far is this long and
contentious discussion from a year ago:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2011-June/thread.html=
#5880

What's the current consensus? Should we stick with CONFIG_ARM_APPENDED_DTB
and CONFIG_ARM_ATAG_DTB_COMPAT?

Thank you for your help! Sorry if I sound a bit confused, this is all new
to me.
--=20
=E4=BC=8D=E6=80=9D=E5=8A=9B | Ricky Ng-Adam | Lophilo Ltd | http://lophilo.=
com | (+86)186-2126-2521

--e89a8f3ba4b948dd8704c4a1ab5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Hello all!</div><div><br></div><div>We&#39;re building a new machine d=
erived from MACH_AT91SAM9M10G45EK. As it is very similar, we&#39;d prefer t=
o use DeviceTree, especially as we have slightly different revisions alread=
y.</div>
<div><br></div><div>What we are planning to do:</div>
<div><ul><li>generate the machine dtb from dts and stored on the machine pe=
rsistent storage (not linked to kernel to facilitate updates)</li><li>build=
 a zImage stored on the machine persistent storage with generic AT91 DT sup=
port</li>
<li>create a text file containing kernel parameters on machine persistent s=
torage</li>
<li>custom bootloader starts on machine</li><ul><li>load zImage from machin=
e storage into memory</li><li>load dtb from machine storage into memory</li=
><li>set ATAGs, including kernel parameters from text file</li>
<li>pass location of loaded DTB using ATAG</li><li>boot kernel</li><li>kern=
el creates devicetree from DTB</li></ul></ul></div><div>We prefer ATAG as t=
his is how we specify the kernel parameters line sourced from a text file o=
n the local storage. It&#39;s simple and it works.</div>
<div><br></div><div><div>This option in the kernel is tantalizing:</div><di=
v><br></div><div><font face=3D"&#39;courier new&#39;, monospace">CONFIG_ARM=
_ATAG_DTB_COMPAT:</font></div><div><font face=3D"&#39;courier new&#39;, mon=
ospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">=C2=A0 =C2=A0Some old =
bootloaders can&#39;t be updated to a DTB capable one, yet</font></div><div=
><font face=3D"&#39;courier new&#39;, monospace">=C2=A0 =C2=A0they provide =
ATAGs with memory configuration, the ramdisk address,</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">=C2=A0 =C2=A0the kerne=
l cmdline string, etc. =C2=A0Such information is dynamically</font></div><d=
iv><font face=3D"&#39;courier new&#39;, monospace">=C2=A0 =C2=A0provided by=
 the bootloader and can&#39;t always be stored in a static</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">=C2=A0 =C2=A0DTB. =C2=
=A0To allow a device tree enabled kernel to be used with such</font></div><=
div><font face=3D"&#39;courier new&#39;, monospace">=C2=A0 =C2=A0bootloader=
s, this option allows zImage to extract the information</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">=C2=A0 =C2=A0from the =
ATAG list and store it at run time into the appended DTB.</font></div></div=
><div><br></div><div>However, it is only enabled if=C2=A0CONFIG_ARM_APPENDE=
D_DTB is on. This is reflected in arch/arm/boot/compressed/head.S with one =
being a #ifdef inside the other. The magic seems to happen in a call to=C2=
=A0arch/arm/boot/compressed/atags_to_fdt.c for the conversion.</div>
<div><br></div><div>As we&#39;ve explained above, we&#39;d rather load DTB =
to RAM independently and pass the location using something like ATAG_DEVTRE=
E (I&#39;ve seen patches for adding this ATAG floating around).</div><div>
<br></div><div>The only alternative I found is the r2 mechanism from the cu=
rrent kernel document (Documentation/platform/booting-without-of.txt) where=
 it seems to be either ATAG *OR* DTB.</div><div><br></div><div>Would adding=
 ATAG_DEVTREE and making it work with=C2=A0CONFIG_ARM_ATAG_DTB_COMPAT be a =
valid approach? =C2=A0I&#39;d imagine parsing the ATAG and then applying th=
e code from atags_to_fdt to it. I&#39;m not sure why this conversion call i=
s early in the assembly right now instead of in=C2=A0arch/arm/kernel/devtre=
e.c:setup_machine_fdt...</div>
<div><br></div><div>On the subject of ATAG and DTB, All I could find so far=
 is this long and contentious discussion from a year ago:=C2=A0</div><div><=
br></div><div><a href=3D"https://lists.ozlabs.org/pipermail/devicetree-disc=
uss/2011-June/thread.html#5880">https://lists.ozlabs.org/pipermail/devicetr=
ee-discuss/2011-June/thread.html#5880</a></div>
<div><br></div><div>What&#39;s the current consensus? Should we stick with=
=C2=A0CONFIG_ARM_APPENDED_DTB and=C2=A0CONFIG_ARM_ATAG_DTB_COMPAT?</div><di=
v><br></div><div>Thank you for your help! Sorry if I sound a bit confused, =
this is all new to me.</div>
-- <br>=E4=BC=8D=E6=80=9D=E5=8A=9B | Ricky Ng-Adam | Lophilo Ltd | <a href=
=3D"http://lophilo.com" target=3D"_blank">http://lophilo.com</a> | <a href=
=3D"tel:%28%2B86%29186-2126-2521" value=3D"+8618621262521" target=3D"_blank=
">(+86)186-2126-2521</a><br>

--e89a8f3ba4b948dd8704c4a1ab5b--

--===============5160051317042896093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5160051317042896093==--
