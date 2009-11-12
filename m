From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: PCI bus node location
Date: Thu, 12 Nov 2009 13:08:31 +1100
Message-ID: <20091112020831.GL3235@yookeroo.seuss>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
	<20091110031218.GG26042@yookeroo.seuss>
	<839C8AA0-A8B5-434E-9175-16D2B84D74BD@semihalf.com>
	<20091110234412.GA3235@yookeroo.seuss>
	<C75E76CB-73F3-4448-B643-364304ABB364@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C75E76CB-73F3-4448-B643-364304ABB364-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 11, 2009 at 03:17:52PM +0100, Rafal Jaworowski wrote:
> 
> On 2009-11-11, at 00:44, David Gibson wrote:
> 
> >On Tue, Nov 10, 2009 at 05:55:33PM +0100, Rafal Jaworowski wrote:
> >>On 2009-11-10, at 04:12, David Gibson wrote:
> >>>On Mon, Nov 09, 2009 at 07:36:57PM -0700, Grant Likely wrote:
> >>>>On Mon, Nov 9, 2009 at 12:20 PM, Rafal Jaworowski
> >[snip]
> >>>Right.
> >>>
> >>>Under the new scheme, the "soc" node is really a historical
> >>>misnomer -
> >>>it represents just the things within the IMMR, not everything on the
> >>>SoC.  A number of chips also have the localbus controller as a
> >>>separate node, likewise within the SoC but not within the
> >>>IMMR, so not
> >>>a child of the soc node.
> >>
> >>Hm, how do we know whether something belongs under the IMMR/CCSR
> >>node or not (even though it physically sits there :-)?
> >
> >Well, the basic criterion is whether its registers are relocated with
> >the rest of the IMMR.  Which would cover the PCI control registers, of
> >course, but they're not there for the reasons given.  Yes, it's kind
> >of nasty.
> 
> It seems like the soc/simple-bus node is currently a rather
> arbitrary subset of peripherals available through SOC internal
> registers range. My concern is that without clear grouping criteria
> this is quite confusing.

It's not arbitrary.  It's everything whose registers lie in the
movable IMMR region, except those that have a reason to be outside.
With the reason to be outside being that they control the bridging of
address ranges that are *not* in the IMMR.

> >>Is the 'soc' node going to be named something less confusing then?
> >
> >I think it should, but it's difficult to change because u-boot has
> >dependencies on it.  I think there are a few newer trees where it's
> >named IMMR.
> 
> So is device_type = "soc" deprecated now for new trees, and for this
> kind of a bus node the only legit differentiator is the compatible =
> "simple-bus" prop?

Uh.. well.  It's sort of in that odd half-way house.  It's fairly
widely acknowledged that there are problems with that representation,
but a new better one has not yet been articulated sufficiently clearly
to formally deprecate the old way.  It is after all better to keep
with the old way until we do have a new method that is clearly better,
in order to keep down the number of old deprecated formats we need to
deal with eventually.

> BTW: in ePAPR examples there is device_type = "simple-bus" in a 8572
> soc node, is this a bug or a leftover?

That would be a bug.  I'll add it to my list of things to point out in
the ePAPR revision / errata process.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
