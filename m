From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Power.org:parch] Re: RFC: proposal to extend the open-pic
	interrupt specifierdefinition
Date: Sun, 17 Jan 2010 00:13:46 -0700
Message-ID: <fa686aa41001162313u28ef0fb4s328ebc25bf5e551f@mail.gmail.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<20100107005036.GB23206@yookeroo>
	<9696D7A991D0824DBA8DFAC74A9C5FA305987E61@az33exm25.fsl.freescale.net>
	<20100107045514.GF2847@yookeroo> <4B46176F.2040600@freescale.com>
	<fa686aa41001122204w3ce1a31m7debe52a4b5d4fc7@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305988946@az33exm25.fsl.freescale.net>
	<fa686aa41001130627g7ed3bd46p6ac50631576d89ef@mail.gmail.com>
	<4B4E01A8.5070509@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B4E01A8.5070509-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Gala Kumar-B11780 <B11780-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2010 at 10:23 AM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrot=
e:
> Grant Likely wrote:
>>
>> On Wed, Jan 13, 2010 at 7:19 AM, Yoder Stuart-B08248
>> <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>>>>
>>>> It does not sound sane or
>>>> particularly parseable to stuff it into bitfields within the second
>>>> cell.
>>>
>>> I think it is somewhat sane compared to the alternatives. =A0The
>>> second cell encodes information about the interrupt source. =A0Allowing
>>> some of those bits to encode information besides level/sense
>>> doesn't seem that difficult.
>>
>> Not difficult. =A0Ugly, unnecessary, and sounds like a premature
>> optimization.
>
> It is not optimization, but functionality.

I don't doubt you need the data.  What I object to is stuffing it all
into a single cell since I think it is an unneeded optimization that
also makes it less user friendly.

>>>> Users have enough trouble parsing irq specifiers as is. =A0It makes me
>>>> nervous to see even more complicated irq specifiers being devised.
>>>
>>> Yes, they become slightly more complicated, but the complexity needs to
>>> go somewhere.
>>
>> Then at the very least do it as separate cells. =A0Carving cells into
>> multiple fields is pretty ugly when cells are cheap.
>
> That means that all the interrupt specifiers in an existing tree have to =
be
> updated with the larger numer of cells whenever such an interrupt is adde=
d,
> since #interrupt-cells applies globally to the MPIC interrupt domain. =A0=
It's
> unnecessary churn.

Pish.  You're talking about updating the interrupt properties in each
affected .dts file, and it only needs to be done when the new binding
is applied.  It will simply be adding a bunch of '0' cells to the
beginning of each existing interrupts property in the file.  Easy to
review, not a hard change to make, and easier to use/understand
binding for a long time to come.  BTW, how many .dts files do we
really have in the tree right now that will be using the new binding?
I'm guessing not many.  Heck, I'll even volunteer to make the change
in all affected .dts files when then new binding comes on-line.

Make the change now and don't burden us with a binding we'll be
cursing for the next 10 years.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
