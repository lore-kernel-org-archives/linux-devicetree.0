From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Power.org:parch] Re: RFC: proposal to extend the open-pic
	interrupt specifierdefinition
Date: Mon, 18 Jan 2010 11:44:12 -0600
Message-ID: <4B549DEC.2000400@freescale.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<20100107005036.GB23206@yookeroo>
	<9696D7A991D0824DBA8DFAC74A9C5FA305987E61@az33exm25.fsl.freescale.net>
	<20100107045514.GF2847@yookeroo> <4B46176F.2040600@freescale.com>
	<fa686aa41001122204w3ce1a31m7debe52a4b5d4fc7@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305988946@az33exm25.fsl.freescale.net>
	<fa686aa41001130627g7ed3bd46p6ac50631576d89ef@mail.gmail.com>
	<4B4E01A8.5070509@freescale.com>
	<fa686aa41001162313u28ef0fb4s328ebc25bf5e551f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41001162313u28ef0fb4s328ebc25bf5e551f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Gala Kumar-B11780 <B11780-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Wed, Jan 13, 2010 at 10:23 AM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> Grant Likely wrote:
>>> On Wed, Jan 13, 2010 at 7:19 AM, Yoder Stuart-B08248
>>> <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>>>>> It does not sound sane or
>>>>> particularly parseable to stuff it into bitfields within the second
>>>>> cell.
>>>> I think it is somewhat sane compared to the alternatives.  The
>>>> second cell encodes information about the interrupt source.  Allowing
>>>> some of those bits to encode information besides level/sense
>>>> doesn't seem that difficult.
>>> Not difficult.  Ugly, unnecessary, and sounds like a premature
>>> optimization.
>> It is not optimization, but functionality.
> 
> I don't doubt you need the data.  What I object to is stuffing it all
> into a single cell since I think it is an unneeded optimization that
> also makes it less user friendly.

I'm fine with four cells (int config type subtype) if that's the 
consensus -- it's hard to guess in advance what will go over well.  User 
friendliness can be subjective.

>>>>> Users have enough trouble parsing irq specifiers as is.  It makes me
>>>>> nervous to see even more complicated irq specifiers being devised.
>>>> Yes, they become slightly more complicated, but the complexity needs to
>>>> go somewhere.
>>> Then at the very least do it as separate cells.  Carving cells into
>>> multiple fields is pretty ugly when cells are cheap.
>> That means that all the interrupt specifiers in an existing tree have to be
>> updated with the larger numer of cells whenever such an interrupt is added,
>> since #interrupt-cells applies globally to the MPIC interrupt domain.  It's
>> unnecessary churn.
> 
> Pish.  You're talking about updating the interrupt properties in each
> affected .dts file, and it only needs to be done when the new binding
> is applied.  It will simply be adding a bunch of '0' cells to the
> beginning of each existing interrupts property in the file.

More likely the end -- putting it at the beginning *will* break existing 
code and require software to know which binding it is dealing with.

And don't forget interrupt-maps (which are hard enough to read as is, 
due to too many cells with no delimiters of logical groupings), or 
interrupts properties with more than one interrupt.

> Easy to
> review, not a hard change to make, and easier to use/understand
> binding for a long time to come.  BTW, how many .dts files do we
> really have in the tree right now that will be using the new binding?

One that will need it, and a bunch of others that might want to use it 
either to describe things like MPIC timers or message register 
interrupts, or to be able to share device tree source fragments with 
newer chips if that effort ever gets revived.

-Scott
