From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: new device tree binding review process idea
Date: Thu, 8 Apr 2010 08:04:32 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305CAFFD0@az33exm25.fsl.freescale.net>
References: <fa686aa41003252213w3f403d42pea3c8c88adbf5832@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305CAFB62@az33exm25.fsl.freescale.net>
	<m2nfa686aa41004061248w8e5fad71sb7d1871c80787d9c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <m2nfa686aa41004061248w8e5fad71sb7d1871c80787d9c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> MediaWiki does support XML exporting for off-line editing (one of the
> reasons I chose mediawiki), so we could have a canned xml export of
> approved bindings into a git repo somewhere.  Being able to generate
> an off-line copy is something I think is important.

If there are ways to export the binding text, then that addresses
my concern for the most part.

> Mediawiki search is pretty good, and google will crawl it, so they can
> be used as a secondary search tool.  :-)
> =

> > So, my vote would be to require a plain text format/template
> > that should be used with no Mediawiki markup. =A0The binding
> > would be posted on the wiki between <pre></pre> tags.
> >
> > The plain text will give some flexibility in how the binding
> > could be used in other contexts.
> =

> Personally, I like the idea of using some basic markup, whether it be
> mediawiki or something else.  Originally, I considered using gitwiki
> which stores everything in a git repo, and uses the markdown markup
> format.  I like the idea of anyone being able to clone the repo and
> editing it offline.  However, git-wiki is pretty immature, and I don't
> want to get into the business of maintaining wiki code.
> =

> By using some form of markup, it adds some level of context to the
> binding text which can be used to reformat into other forms, while
> still remaining readable in plain text (with the possible exception of
> tables).  Filters can easily be written to transform from one markup
> to another as needed.
> =

> Mediawiki is as readable as any, and it's got the advantage of a
> stable and well supported application behind it.  I've used mediawiki
> for a while now, and it's pretty much proven that it scales well, and
> does a good job of handling off-line edits.  Although I would agree
> that it makes sense to define a binding template and formating guide
> to keep things looking uniform and readable.

Ok.  I do think that the wiki formatting will keep things a bit more
readable via web browsers, which will be the primary way people
are reading this.

I do have a few ideas/suggestions for a binding template that I =

will post for comments soon.

> >> * Authors and reviews should work toward a consensus on =

> the binding.
> >> * When consensus is reached, ask one of the device tree binding
> >> maintainers mark the binding as 'approved'.
> >> * '''(TBD: who are the maintainers going to be? =A0How does someone
> >> contact the maintainers)'''
> >
> > To start with I think each company should designate a maintainer
> > for company-specific bindings.
> =

> s/designate/nominate/
> =

> Following the Linux lead, I want the caveat that a company doesn't
> automatically get to select the maintainer for their parts.  If
> someone shows competence and interest in a particular area, then I've
> got no problem with him or her being a maintainer regardless of who
> that person works for.  The reverse is also true; someone who hasn't
> already been involved with binding documentation and review should not
> get to be maintainer.

I agree.

Stuart
