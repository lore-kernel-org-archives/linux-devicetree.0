From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: RFC: proposal to extend the open-pic interrupt specifier
	definition
Date: Mon, 18 Jan 2010 11:11:39 -0600
Message-ID: <4B54964B.7040402@freescale.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<50433.84.105.60.153.1263320254.squirrel@gate.crashing.org>
	<9696D7A991D0824DBA8DFAC74A9C5FA305988778@az33exm25.fsl.freescale.net>
	<fa686aa41001122206l232b270er58323a6409e575e9@mail.gmail.com>
	<4B4E0AC7.7090502@freescale.com>
	<fa686aa41001162306x7c4e3dedy196409a4c8420e35@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41001162306x7c4e3dedy196409a4c8420e35-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Wed, Jan 13, 2010 at 11:02 AM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> Grant Likely wrote:
>>> It's not worth toying with.  Just create a new compatible value for this
>>> new binding and be done with
>>> it.  When a driver gets modified to handle the new behaviour, then it
>>> can be also changed to bind against the new compatible value too.
>> I agree that a new compatible is warranted from a theoretical perspetive,
>> though from a practical compatibility perspective one should consider the
>> odds of something breaking because old code chokes on the new bits, versus
>> the old code not recognizing the new compatible and thus not binding the
>> device at all.
> 
> Letting old drivers bind against new bindings that aren't actually
> the same isn't good practice and leaves little recourse if we really
> do need to differentiate between them in the future. Teaching the 
> current driver to match against the new value is a one line change. 
> Choosing a new compatible value is so inexpensive, trivial, and safe 
> that I think it is a no-brainer decision.

Yes, I said that it's theoretically a bad thing to do, but in practice I 
really don't see what it would break that wouldn't be just as broken by 
a change in compatible -- unless we leave in the device_type that the 
kernel actually binds on at the moment :-P -- and I can see cases where 
it would improve compatibility.  Making that one-line change without a 
time machine won't stop the e-mails asking why an old kernel won't boot 
with a new device tree, especially if we ever get to the point where 
we're sharing device tree source fragments and don't want to keep 
separate old-binding and new-binding fragments for each device.

I really don't see anyone supporting both bindings and doing something 
different with one versus the other.  It's not like we're talking about 
leaving out chip information where there might be hardware quirks to be 
dealt with.  It's just a use of previously unused bits (check against 
zero if you care), or additional cells (check #interrupt-cells if you 
care).  The only thing that makes it a bit questionable is the ambiguity 
about whether the existing values are the low two bits of a cell, or a 
whole-cell enumeration of configurations -- the odd, non-orthogonal 
encoding does point to the latter.

>> Is there any interest in standardizing this with a new compatible, or should
>> it be FSL-only?
> 
> Instead of trying to come up with a new "generic/standard" compatible
> value, just adopt the name of the first part to use the new binding as
> the standard compatible value.  If the binding catches on then great,
> new parts will just claim compatibility with the old.

Assuming new parts are compatible with the previous part, which is less 
likely than being compatible with the base openpic design.

But even if there's nothing generic to match on, it would be nice if 
different openpic implementations didn't do gratuitously different 
things in their bindings, hence the RFC.

> This also has the advantage of the meaning of a fsl,p4080-mpic
> compatible device is grounded in some real piece of hardware, not in
> something made up who's definition can change over time.

Because nothing ever changes in new chip revisions of the same name. :-)

-Scott
