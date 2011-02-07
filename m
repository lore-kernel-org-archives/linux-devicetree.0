From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
Date: Mon, 7 Feb 2011 14:56:23 -0700
Message-ID: <AANLkTinO40aKu9VjFrB2GQmpqwGGk+vR=LjD5E49wyHf@mail.gmail.com>
References: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
	<1297114766.14982.76.camel@pasglop>
	<AANLkTiniLf6f7FKMdZ1BWZ9jiA=KHEb0wsp84hCnm73Z@mail.gmail.com>
	<9F6FE96B71CF29479FF1CDC8046E15030C1955@039-SN1MPN1-002.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9F6FE96B71CF29479FF1CDC8046E15030C1955-TcFNo7jSaXPiTqIcKZ1S2K4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, McClintock Matthew-B29882 <B29882-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 7, 2011 at 2:53 PM, Yoder Stuart-B08248
<B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gr=
ant
>> Likely
>> Sent: Monday, February 07, 2011 3:45 PM
>> To: Benjamin Herrenschmidt
>> Cc: parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org; devicetree-discuss; David Gibson; Yoder Stuart-B082=
48;
>> McClintock Matthew-B29882; Wood Scott-B07421
>> Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
>>
>> On Mon, Feb 7, 2011 at 2:39 PM, Benjamin Herrenschmidt
>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> >
>> >> In addition to the reserved regions block in the header, define a set
>> >> of properties in the memory node that specify the reserved regions
>> >> with the name reflecting the usage.
>> >> For example:
>> >>
>> >> =A0 =A0 =A0 memory@0 {
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0 0x40000000>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserved-ramdisk =3D <0xc00000 0x200000>;=
 /* 2MB ramdisk
>> >> */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserved-dtb =3D <0xbf0000 0x1000>; /* de=
vicetree */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserved-fb0 =3D 0x1000000 0x400000>; /* =
framebuffer */
>> >> =A0 =A0 =A0 };
>> >>
>> >> Each reserved property would start with "reserved-" followed by a
>> >> name. =A0reserved-ramdisk and reserved-dtb would be reserved for
>> >> ramdisk and dtb images respectively. =A0Other names could also be
>> >> defined; for example, reserved-openfirmware.
>> >
>> > I very much dislike the list of properties with magic names. I'd
>> > rather have a pair of properties containing lists (reserved-names and
>> > reserved-ranges).
>>
>> Heh, I have very much the opposite opinion. =A0I'd rather have property =
names
>> that match the usage than have the names and values split into two
>> properties. =A0To me, keeping them together is more tasteful. =A0Queue t=
he
>> debate... =A0:-)
>
> Could we not do both? Use an enum to identify the region type:
>
> =A0 =A0reserved =3D <0x1 0xc00000 0x200000>; /* 2MB ramdisk
> =A0 =A0reserved =3D <0x2 0xbf0000 0x1000>; /* devicetree */
> =A0 =A0reserved =3D <0x3 0x1000000 0x400000>; /* framebuffer */

I really dislike enums for this sort of thing.  I'd rather have a
string encoded somewhere, even if it is in a different property.

g.
