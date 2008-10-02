From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Thu, 2 Oct 2008 11:18:00 +1000
Message-ID: <20081002011800.GI25598@yookeroo.seuss>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<48E396A3.809@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <48E396A3.809-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 01, 2008 at 10:26:27AM -0500, Scott Wood wrote:
> David Gibson wrote:
>> The current device tree description is purely declarative, but this
>> proposal would make it a rather odd hybrid of declarative and
>> imperative components.  I do think this could be confusing,
>> particularly to device tree newcomers who may not realise which
>> components are compile time evaluated and which go into the output
>> tree.  I had in mind a rather more functional-programming style for
>> macros/computed properties to ameliorate this.
>>
>> The several new components of not-C-feel syntax worry me greatly.
>
> Wouldn't a "more functional-programming style" be further away from
> C?

Yes and no - the preprocessor aspects of C are roughly
functional-programming style, at least in the sense I'm intending
here.  Besides, it's not the language as a whole that's supposed to be
like C - clearly it's not - it's the syntactic feel.  The idea is to
make syntactic analogies with C wherever possible, so that C
programmers writing dts files won't find themselves continually making
little syntactic mistakes.

>> If
>> you recall the one time I stepped away from C-inspired syntax in the
>> original language (bare hex constants), turned out to be a big mistake
>> requiring an incompatible source format change to fix.  I really want
>> to avoid doing that again, if we possibly can.
>
> If you really want to be as much like C as possible, nothing's stopping  
> you from just defining the data structures in real C. :-P
>
> Bare hex constants being a bad idea was not purely due to it being  
> different from C.
>
> We also have a substantial difference in the syntax of node/property  
> definitions, which forces syntax differences in other parts of the  
> lanugage to avoid ambiguity.

Yes.  But I think insufficient thought has gone into the current
proposal as to how to avoid ambiguity where we have to, while keeping
the C-syntactic-feel as much as possible.

>> I'm also concerned about adding language-level functions to the
>> language.  This requires us to have runtime notions of type and
>> symbols and carry them around for evaluation.  I still favour a
>> macro-expansion style preprocessing stage instead of semantic-level
>> functions for several reasons:
>> 	- it provides high flexibility for low conceptual complexity
>> 	- we don't have to carry around run-time evaluation structures
>> 	- it's a form familiar to C programmers from the preprocessor
>
> I vote against anything similar to the C preprocessor.

Why?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
