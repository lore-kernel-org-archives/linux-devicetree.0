From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Wed, 1 Oct 2008 13:46:56 +1000
Message-ID: <20081001034656.GF30810@yookeroo.seuss>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080930145537.GJ18313-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2008 at 08:55:37AM -0600, Grant Likely wrote:
> On Fri, Sep 26, 2008 at 03:25:47PM -0500, Jon Loeliger wrote:
> > From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  Documentation/manual.txt |  500 ++++++++++++++++++++++++++++++++++++++++++----
> >  1 files changed, 463 insertions(+), 37 deletions(-)
> 
> Hey Jon,
> 
> I don't yet have fully formed thoughts about this stuff so I've held off
> on making comments.  But FWIW, here are my initial thoughts.
> 
> I'm not convinced about the approach of interleaving the executable and
> data syntaxes.  The whole design of the existing syntax is to represent
> the data structure.  Adding additional syntax to define executable
> elements doesn't feel right to me.  I think many people will find the
> resulting file structure to be confusing.
> 
> I'm also not convinced that it is a good idea to implement a new
> interpreted language.  Any new language is a new thing that needs to be
> maintained and a new thing for users to learn.  I'd prefer to make use
> of an existing language with a library of support routines for
> maintaining an internal representation of the data and building up a
> device tree programmatically with the ability to import and manipulate
> 'stock' nodes for existing parts.  However, I haven't spent enough brain
> cell cycles on this to make any recommendations on a specific language
> or to figure out if that will just result in even more complexity for
> users.
> 
> As I said, these are just initial thoughts.  My opinion could be
> swayed.

Ah, thank you Grant, you've helped clarify by own objections to the
current proposal.

The current device tree description is purely declarative, but this
proposal would make it a rather odd hybrid of declarative and
imperative components.  I do think this could be confusing,
particularly to device tree newcomers who may not realise which
components are compile time evaluated and which go into the output
tree.  I had in mind a rather more functional-programming style for
macros/computed properties to ameliorate this.

The several new components of not-C-feel syntax worry me greatly.  If
you recall the one time I stepped away from C-inspired syntax in the
original language (bare hex constants), turned out to be a big mistake
requiring an incompatible source format change to fix.  I really want
to avoid doing that again, if we possibly can.

I'm also concerned about adding language-level functions to the
language.  This requires us to have runtime notions of type and
symbols and carry them around for evaluation.  I still favour a
macro-expansion style preprocessing stage instead of semantic-level
functions for several reasons:
	- it provides high flexibility for low conceptual complexity
	- we don't have to carry around run-time evaluation structures
	- it's a form familiar to C programmers from the preprocessor

This could either be done by actually invoking cpp, using some
pre-and-post mangling to deal with the #-in-property-names problem.
Or we could build our own preprocessor that uses something other than
# as a magic character, but otherwise works like cpp.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
