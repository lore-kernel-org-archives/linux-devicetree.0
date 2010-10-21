From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] Create a new property value that means 'undefined'.
Date: Thu, 21 Oct 2010 08:20:59 -0700
Message-ID: <1287674459.4535.1555.camel@riker>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214522.2985.97224.stgit@riker>
	<20101021052053.GF13335@angua.secretlab.ca>
	<20101021061908.GK6227@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101021061908.GK6227@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2010-10-21 at 17:19 +1100, David Gibson wrote:
> On Wed, Oct 20, 2010 at 11:20:53PM -0600, Grant Likely wrote:
> > On Wed, Oct 20, 2010 at 02:45:22PM -0700, John Bonesio wrote:
> > > When updating existing nodes in a device tree merge operation, properties
> > > can be removed by setting the value to /undef-prop/.
> > > 
> > > if /undef-prop/ is assigned to a property that doesn't exist, the property
> > > is treated the same as if it had not been declared.
> > > 
> > > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > 
> > Implementation looks good.
> > > ---
> > > 
> > >  dtc-lexer.l  |   14 ++++++++++----
> > >  dtc-parser.y |    6 ++++++
> > >  dtc.h        |    7 +++++++
> > >  flattree.c   |    3 +++
> > >  livetree.c   |   38 +++++++++++++++++++++++++++++++++-----
> > >  5 files changed, 59 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/dtc-lexer.l b/dtc-lexer.l
> > > index 216a3d2..efa89b4 100644
> > > --- a/dtc-lexer.l
> > > +++ b/dtc-lexer.l
> > > @@ -102,6 +102,12 @@ static int pop_input_file(void);
> > >  			return DT_REMOVENODE;
> > >  		}
> > >  
> > > +<*>"/undef-prop/"	{
> > > +			DPRINT("Keyword: /undef-prop/\n");
> > > +			BEGIN_DEFAULT();
> > > +			return DT_UNDEFINED;
> > > +		}
> > > +
> > 
> > Does /undef-prop/ really need to be using <*> to match in all start
> > conditions?
> 
> It doesn't need to, but it's a good idea for it to do so, because if
> the keyword is lexed as a keyword everywhere, it will lead to more
> meaningful error messages if it's put somewhere it shouldn't be.
> 
> In fact, something I've learnt writing dtc is that in general you
> should make your lexical tokens as wide as they can without colliding
> with each other, then check that they have the right contents later.
> That way you get a clear error message from the checking code
> ("such-and-so contained an illegal character"), rather than the lexer
> breaking it into different tokens instead and the parser generating
> some cryptic error.

This is probably what David is saying. Generally you want the lexer to
be context free - meaning everything gets tokenized the same way
everywhere.

The fact that we're using various start conditions in the dtc, is a
little unsettling to me. It makes me wonder if we've got functionality
in the lexer that really should be in the parser.

Most lexers for the 'C' language have only one start condition to kick
things off.


> [snip]
> > > @@ -178,6 +179,11 @@ propdef:
> > >  		{
> > >  			$$ = build_property($1, empty_data);
> > >  		}
> > > +	| DT_PROPNODENAME '=' DT_UNDEFINED ';'
> > 
> > Hmmm.  I'm going to make this comment once, but I'll shut-up if you
> > guys disagree with me because the details have already been hashed out
> > several times, and I've already said I'd be okay with the above form.
> > 
> > The more I look at it, the more I prefer the form 
> > 	/undef-prop/ property;
> > instead of
> > 	property = /undef-prop/;
> > 
> > The reason being is that while the assignment form does work, it isn't
> > a very natural construct.  Removal is not logically the same as
> > assignment.  /undef-prop/ is something that is performed on a
> > property.  Syntax that shows /undef-prop/ being assigned as a property
> > value doesn't ring true for me as the right thing to do.
> > 
> > So, my vote is for the "/undef-prop/ property;" form, but I hold my
> > piece if you both disagree with me.
> 
> I.. yeah.. I'm not sure.  I was leaning towards prop = /undef-prop/;
> before, but you've more-or-less persuaded me here.
> 
