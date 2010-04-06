From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: new device tree binding review process idea
Date: Tue, 6 Apr 2010 13:48:24 -0600
Message-ID: <m2nfa686aa41004061248w8e5fad71sb7d1871c80787d9c@mail.gmail.com>
References: <fa686aa41003252213w3f403d42pea3c8c88adbf5832@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305CAFB62@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA305CAFB62-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stewart, thanks for the feedback.  Comments below...

On Tue, Apr 6, 2010 at 9:04 AM, Yoder Stuart-B08248
<B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> Device tree 'bindings' document how individual devices are described
>> in the device tree. =A0For any given device, the binding says what
>> properties and nodes a device driver needs to use the device.
>>
>> This page documents the process for writing and reviewing new
>> bindings. =A0New bindings are written for new devices that cannot be
>> handled by existing bindings.
>>
>> =3D=3D Creating a new draft binding =3D=3D
>> * New draft bindings shall be written in plain-text format using the
>> Mediawiki markup language, ideally as a new page in this wiki.
>
> I think the review and approval process looks good, no issues
> with it.
>
> I do question whether we want bindings created in Mediawiki markup
> languages vs just plain text.
>
> I've created a couple of example bindings based on the ePAPR
> ns16550 binding (using a binding template we have been using
> internally at Freescale for a couple of years):
>
> Plain text: http://fdt.secretlab.ca/Compatible%3Dsry,ns16550-v1
>
> Mediawiki: http://fdt.secretlab.ca/Compatible%3Dsry,ns16550-v2
>
> You could get a lot more fancy than that and use tables or
> something, but the more Mediawiki-ized the text gets the harder
> it to review the source text on a mailing list.

I'm not sure I agree.  I find the mediawiki markup pretty readable.
We can also enforce some rules like "keep text to 80 chars", or "don't
reflow existing text" so that diffs remain sane.

Something I haven't verified yet is whether it is possible to get
MediaWiki to generate unified instead of side-by-side diffs.  If
cannot, then I don't expect it would be too hard to add.  I want to
make it as easy as possible to go from the wiki to an email for
requesting review.

> Another thing to consider is whether eventually we want to
> maintain approved bindings in git. =A0It would be convenient
> to do a git clone of a device-tree-bindings.git repo, be able to
> grep it, etc. =A0Say you want to find all bindings that use
> a certain property. =A0 I'm not sure how good the Mediawiki
> search is.

I've got the entire wiki (php & database) backed up into a git repo,
but I can't really publish it because it also contains all user
account information.  I do want to replicate it somehow in case I get
hit by a bus, or hired by Microsoft, or something equally nasty.

MediaWiki does support XML exporting for off-line editing (one of the
reasons I chose mediawiki), so we could have a canned xml export of
approved bindings into a git repo somewhere.  Being able to generate
an off-line copy is something I think is important.

Mediawiki search is pretty good, and google will crawl it, so they can
be used as a secondary search tool.  :-)

> So, my vote would be to require a plain text format/template
> that should be used with no Mediawiki markup. =A0The binding
> would be posted on the wiki between <pre></pre> tags.
>
> The plain text will give some flexibility in how the binding
> could be used in other contexts.

Personally, I like the idea of using some basic markup, whether it be
mediawiki or something else.  Originally, I considered using gitwiki
which stores everything in a git repo, and uses the markdown markup
format.  I like the idea of anyone being able to clone the repo and
editing it offline.  However, git-wiki is pretty immature, and I don't
want to get into the business of maintaining wiki code.

By using some form of markup, it adds some level of context to the
binding text which can be used to reformat into other forms, while
still remaining readable in plain text (with the possible exception of
tables).  Filters can easily be written to transform from one markup
to another as needed.

Mediawiki is as readable as any, and it's got the advantage of a
stable and well supported application behind it.  I've used mediawiki
for a while now, and it's pretty much proven that it scales well, and
does a good job of handling off-line edits.  Although I would agree
that it makes sense to define a binding template and formating guide
to keep things looking uniform and readable.

>
>> * Authors and reviews should work toward a consensus on the binding.
>> * When consensus is reached, ask one of the device tree binding
>> maintainers mark the binding as 'approved'.
>> * '''(TBD: who are the maintainers going to be? =A0How does someone
>> contact the maintainers)'''
>
> To start with I think each company should designate a maintainer
> for company-specific bindings.

s/designate/nominate/

Following the Linux lead, I want the caveat that a company doesn't
automatically get to select the maintainer for their parts.  If
someone shows competence and interest in a particular area, then I've
got no problem with him or her being a maintainer regardless of who
that person works for.  The reverse is also true; someone who hasn't
already been involved with binding documentation and review should not
get to be maintainer.

BTW, I haven't forgotten about the comments you made about a year ago
about the wiki regarding licensing.  It's still on my todo list to act
on them.  :-/  Soon, I promise.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
