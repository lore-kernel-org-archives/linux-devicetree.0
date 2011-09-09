From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Thu, 8 Sep 2011 23:30:42 -0700
Message-ID: <CAF6FioWOuK3szFb8FD+_fde0HpZ0TJJXx51ZL=BAcZFSojRGCQ@mail.gmail.com>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
	<20110908070716.GC15955@ponder.secretlab.ca>
	<20110908130109.GW30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908130109.GW30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2011 at 6:01 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Sep 08, 2011 at 12:07:16AM -0700, Grant Likely wrote:
>> On Thu, Sep 08, 2011 at 01:51:49PM +1000, David Gibson wrote:
>> > On Wed, Sep 07, 2011 at 04:15:40PM -0700, Anton Staaf wrote:
>> > > With this patch the following property assignment:
>> > >
>> > > =A0 =A0 property =3D ['a' 2b '\r'];
>> > >
>> > > is equivalent to:
>> > >
>> > > =A0 =A0 property =3D [61 2b 0d];
>> >
>> > So, I still have some reservations about this syntax.
>> >
>> > It occurred to me: do you actually need to intermix character and
>> > hexbyte values that much? =A0Could I suggest an alternate sytax as:
>> >
>> > =A0 =A0 property =3D 'a', [2b], 'r';
>> >
>> > The new character literals sufficiently distinct not to cause problems
>> > here, and it maintains the , =3D=3D bytestring append behaviour we alr=
eady
>> > have.
>> >
>> > Thoughts?
>>
>> Does it matter much? =A0I'm happy with either. =A0Is there a downside to
>> the first syntax?
>
> Well.. probably not. =A0I'm just nervous about adding anything in the
> lexically weird bytestring context.

Which is completely understandable.  Let's continue to mull that over
while we think up a sane syntax for specifying the size of a cell in a
cell list.  Would it be reasonable to specify the size per list?  Or
would you like to have a mechanism and syntax to specify it per cell
entry in the list.  If it is per cell entry then we have to deal with
the strange packings that would come from something like:

property =3D <0x11223344 byte(0x55) 0x66778899>

I'm not suggesting that the byte(...) syntax be used by the way.  :)
But the above situation would lead to a value of 0x55667788 and a
trailing 0x99, which then has to be either promoted to a uint32_t
because it was originally in a uint32_t literal, or left as a byte,
not very obvious.  The other option would be to do some sort of local
packing.  Where the above would turn into the same as:

property =3D <0x11223344 0x55 0x66778899>

But that has all sorts of problems.  When do you start a new uint32_t
cell.  If it's only when you overflow out of the current one or when
you see a full uint32_t literal then you could split a uint16_t across
a cell boundary.  I suppose this problem already exists because of the
"," syntax.  And so you could make a cell list that contains a bunch
of uint32_t values that are stored in a property in such a way as to
be unaligned.

The alternative of specifying the size of the cells in a list seems
cleaner to me.  You still can generate unaligned values in a property
using ",", but within a cell list you can't.  So then what would be a
good syntax for that.  Perhaps:

property =3D !uint16 <0x12 0x3456>

or

property =3D !uint8 <0xff 0xaa>

or to explicitly get the default uint32_t behavior

property =3D !uint32 <0x12345678 0 12>

This has the advantage that ! is not currently used in any of the dts
syntax.  And having it at the front of the cell list definition means
that you can check and correctly pack/append each literal as they are
read.  It has the disadvantage that if we want to use ! to mean
logical not at some point it will complicate that parsing.

-Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
