From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] Add character literal parsing in bytestrings
Date: Wed, 20 Jul 2011 09:50:43 -0700
Message-ID: <CAF6FioX-yYwd3FN106yCwJQD7N27J9XSiUseFHuhTWJGeq3pvw@mail.gmail.com>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<1308871239-32683-2-git-send-email-robotboy@chromium.org>
	<20110720134006.GJ6399@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110720134006.GJ6399-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Wed, Jul 20, 2011 at 6:40 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jun 23, 2011 at 04:20:38PM -0700, Anton Staaf wrote:
>> This adds support for parsing simple (non-escaped) 'x' character
>> literal syntax in bytestrings. =A0For example:
>>
>> =A0 =A0 property =3D ['a' 2b 'c'];
>>
>> is equivalent to:
>>
>> =A0 =A0 property =3D [61 2b 62];
>
> Hrm. =A0I like the idea of being able to encode character literals.
> However I'm dubious as to whether the bytestring syntax is the right
> place to encode them.
>
> Bytestrings are quite lexically strange, they are quite different from
> the < ... > cell syntax: the things inside default to hex, and spacing
> is irrelevant ([abcd] is equivalent to [ab cd], [a bc] is a syntax
> error and *not* equivalent to [0a bc]). =A0This makes me worry about
> possible ambiguities or other parsing problems if we put something
> other than exactly 2 digit hex bytes in there - not that I can see any
> definite ambiguities in this proposal.

As you point out below, the < ... > syntax doesn't permit byte values
(a cell is 32 bits).  So using the cell list syntax would create a lot
of wasted space.  Especially in my use where I need to create four 128
byte tables for keyboard scan code mapping.  It would end up wasting
>1KB.  Adding cell size control syntax would certainly solve that
problem.  Is this something your interested in pursuing at this time,
I'd be happy to help with that instead of continuing to push this.

Alternatively, I think it is clear that there are no problems parsing
out the character literals.  Mainly because the ' character is unique
and will never otherwise occur as a character in a byte literal
declaration.  The occurrence or lack there of of white space should
also not be a problem, since the character literal parsing is of a
fixed length, thus there is no possibility for an ambiguous use such
as ' ab '.  Also, the invalid use [a bc] is still invalid with
character literals added, for example [a 'b'] or [a'b'] are both
invalid because the existing bytestring regex only matches two hex
characters in a row, and the new character literal regex only matches
a single character bounded by single quotes.  So neither regex will
match the lone a character and parsing will fail there.

> I have for some time been intending to introduce some variant of the
> < > syntax which allows for different sized entries (1, 2 or 8 bytes
> instead of the default 4). =A0I just haven't thought of a nice syntax
> for it yet. =A0Character literals would fit just fine into that scheme.
>
> The other possibility would be to allow something like 'abcd' without
> any special context to be a non-NULL-terminated "string". =A0I'm also a
> bit dubious about that on the "be like C" principle, which has served
> us pretty well in the past.

Yes, I would also shy away from such a construct.  I think it violates
the principal of least surprise.  Though admittedly, the byte string
syntax does that already...

Thanks,
    Anton
