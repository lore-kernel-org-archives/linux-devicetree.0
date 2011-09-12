From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Mon, 12 Sep 2011 10:48:07 +1000
Message-ID: <20110912004807.GH9025@yookeroo.fritz.box>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
	<20110908070716.GC15955@ponder.secretlab.ca>
	<20110908130109.GW30278@yookeroo.fritz.box>
	<CAF6FioWOuK3szFb8FD+_fde0HpZ0TJJXx51ZL=BAcZFSojRGCQ@mail.gmail.com>
	<20110909072532.GC9025@yookeroo.fritz.box>
	<CAF6FioVxYZW7grfwE1Q_FP5T95Omh9sqzAVyzsZr8EbfM6WV_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioVxYZW7grfwE1Q_FP5T95Omh9sqzAVyzsZr8EbfM6WV_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2011 at 11:37:51AM -0700, Anton Staaf wrote:
> On Fri, Sep 9, 2011 at 12:25 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Sep 08, 2011 at 11:30:42PM -0700, Anton Staaf wrote:
[snip]
> > I supposed modifying your suggestion, but combining with our existing
> > convention for "reserved words" we could do:
> >
> > =A0 =A0 =A0 =A0prop =3D /uint8/ <0xab 0xcd>;
> >
> > I don't love it, but it's about the best I've come up with yet. =A0And
> > in particular it's probably the variant I'd be least upset to carry
> > around as legacy if we come up with a better way in future.
> =

> Yes, I like this better than my suggestions of using !.  I wasn't sure
> if the /.../ syntax was something that was going to be allowed in
> property definitions.  One other option working from this could be:
> =

> property =3D /size/ 8 <0xab 0xcd>;

I quite like that idea.

> It has the advantage of limiting the number of reserved words created.
>  It could also be:
> =

> property =3D /type/ uint8 <0xab 0xcd>;

Not so fond of this one.  The "uint8" would have to be some new
lexical type - "identifed" probably, which we'd then have to look up.

> Which would allow us to define new types for cell lists without adding
> new syntax.  I'm not sure if this is too useful though because the
> only types that I can think of that are not summed up by their size
> are things like float and double... =


Yeah, it's my feeling that the < > symtax should remain for integer
arrays.  If we need something for other types in future, we should
define new, distinct syntax for that when the time comes.

> But it does have a nice look to
> it in my opinion.  And I would assume that if the /type/ <typename>
> was left off it would default to a uint32_t cell list.  So the
> additional verbosity of having to indicate it's a different type and
> what the type is will only be needed in a few instances.

Yes.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
