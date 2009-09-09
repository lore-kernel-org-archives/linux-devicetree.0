From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Question on flash node on device tree source
Date: Wed, 9 Sep 2009 14:46:19 +1000
Message-ID: <20090909044619.GD7909@yookeroo.seuss>
References: <859952.87558.qm@web23106.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <859952.87558.qm-NHjxwdBWIhzyX4RqAA4FmIglqE1Y4D90QQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Angelo <s104259-whZMOeQn8C0@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 08, 2009 at 12:18:33PM +0000, Angelo wrote:
> Hi all.
> =

> I need some info about device tree blob.
> I'm testing a powerpc board (very similar to mpc512xev) with the followin=
g feature:
> =A0- 256MB flash (only 1 bank)
> =

> Changes some lines of device tree source about flash
> =

> localbus@80000020 {
> =A0=A0=A0 =A0=A0=A0 compatible =3D "fsl,mpc5121ads-localbus";
> =A0=A0=A0 =A0=A0=A0 #address-cells =3D <2>;
> =A0=A0=A0 =A0=A0=A0 #size-cells =3D <1>;
> =A0=A0=A0 =A0=A0=A0 reg =3D <0000020 40>;
> =

> =A0=A0=A0 =A0=A0=A0 ranges =3D <0 0 fc000000 04000000
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 2 0 82000000 00008000>;

First thing to note is that you're still using dts-v0 syntax.  You
really want to change over to dts-v1 syntax.  Which probably means
you've based your tree on an old version of the mpc512eev dts.  All
the in-kernel dts files have already been converted and current
versions of dtc don't support the old syntax.

> =A0=A0=A0 =A0=A0=A0 flash@0,0 {
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device_type =3D "rom";
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 compatible =3D "direct-mapped";

Second thing to note is that you're using the old, broken flash
binding.  You should use the new binding described in
Documentation/powerpc/dts-bindings/mtd-physmap.txt.

> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 probe-type =3D "CFI";
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 reg =3D <0 0 4000000>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #address-cells =3D <1>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #size-cells =3D <1>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 bank-width =3D <4>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device-width =3D <2>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partitions =3D <00000000 00040000=A0=A0=A0 =
=A0=A0=A0 // first sector is protected
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 00040000 03c00000=
=A0=A0=A0 =A0=A0=A0 // 60 Mb for filesystem
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 03c40000 00280000=
=A0=A0=A0 =A0=A0=A0 // 2.5 Mb for kernel
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 03ec0000 00040000=
=A0=A0=A0 =A0=A0=A0 // one sector for device tree
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 03f00000 00100000=
>;=A0=A0=A0 // one Mb for u-boot
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partition-names =3D "protected", "filesyste=
m", "kernel", "device-tree", "u-boot";
> =A0=A0=A0 =A0=A0=A0 };
> .....
> with these changes:
> .....
> =A0=A0=A0 =A0=A0=A0 flash@0,0 {
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device_type =3D "rom";
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 compatible =3D "direct-mapped";
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 probe-type =3D "CFI";
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 reg =3D <0 0 1000000>;

And the third thing to note is that 0x1000000 =3D=3D 16MB.

> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #address-cells =3D <1>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #size-cells =3D <1>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 bank-width =3D <1>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device-width =3D <1>;
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partitions =3D <300000 200000=A0=A0=A0 =A0=
=A0=A0 //uimage
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 400000 320000=
0>;=A0=A0=A0 // fs
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partition-names =3D "uimage", "fs";
> =A0=A0=A0 =A0=A0=A0 };
> .....
> =

> The problem is that on bootstrap stage, kernel truncate the flash
> memory to 16MB, so i cannot access to the whole flash. kernel
> messages:

That would be because you told the kernel your flash was 16MB in the
'reg' property.  Looks like you missed out a zero.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
