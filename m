From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: devicetree: Musings on reserved regions
Date: Mon, 7 Feb 2011 13:59:53 -0700
Message-ID: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Stuart Yoder <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matthew
List-Id: devicetree@vger.kernel.org

As part of the process of bringing dt support up on non-powerpc
platforms, I've been thinking about the usage mode of the reserved
regions section in the flattened device tree structure.  First, for
reference, here is the description of reserved regions from ePAPR
1.0:

> 7.3 Memory Reservation Block
> 7.3.1 Purpose
> The memory reservation block provides the client program with
> a list of areas in physical memory which are reserved; that
> is, which shall not be used for general memory allocations. It
> is used to protect vital data structures from being
> overwritten by the client program. For example, on some
> systems with an IOMMU, the TCE (translation control entry)
> tables initialized by an ePAPR boot program would need to be
> protected in this manner. Likewise, any boot program code or
> data used during the client program=92s runtime would need to be
> reserved (e.g., RTAS on Open Firmware platforms). The ePAPR
> does not require the boot program to provide any such runtime
> components, but it does not prohibit implementations from
> doing so as an extension.
>
> More specifically, a client program shall not access memory in
> a reserved region unless other information provided by the
> boot program explicitly indicates that it shall do so. The
> client program may then access the indicated section of the
> reserved memory in the indicated manner. Methods by which the
> boot program can indicate to the client program specific uses
> for reserved memory may appear in this document, in optional
> extensions to it, or in platform-specific documentation.
>
> The reserved regions supplied by a boot program may, but are
> not required to, encompass the device tree blob itself. The
> client program shall ensure that it does not overwrite this
> data structure before it is used, whether or not it is in the
> reserved areas.

The problem that I'm having, is that the lifecycle for reserved
regions is not defined and the client program has no mechanism to
determine what each reserved region is intended for.  This issue has
been raised before in the context of kexec from one Linux instance to
another[1].  When going from one kernel to the next, kexec needs to
populate a valid set of reserved regions, but it isn't easy to figure
out what the new set should be because there isn't a reliable way to
figure out which regions from the previous boot need to be preserved
(ie. runtime firmware or framebuffers) vs regions that are obsolete
(original initrd and dtb regions).

[1] http://www.mail-archive.com/linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg44999.html

Before committing to implementing reserved regions on non-powerpc
architectures, I would like to nail down a stricter definition of how
client programs are to interpret reserved regions.  I'm not sure if it
is reasonable to make this part of ePAPR 1.1, but here are my thoughts
at the moment:

In addition to the reserved regions block in the header, define a set
of properties in the memory node that specify the reserved regions
with the name reflecting the usage.
For example:

	memory@0 {
		device_type =3D "memory";
		reg =3D <0 0x40000000>;
		reserved-ramdisk =3D <0xc00000 0x200000>; /* 2MB ramdisk */
		reserved-dtb =3D <0xbf0000 0x1000>; /* devicetree */
		reserved-fb0 =3D 0x1000000 0x400000>; /* framebuffer */
	};

Each reserved property would start with "reserved-" followed by a
name.  reserved-ramdisk and reserved-dtb would be reserved for ramdisk
and dtb images respectively.  Other names could also be defined; for
example, reserved-openfirmware.

Firmware would be responsible to ensure the reserved regions are
accurately reflected in the memory nodes.  Client programs may
continue to use the header values for the purpose of determining
reserved regions, but after the client program is initialized, the
data in reserved- properties should be preferred over the header
reserved regions.  On new platforms, I'm tempted to say that the
reserved-* properties should be considered authoritative over the
header values.  If the client program is able to parse the memory
nodes early enough, then it shouldn't be necessary to look at the
header fields at all (for instance, this is currently the case on
ARM).

After the client has initialized itself (for whatever definition of
initialized it chooses) the client must always respect the reserved
regions specified in the memory nodes *unless* it recognizes the
region and knows that it is safe to drop it.  For instance, it is safe
to reclaim the dtb and ramdisk regions.  It *might* be safe to reclaim
a framebuffer region too, but that depends on the framebuffer driver.

For the kexec use case, this would mean that kexec would drop the old
dtb and kexec regions while adding new ones before jumping into the
new kernel.  It would also mean that the kernel can reclaim regions
that it know are no longer in use; for instance, if the client no
longer needs OpenFirmware to be resident, or if a new framebuffer has
been allocated and the old one is no longer in use.

Thoughts?
g.




-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
