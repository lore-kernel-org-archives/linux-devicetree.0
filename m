From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
Date: Tue, 08 Feb 2011 13:20:56 +1100
Message-ID: <1297131656.14982.105.camel@pasglop>
References: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
	<1297114766.14982.76.camel@pasglop>
	<AANLkTiniLf6f7FKMdZ1BWZ9jiA=KHEb0wsp84hCnm73Z@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTiniLf6f7FKMdZ1BWZ9jiA=KHEb0wsp84hCnm73Z-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Stuart Yoder <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2011-02-07 at 14:45 -0700, Grant Likely wrote:
> On Mon, Feb 7, 2011 at 2:39 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> >
> >> In addition to the reserved regions block in the header, define a set
> >> of properties in the memory node that specify the reserved regions
> >> with the name reflecting the usage.
> >> For example:
> >>
> >>       memory@0 {
> >>               device_type = "memory";
> >>               reg = <0 0x40000000>;
> >>               reserved-ramdisk = <0xc00000 0x200000>; /* 2MB ramdisk */
> >>               reserved-dtb = <0xbf0000 0x1000>; /* devicetree */
> >>               reserved-fb0 = 0x1000000 0x400000>; /* framebuffer */
> >>       };
> >>
> >> Each reserved property would start with "reserved-" followed by a
> >> name.  reserved-ramdisk and reserved-dtb would be reserved for ramdisk
> >> and dtb images respectively.  Other names could also be defined; for
> >> example, reserved-openfirmware.
> >
> > I very much dislike the list of properties with magic names. I'd rather
> > have a pair of properties containing lists (reserved-names and
> > reserved-ranges).
> 
> Heh, I have very much the opposite opinion.  I'd rather have property
> names that match the usage than have the names and values split into
> two properties.  To me, keeping them together is more tasteful.  Queue
> the debate...  :-)

Ideally you want a single property but it's nasty to mix strings and
numbers in a single property like that.

We also have no good APIs to iterate properties, we'd have to add one.

And then there's the property name limits in the spec, charset limits
etc... property names shall not per-se contain data I believe.

Cheers,
Ben.
