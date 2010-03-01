From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 01 Mar 2010 15:06:20 -0600
Message-ID: <4B8C2C4C.8070901@freescale.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com><1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca><20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo><fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41002221359m4d857e4cn3a1c56c32a24d21d@mail
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4288fc0b-79a4-42fd-9e77-573dbad79210-RaUQJvECHiuXHCJdrdq+zrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Stephen Neuendorffer wrote:
> One thing I've seen in the past is that there is a sequentialization question in this, which becomes
> more apparent once deletion is allowed.
> 
> First off, my assumption is that each node name is always unique in a tree, even when overrides are allowed.
> Otherwise the sub-node and property ordering becomes important.
> 
> foo {
> 	bar = 2;
> 	bar = 3; // Illegal
> } ;
> 
> 
> foo {
> 	bar = 2;
> } 
> foo {
> 	bar = 3; // Legal
> };
> 
> 
> So, essentially, sequentialization of operation is forced by the concatenation of trees.

Hmm, I'd think it would be useful to e.g. include a template and subsequently 
modify it within the same node, rather than a more verbose and error-prone 
process of referencing labels later.

If sequential operations within a tree are supported, I'm not sure that there's 
any remaining need for separate top-level trees -- you could express the same 
thing as top-level property/node redefinitions.

What are the problems with supporting this?

> foo {
> 	bar-label: bar = 2;
> }
> delete(&bar-label);  // Legal.
> foo {
> 	bar-label: bar = 4;  // Legal, even though previously deleted
> }

Is it legal to reuse the label, even though it sort of points to the same spot?

If you don't reuse the label, but bar is redefined, where does bar-label point?

Do all labels to nodes in separate trees that end up referring to the same node 
in the final tree have the same phandle?  Are they interchangeable in subsequent 
delete commands?

> One trick is that the below is problematic, or at least hard to verify statically.
> 
> foo {
> 	delete(&bar-label); // Legal.
> 	delete(bar); // May or may not be Illegal, since don't know what bar-label references
> }

That raises the question of whether it's legal to delete things that aren't 
there.  There may be cases where a dts fragment A doesn't know whether fragment 
B will have defined something, and fragment A wants to make sure it ends up 
undefined one way or another.

> So, to syntax: the sequentialization property may be more syntactically obvious if deletion resembles
> setting a property or node like:
> 
>  ^bar
>  !bar
> or even
>   bar = !;
>   bar !;

What specifically is made more obvious?  Using symbols rather than names seems 
more cryptic to me.

Only the "bar = !" form seems to clearly indicate that, for the purposes of this 
particular tree, you're assigning some special placeholder to bar rather than 
performing an immediate action.  That could just as well be done with something 
like "bar = /delete-prop/".

I'd rather make them actually behave like immediate commands, though.

> Which brings up the question 'undeletion question'.  Can you do:
> 
> d-label: delete(bar);
> delete(&d-label);

I'd say no -- delete operates on data, not commands.

-Scott
