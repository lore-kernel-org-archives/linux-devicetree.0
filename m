From: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Fri, 15 Oct 2010 13:35:56 -0700
Message-ID: <1287174956.4535.1414.camel@riker>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
	<21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
	<20101015151840.GB32705@angua.secretlab.ca>
	<b04d95cc-c35b-4597-8fbe-f7c48f23ef92@VA3EHSMHS036.ehs.local>
	<AANLkTinPWv94Xoz+mDxiE=KujQYAyQj9PsPWHEORypJ3@mail.gmail.com>
	<eba820f8-3e4f-4d57-9024-39cc562a99eb@VA3EHSMHS012.ehs.local>
	<AANLkTikWfMXEbdwFY6FNoMwuD6fC74Kohtr3QRJqSrM0@mail.gmail.com>
	<ed27a45d-3607-41e3-831f-1d7e3dd44379@SG2EHSMHS003.ehs.local>
	<AANLkTikzyDFiQZzPmeos6pf_DS33RvkfER+Mz0jceSJy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikzyDFiQZzPmeos6pf_DS33RvkfER+Mz0jceSJy-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2010-10-15 at 14:11 -0600, Grant Likely wrote:
> On Fri, Oct 15, 2010 at 1:59 PM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> >
> >
> >> -----Original Message-----
> >> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant Likely
> >> Sent: Friday, October 15, 2010 12:56 PM
> >> To: Stephen Neuendorffer
> >> Cc: David Gibson; John Bonesio; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >> Subject: Re: Proposal: new device-tree syntax and semantics for extendinginformation from included dts
> >> files
> >>
> >> On Fri, Oct 15, 2010 at 1:48 PM, Stephen Neuendorffer
> >> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> >> >
> >> >
> >> >> -----Original Message-----
> >> >> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant Likely
> >> >> Sent: Friday, October 15, 2010 12:33 PM
> >> >> To: Stephen Neuendorffer
> >> >> Cc: David Gibson; John Bonesio; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >> >> Subject: Re: Proposal: new device-tree syntax and semantics for extendinginformation from included
> >> dts
> >> >> files
> >> >>
> >> >> On Fri, Oct 15, 2010 at 10:10 AM, Stephen Neuendorffer
> >> >> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> >> >> >
> >> >> >
> >> >> >> -----Original Message-----
> >> >> >> From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant
> >> >> > Likely
> >> >> >> Sent: Friday, October 15, 2010 8:19 AM
> >> >> >> To: Stephen Neuendorffer
> >> >> >> Cc: David Gibson; John Bonesio; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >> >> >> Subject: Re: Proposal: new device-tree syntax and semantics for
> >> >> > extendinginformation from included dts
> >> >> >> files
> >> >> >>
> >> >> >> On Thu, Oct 14, 2010 at 09:38:44AM -0700, Stephen Neuendorffer wrote:
> >> >> >> [fixed quoting header]
> >> >> >> > On Wed, Oct 13, 2010 5:46 PM, David Gibson wrote:
> >> >> >> > > On Wed, Oct 13, 2010 at 04:41:59PM -0700, Stephen Neuendorffer
> >> >> > wrote:
> >> >> >> > > [snip]
> >> >> >> > > > Or better yet, outside of the braces?
> >> >> >> [...]
> >> >> >> > > >             /remove/ {
> >> >> >> > > >                                 serial@2600 { };
> >> >> > // PSC4
> >> >> >> > > >
> >> >> >> > > >                                 serial@2800 { };
> >> >> > // PSC5
> >> >> >> > > >                 };
> >> >> >> > >
> >> >> >> > > Um.. no.  That makes even less sense in the conceptual framework
> >> >> > of a
> >> >> >> > > stack of overlays.
> >> >> >> >
> >> >> >> > Why exactly?  Instead of being a stack of overlays, it seems to me
> >> >> > like
> >> >> >> > a stack of trees with operators..
> >> >> >> > The point is exactly that operators make most sense at the stack of
> >> >> >> > trees level and not
> >> >> >> > at the individual node level.
> >> >> >>
> >> >> >> I don't think I'm understanding what you're trying to say.  How do you
> >> >> > differentiate "stack of
> >> >> >> overlays" and "stack of trees"?
> >> >> >>
> >> >> >> The reason I don't like this approach is that in many cases many
> >> >> >> things will need to be changed by a single overlay, and not all those
> >> >> >> changes will be the same operation.  For example, an overlay for a
> >> >> >> board could add a bunch of nodes for i2c devices, and at the same time
> >> >> >> remove an unused spi bus device.
> >> >> >
> >> >> > So why not have two trees stacked to do the job?
> >> >>
> >> >> Umm, isn't the suggestion currently on the table?
> >> >>
> >> >> >> The "stack of overlays" conceptual model that we've settled on uses
> >> >> >> the concept that subsequent top level trees stack on top of the
> >> >> >> preceding tree and can mask out or add/change nodes and properties.
> >> >> >> The trees are merged together before going on to the next top level
> >> >> >> tree.
> >> >> >>
> >> >> >> g.
> >> >> >>
> >> >> >
> >> >> > I guess I'm stuck on 'overlay' to me implies '/extend/', so I associate
> >> >> > the operations being on trees, not individual nodes.
> >> >> > (Although, there's still the tough part about /remove-node/ vs
> >> >> > /remove-property/,
> >> >> > which might meant that the operations have to be in the trees to
> >> >> > distinguish that).
> >> >>
> >> >> Yes, the operations would need to be on the individual nodes; whether
> >> >> operating on the top level node, or on one of the child nodes.  I
> >> >> think some examples are in order....
> >> >>
> >> >> Just for argument, I'm going to assume that we define two new
> >> >> keywords; /trim-property/ and /trim-node/.  The sole purpose of
> >> >> /trim-property/ is to remove a property.  /trim-node/ can be used
> >> >> either to either remove or replace a node.  We can still argue about
> >> >> the name and the ordering, but the principle remains the same.
> >> >>
> >> >> Example 1: using full tree overlay
> >> >> ---------
> >> >> The following .dts file:
> >> >>
> >> >>       / {
> >> >>               the-red: red {
> >> >>                       rgb = <255 0 0>;
> >> >>               };
> >> >>               the-blue: blue {
> >> >>                       rgb = <0 0 255>;
> >> >>                       favourite-colour;
> >> >>               };
> >> >>               the-green: green {
> >> >>                       rgb = <0 255 0>;
> >> >>               };
> >> >>       };
> >> >>
> >> >>       / {
> >> >>               blue {
> >> >>                       rgb = <0 0 127>;
> >> >>                       /trim-property/ favourite-color;
> >> >>               };
> >> >>
> >> >>               /trim-node/ green;
> >> >>
> >> >>               /trim-node/ red {
> >> >>                       vendor = "Benjamin Moore"
> >> >>               };
> >> >>       };
> >> >>
> >> >> This example uses only one overlay tree.  It removes (trims) the
> >> >> 'favourite-colour' property from the blue node.  It removes the
> >> >> green node outright, and it replaced the red node.
> >> >>
> >> >> Would be collapse to:
> >> >>
> >> >>       / {
> >> >>               the-red: red {
> >> >>                       vendor = "Benjamin Moore"
> >> >>               };
> >> >>               the-blue: blue {
> >> >>                       rgb = <0 0 127>;
> >> >>               };
> >> >>       };
> >> >>
> >> >> Example 2: using label references
> >> >> ---------
> >> >> The following .dts file:
> >> >>
> >> >>       / {
> >> >>               the-red: red {
> >> >>                       rgb = <255 0 0>;
> >> >>                       firebrick {
> >> >>                               rgb = <178 34 34>;
> >> >>                       };
> >> >>               };
> >> >>               the-blue: blue {
> >> >>                       rgb = <0 0 255>;
> >> >>                       favourite-colour;
> >> >>               };
> >> >>               the-green: green {
> >> >>                       rgb = <0 255 0>;
> >> >>               };
> >> >>       };
> >> >>
> >> >>       &the-red {
> >> >>               rgb = <127 0 0>;
> >> >>               pink {
> >> >>                       rgb = <255 192 203;
> >> >>               };
> >> >>               /trim-node/ firebrick {
> >> >>                       ugly-colour;
> >> >>               };
> >> >>       };
> >> >>
> >> >>       /trim-node/ &the-blue;
> >> >>
> >> >>       /trim-node/ &the-green {
> >> >>               shade = "radioactive slime"
> >> >>       };
> >> >>
> >> >> This example uses three overlay trees.  The first overlay
> >> >> modified the node pointed to by the label "the-red". It changes the
> >> >> rgb property, it adds a 'pink' node, and it *replaces* the firebrick
> >> >> node (by using both the /trim-node/ keyword and a set of { }  braces).
> >> >>
> >> >> The second removes the node pointed to by "the-blue".
> >> >>
> >> >> The third replaces the node pointed to by "the-green".
> >> >>
> >> >> This tree collapses to:
> >> >>
> >> >>       / {
> >> >>               the-red: red {
> >> >>                       rgb = <127 0 0>;
> >> >>                       pink {
> >> >>                               rgb = <255 192 203>;
> >> >>                       };
> >> >>                       firebrick {
> >> >>                               ugly-colour;
> >> >>                       };
> >> >>               };
> >> >>               green {
> >> >>                       shade = "radioactive slime"
> >> >>               };
> >> >>       };
> >> >>
> >> >> The /trim-node/ keyword in this model is valid at both the top level
> >> >> and inside a node.  Properties can never be defined at the top level,
> >> >> so /trim-property/ only makes sense inside a node.
> >> >
> >> > I think this all makes sense.. :)
> >> >
> >> > Maybe I can try to sum up in one sentence:
> >> > The mental model is still one of overlays, but if a /trim-*/ attribute is present
> >> > before a node or property, then the existing node or property is deleted before
> >> > continuing the overlay.
> >>
> >> Good summary.
> >>
> >> g.
> >
> > Does
> >
> > / {
> >     foo {
> >         bar;
> >     }
> > }
> >
> > mean add an empty attribute bar or reference a possibly existing node bar and don't do anything to it?
> > Or does it assert that a node bar exists?
> 
> It adds an empty attribute bar, or changes an existing bar property to be empty.
> 
> Both the forms "bar = foo;" and "bar;" always operate on a property.
> 
> foo {...}; is always a node.
> 
> The only exception is for the removal of a node.  ie. "/trim-node/
> foo;"  The primary reason being it be confusing to show the braces
> when the node will no longer exist.  There is also a syntactic
> difference between "/trim-node/ foo" and "/trim-node/ foo { }" where
> the former removes the node entirely and the later replaces it with an
> empty node.
> 
> The grammer remains parse-able because the syntax only comes into play
> when the /trim-node/ keyword appears at the beginning of a statement.
> 
> g.

This is where I think it might be better to have a different syntax for
removal of a node. Let me explain by giving a example.

One of the things that trips people up with the C language is the use of
= vs ==. It all seems good until you have:
if (x = 3) ...
It's too easy for people to miss that it's a single (=), instead of a
double (==). And the assignment in the if statement is valid. So
experienced programmers may do some things to prevent the mistake such
as
	if (3 = x) ... /* which gives an error with the wrong '=' */
or turning on "attila the warnings" in the compiler.

I think the proposed /trim-node/ syntax for removal is going to create
the same style of trip-up for people. When someone looks at
/trim-node/ foo { };
are they going to think the node is gone, or empty? Even if they know
the syntax, are they going to make mistakes overlooking an error,
thinking it looks right?

With the proposed, there's not even an obvious way someone can do
anything that will alert them to possible erroneous statements.

If we had:
/remove-node/ foo;

Then we could make the parser give an error on:
/remove-node/ foo {};

We could even possibly make
/trim-node/ foo;
an error.

This way there is less room for confusion or trip-ups.

What are your thoughts?
