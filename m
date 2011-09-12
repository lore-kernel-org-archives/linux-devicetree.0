From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Mon, 12 Sep 2011 10:53:23 -0700
Message-ID: <CAF6FioWhaddgCRRC70SpzWKtP-GjQagk7WxeVvRTRHvZaPtO6A@mail.gmail.com>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
	<20110908070716.GC15955@ponder.secretlab.ca>
	<20110908130109.GW30278@yookeroo.fritz.box>
	<CAF6FioWOuK3szFb8FD+_fde0HpZ0TJJXx51ZL=BAcZFSojRGCQ@mail.gmail.com>
	<20110909072532.GC9025@yookeroo.fritz.box>
	<CAF6FioVxYZW7grfwE1Q_FP5T95Omh9sqzAVyzsZr8EbfM6WV_Q@mail.gmail.com>
	<20110912004807.GH9025@yookeroo.fritz.box>
	<CAF6FioW9iY1JAEq5_vn0ZbHC81LBF7xN6JNzBVTbs+k19p2pRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAF6FioW9iY1JAEq5_vn0ZbHC81LBF7xN6JNzBVTbs+k19p2pRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Sun, Sep 11, 2011 at 10:09 PM, Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Sun, Sep 11, 2011 at 5:48 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> On Fri, Sep 09, 2011 at 11:37:51AM -0700, Anton Staaf wrote:
>>> On Fri, Sep 9, 2011 at 12:25 AM, David Gibson
>>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>> > On Thu, Sep 08, 2011 at 11:30:42PM -0700, Anton Staaf wrote:
>> [snip]
>>> > I supposed modifying your suggestion, but combining with our existing
>>> > convention for "reserved words" we could do:
>>> >
>>> > =A0 =A0 =A0 =A0prop =3D /uint8/ <0xab 0xcd>;
>>> >
>>> > I don't love it, but it's about the best I've come up with yet. =A0And
>>> > in particular it's probably the variant I'd be least upset to carry
>>> > around as legacy if we come up with a better way in future.
>>>
>>> Yes, I like this better than my suggestions of using !. =A0I wasn't sure
>>> if the /.../ syntax was something that was going to be allowed in
>>> property definitions. =A0One other option working from this could be:
>>>
>>> property =3D /size/ 8 <0xab 0xcd>;
>>
>> I quite like that idea.
>
> OK, I can take a look at writing up a patch to add this. =A0Unless it
> was something anyone else wanted to do. =A0:)
>
> -Anton

So, I've done some looking into an implementation of the /size/
syntax.  Here's what I'm thinking so far:

1) Parsing /size/ and the subsequent literal are easy, we knew this already.

2) The phandle references are a problem.  They are fixed up in
checks.c:fixup_phandle_references and that function expects that there
is 32-bits of space (sizeof(cell_t)) available to write the phandle
into.

3) Communicating the current size of the cells from the parser rule
that reads the DT_SIZE and DT_LITERAL to the parser rule that reads
the cellval requires either some auxiliary data or an explosion of the
parser rules (one per size we want to support).  Obviously the latter
is bad.

So, one solution to the above problems is to disallow phandle
references in anything other than a uint32 cell list, and to augment
the "data" struct to include the current cell size.  This can be used
to reject any attempts to add a REF_PHANDLE marker when the cell size
is not 32-bits.  The fixup code in checks.c would then never encounter
a REF_PHANDLE in a location that didn't have enough space reserved for
it.  A slight modification of the above could be to allow a
REF_PHANDLE any time the current cell size is greater than 32 bits.

Other solutions include always appending 32-bits and adding the
REF_PHANDLE, no matter the current size of the cell.  Or always adding
the minimum of 32-bits or the current size of the cell.

Updating the current cell size will also be a trick.  The parser rules
will need to be split up a bit I think so that once the DT_SIZE and
DT_LITERAL are read the current cell size can be updated and then the
celllist can be read.

In any of these solutions I think we still need to track the current
cell size in the data struct.

I don't see any problem with adding LABEL markers to cell lists of
size smaller than 32-bits.

Thoughts?

Thanks,
    Anton

>>> It has the advantage of limiting the number of reserved words created.
>>> =A0It could also be:
>>>
>>> property =3D /type/ uint8 <0xab 0xcd>;
>>
>> Not so fond of this one. =A0The "uint8" would have to be some new
>> lexical type - "identifed" probably, which we'd then have to look up.
>>
>>> Which would allow us to define new types for cell lists without adding
>>> new syntax. =A0I'm not sure if this is too useful though because the
>>> only types that I can think of that are not summed up by their size
>>> are things like float and double...
>>
>> Yeah, it's my feeling that the < > symtax should remain for integer
>> arrays. =A0If we need something for other types in future, we should
>> define new, distinct syntax for that when the time comes.
>>
>>> But it does have a nice look to
>>> it in my opinion. =A0And I would assume that if the /type/ <typename>
>>> was left off it would default to a uint32_t cell list. =A0So the
>>> additional verbosity of having to indicate it's a different type and
>>> what the type is will only be needed in a few instances.
>>
>> Yes.
>>
>> --
>> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music=
 baroque, and my code
>> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ =
_other_
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _=
around_!
>> http://www.ozlabs.org/~dgibson
>>
>
