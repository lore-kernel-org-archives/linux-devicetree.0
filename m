From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Sun, 11 Sep 2011 22:09:32 -0700
Message-ID: <CAF6FioW9iY1JAEq5_vn0ZbHC81LBF7xN6JNzBVTbs+k19p2pRg@mail.gmail.com>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
	<20110908070716.GC15955@ponder.secretlab.ca>
	<20110908130109.GW30278@yookeroo.fritz.box>
	<CAF6FioWOuK3szFb8FD+_fde0HpZ0TJJXx51ZL=BAcZFSojRGCQ@mail.gmail.com>
	<20110909072532.GC9025@yookeroo.fritz.box>
	<CAF6FioVxYZW7grfwE1Q_FP5T95Omh9sqzAVyzsZr8EbfM6WV_Q@mail.gmail.com>
	<20110912004807.GH9025@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110912004807.GH9025-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Sun, Sep 11, 2011 at 5:48 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Sep 09, 2011 at 11:37:51AM -0700, Anton Staaf wrote:
>> On Fri, Sep 9, 2011 at 12:25 AM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Thu, Sep 08, 2011 at 11:30:42PM -0700, Anton Staaf wrote:
> [snip]
>> > I supposed modifying your suggestion, but combining with our existing
>> > convention for "reserved words" we could do:
>> >
>> > =A0 =A0 =A0 =A0prop =3D /uint8/ <0xab 0xcd>;
>> >
>> > I don't love it, but it's about the best I've come up with yet. =A0And
>> > in particular it's probably the variant I'd be least upset to carry
>> > around as legacy if we come up with a better way in future.
>>
>> Yes, I like this better than my suggestions of using !. =A0I wasn't sure
>> if the /.../ syntax was something that was going to be allowed in
>> property definitions. =A0One other option working from this could be:
>>
>> property =3D /size/ 8 <0xab 0xcd>;
>
> I quite like that idea.

OK, I can take a look at writing up a patch to add this.  Unless it
was something anyone else wanted to do.  :)

-Anton

>> It has the advantage of limiting the number of reserved words created.
>> =A0It could also be:
>>
>> property =3D /type/ uint8 <0xab 0xcd>;
>
> Not so fond of this one. =A0The "uint8" would have to be some new
> lexical type - "identifed" probably, which we'd then have to look up.
>
>> Which would allow us to define new types for cell lists without adding
>> new syntax. =A0I'm not sure if this is too useful though because the
>> only types that I can think of that are not summed up by their size
>> are things like float and double...
>
> Yeah, it's my feeling that the < > symtax should remain for integer
> arrays. =A0If we need something for other types in future, we should
> define new, distinct syntax for that when the time comes.
>
>> But it does have a nice look to
>> it in my opinion. =A0And I would assume that if the /type/ <typename>
>> was left off it would default to a uint32_t cell list. =A0So the
>> additional verbosity of having to indicate it's a different type and
>> what the type is will only be needed in a few instances.
>
> Yes.
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
