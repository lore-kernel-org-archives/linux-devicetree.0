From: Dan Hettena <danh-5j0BnJlmnLM@public.gmane.org>
Subject: RE: [Power.org:parch] devicetree: Musings on reserved regions
Date: Mon, 7 Feb 2011 14:50:52 -0800
Message-ID: <2A9CCDDDAE41C446A006170FF0C786313CCE517331@express.ghs.com>
References: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
	<1297114766.14982.76.camel@pasglop>
	<AANLkTiniLf6f7FKMdZ1BWZ9jiA=KHEb0wsp84hCnm73Z@mail.gmail.com>
	<9F6FE96B71CF29479FF1CDC8046E15030C1955@039-SN1MPN1-002.039d.mgd.msft.net>
	<AANLkTinO40aKu9VjFrB2GQmpqwGGk+vR=LjD5E49wyHf@mail.gmail.com>
	<EA0D723E-90B1-4D35-8A3D-A5193E00F740@watson.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <EA0D723E-90B1-4D35-8A3D-A5193E00F740-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jimi Xenidis <jimix-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, McClintock Matthew-B29882 <B29882-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I've seen three types of reserved regions so far:

(1) Reserved regions that are permanently reserved. For example,
    RAM used for configuration of a device not communicated in the
    device tree. Nothing further needs to be said about this class.
(2) Reserved regions that are in use by something in the device tree
    (for example, a spin table, or a frame buffer for a video device).
    The client program can free these if it recognizes the node that
    is using them and reprograms it (e.g., boot all processors, or
    reprogram the video device).
(3) Reserved regions that contain data the client program might want to
    use but are not actually being used by the hardware for anything.
    For example, a RAM root file system.

I think this points strongly at having type 2 and type 3 reservations specified along with the nodes that make use of them, so that the client program can free the memory as soon as it has caused the reserved memory to no longer be in use for the purpose for which it was reserved (provided that we make it clear that reservations declared as such are not permitted to overlap).

Primarily because of type 1 reservations, I see no conflict between the conventional reservations list and the idea of explicitly identifying single-purpose reservations throughout the device tree where they are used.

However, in the spirit of distributing memory nodes, I think I would rather see the conventional reservations list moved to the corresponding memory nodes (with an added rule that a reservation may not cross a reg entry boundary, since that's just a big pain). If we're going to work towards keeping crap out of the header, then I don't see why the reservations block should be treated any differently.

Dan

> -----Original Message-----
> From: parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org [mailto:parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org] On Behalf Of Jimi Xenidis
> Sent: Monday, February 07, 2011 2:01 PM
> To: Grant Likely
> Cc: Yoder Stuart-B08248; Benjamin Herrenschmidt; parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org;
> devicetree-discuss; David Gibson; McClintock Matthew-B29882; Wood Scott-
> B07421
> Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
> 
> On Feb 7, 2011, at 3:56 PM, Grant Likely wrote:
> >
> > On Mon, Feb 7, 2011 at 2:53 PM, Yoder Stuart-B08248
> > <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
> Grant
> >>> Likely
> >>> Sent: Monday, February 07, 2011 3:45 PM
> >>> To: Benjamin Herrenschmidt
> >>> Cc: parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org; devicetree-discuss; David Gibson; Yoder Stuart-
> B08248;
> >>> McClintock Matthew-B29882; Wood Scott-B07421
> >>> Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
> >>>
> >>> On Mon, Feb 7, 2011 at 2:39 PM, Benjamin Herrenschmidt
> >>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> >>>>
> >>>>> In addition to the reserved regions block in the header, define a
> set
> >>>>> of properties in the memory node that specify the reserved regions
> >>>>> with the name reflecting the usage.
> >>>>> For example:
> >>>>>
> >>>>>       memory@0 {
> >>>>>               device_type = "memory";
> >>>>>               reg = <0 0x40000000>;
> >>>>>               reserved-ramdisk = <0xc00000 0x200000>; /* 2MB ramdisk
> >>>>> */
> >>>>>               reserved-dtb = <0xbf0000 0x1000>; /* devicetree */
> >>>>>               reserved-fb0 = 0x1000000 0x400000>; /* framebuffer */
> >>>>>       };
> >>>>>
> >>>>> Each reserved property would start with "reserved-" followed by a
> >>>>> name.  reserved-ramdisk and reserved-dtb would be reserved for
> >>>>> ramdisk and dtb images respectively.  Other names could also be
> >>>>> defined; for example, reserved-openfirmware.
> >>>>
> >>>> I very much dislike the list of properties with magic names. I'd
> >>>> rather have a pair of properties containing lists (reserved-names and
> >>>> reserved-ranges).
> >>>
> >>> Heh, I have very much the opposite opinion.  I'd rather have property
> names
> >>> that match the usage than have the names and values split into two
> >>> properties.  To me, keeping them together is more tasteful.  Queue the
> >>> debate...  :-)
> >>
> >> Could we not do both? Use an enum to identify the region type:
> >>
> >>    reserved = <0x1 0xc00000 0x200000>; /* 2MB ramdisk
> >>    reserved = <0x2 0xbf0000 0x1000>; /* devicetree */
> >>    reserved = <0x3 0x1000000 0x400000>; /* framebuffer */
> >
> > I really dislike enums for this sort of thing.  I'd rather have a
> > string encoded somewhere, even if it is in a different property.
> 
> ack
> -JX
> 
> >
> > g.
> 
