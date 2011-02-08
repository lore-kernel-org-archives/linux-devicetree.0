From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
Date: Mon, 7 Feb 2011 22:05:06 -0700
Message-ID: <AANLkTikgBqJM=kWf+FK1nxmi+BSV-nEJo=ToL7gyinkN@mail.gmail.com>
References: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
	<1297114766.14982.76.camel@pasglop>
	<AANLkTiniLf6f7FKMdZ1BWZ9jiA=KHEb0wsp84hCnm73Z@mail.gmail.com>
	<DEB310FA-724C-4D8B-A8EC-E222A51CD5D4@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <DEB310FA-724C-4D8B-A8EC-E222A51CD5D4-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jimi Xenidis <jimix-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Stuart Yoder <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 7, 2011 at 3:00 PM, Jimi Xenidis <jimix-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> wrote:
> On Feb 7, 2011, at 3:45 PM, Grant Likely wrote:
>>
>> On Mon, Feb 7, 2011 at 2:39 PM, Benjamin Herrenschmidt
>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>>>
>>>> In addition to the reserved regions block in the header, define a set
>>>> of properties in the memory node that specify the reserved regions
>>>> with the name reflecting the usage.
>>>> For example:
>>>>
>>>> =A0 =A0 =A0 memory@0 {
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0 0x40000000>;
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserved-ramdisk =3D <0xc00000 0x200000>; =
/* 2MB ramdisk */
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserved-dtb =3D <0xbf0000 0x1000>; /* dev=
icetree */
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserved-fb0 =3D 0x1000000 0x400000>; /* f=
ramebuffer */
>>>> =A0 =A0 =A0 };
>>>>
>>>> Each reserved property would start with "reserved-" followed by a
>>>> name. =A0reserved-ramdisk and reserved-dtb would be reserved for ramdi=
sk
>>>> and dtb images respectively. =A0Other names could also be defined; for
>>>> example, reserved-openfirmware.
>>>
>>> I very much dislike the list of properties with magic names. I'd rather
>>> have a pair of properties containing lists (reserved-names and
>>> reserved-ranges).
>>
>> Heh, I have very much the opposite opinion. =A0I'd rather have property
>> names that match the usage than have the names and values split into
>> two properties. =A0To me, keeping them together is more tasteful. =A0Que=
ue
>> the debate... =A0:-)
>
> ok.. here goes nothing...
> When I see these "reservations", it makes me think that they should be no=
des anyway. (off root?)
> Once we have nodes for these interesting things, perhaps the next step is=
 to just have a "reserved" property for these nodes?
> so:
> =A0 =A0 =A0 =A0ramdisk@<addr> {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < addr, size >;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0format =3D < "gzip", "cpio" >; =A0// optio=
nal, order of wrapper?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reserved;
> =A0 =A0 =A0 =A0}
>
> No, I'm not ready to propose the ramdisk node, but it is something to con=
sider.

Hmmm, of all the ideas, I think I like this one the best.  It is a
little more verbose than I was thinking, but making each reserved
region (or set of reserved regions) have separate node has some very
real advantages.  For one, the address decoding *just works* with our
existing helpers.  Also it means that device nodes can directly
indicate the reserved regions associated with it by way of a phandle.

Naming I think could simply be "reserved@<addr>" since the usage of
each node can be indicated by phandles or driver-specific properties
within the node, plus it kind of follows the lead of the 'generic
names' recommended practise.  Something like 'format' I suppose could
be specified, but I don't think it needs to be part of the reserved
binding.  Should these nodes have a compatible property that describes
it's usage?  ie; something like:

for a data block: compatible =3D "reserved-data", "reserved-memory";
	(like for an initrd or the dtb)
for a framebuffer: compatible =3D "reserved-framebuffer", "reserved-memory":
for shared memory: compatible =3D "reserved-shared", "reserved-memory";

On Mon, Feb 7, 2011 at 3:50 PM, Dan Hettena <danh-5j0BnJlmnLM@public.gmane.org> wrote:
> I've seen three types of reserved regions so far:
>
> (1) Reserved regions that are permanently reserved. For example,
>    RAM used for configuration of a device not communicated in the
>    device tree. Nothing further needs to be said about this class.
> (2) Reserved regions that are in use by something in the device tree
>    (for example, a spin table, or a frame buffer for a video device).
>    The client program can free these if it recognizes the node that
>    is using them and reprograms it (e.g., boot all processors, or
>    reprogram the video device).
> (3) Reserved regions that contain data the client program might want to
>    use but are not actually being used by the hardware for anything.
>    For example, a RAM root file system.
>
> I think this points strongly at having type 2 and type 3
> reservations specified along with the nodes that make use of them,
> so that the client program can free the memory as soon as it has
> caused the reserved memory to no longer be in use for the purpose
> for which it was reserved (provided that we make it clear that
> reservations declared as such are not permitted to overlap).

Yes.  I think phandles would do the trick nicely for this.  It would
also be possible to allow an initrd-region =3D <&initrd_reserved>;
property in the chosen node, but there probably isn't much benefit in
doing so, and it would just create yet another new binding that client
programs need to support in addition to the old binding.

>
> Primarily because of type 1 reservations, I see no conflict between
> the conventional reservations list and the idea of explicitly
> identifying single-purpose reservations throughout the device tree
> where they are used.

IMO, type 1 reservations still need to be specified explicitly in the
memory nodes (instead of, or in addition to, in the header).  It just
makes life so much easier when all the data about the machine is fully
specified in the device tree proper.  Otherwise extra hoops need to be
jumped through to get at it.

However, if nothing in the tree actually references a reserved
region node, then the client must treat it as an 'anonymous' region
and it does not have the option of ignoring or freeing it.

> However, in the spirit of distributing memory nodes, I think I would
> rather see the conventional reservations list moved to the
> corresponding memory nodes (with an added rule that a reservation
> may not cross a reg entry boundary, since that's just a big pain).
> If we're going to work towards keeping crap out of the header, then
> I don't see why the reservations block should be treated any
> differently.

I 100% agree.  The reserved regions nodes should be children of the
associated memory node, and reservations should not cross boundaries.
Collecting all the reservations in one place also give the client a
fighting chance of locating them easily when it parses the memory
node.

g.
