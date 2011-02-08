From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
Date: Mon, 7 Feb 2011 17:13:36 -0800
Message-ID: <20110208011336.GA13628@dvomlehn-lnx2.corp.sa.net>
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
Content-Disposition: inline
In-Reply-To: <EA0D723E-90B1-4D35-8A3D-A5193E00F740-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jimi Xenidis <jimix-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, McClintock Matthew-B29882 <B29882-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 07, 2011 at 04:01:28PM -0600, Jimi Xenidis wrote:
> On Feb 7, 2011, at 3:56 PM, Grant Likely wrote:
> > 
> > On Mon, Feb 7, 2011 at 2:53 PM, Yoder Stuart-B08248
> > <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >> 
> >> 
> >>> -----Original Message-----
> >>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant
> >>> Likely
> >>> Sent: Monday, February 07, 2011 3:45 PM
> >>> To: Benjamin Herrenschmidt
> >>> Cc: parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org; devicetree-discuss; David Gibson; Yoder Stuart-B08248;
> >>> McClintock Matthew-B29882; Wood Scott-B07421
> >>> Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
> >>> 
> >>> On Mon, Feb 7, 2011 at 2:39 PM, Benjamin Herrenschmidt
> >>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> >>>> 
> >>>>> In addition to the reserved regions block in the header, define a set
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

This is covering pretty much the same territory that I went through, mostly
on this mailing list, a few months ago. The "reserved-" prefix is a Bad Thing
because there is no way to search for a property with a given prefix, nor
do I think there should be such a thing because it defeats the whole purpose
of having properties common to all devices of a given type.

Also, most reserved things (and I'm dealing with quite a few of them) are
associated with a particular device. One common exception is the device
tree itself.  Another is the bootloader, if it sticks around for a while
like a BIOS.

Given that you've got memory reserved for a device, it should really have
a name. If your framebuffer can move, you better be able to find it! So, I
came up with (in crude BNF):

cisco,static-bufs = "\"" <name> "\"" "," "<" <start> <size> ">"
	( [ , ] "\"" <name> "\"" "," "<" <start> <size> ">" )* ;

For example:

cisco,static-bufs = "buf1", <0x12345678 111>,
	"buf2", <0x87654321 222>;

This property can appear under any device. As currently implemented, all
buffer names must be unique device tree-wide, but that allows scoping per
device later, if desired.

This does end up with the start and size values generally being unaligned,
but as I understand it, if you mix items like this, it's just the way it
works. The code to parse this is really simple and doesn't involve adding
an API to look for properties starting with some string.

As far as the device tree and bootloader memory are concerned, well, we could
make them pseudo-devices.

(I'm *not* proposing cisco,static-bufs be the name of this property,
just tossing out another direction).
-- 
David VL
