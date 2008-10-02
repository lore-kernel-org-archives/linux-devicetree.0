From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Thu, 2 Oct 2008 11:20:43 +1000
Message-ID: <20081002012043.GJ25598@yookeroo.seuss>
References: <20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<48E396A3.809@freescale.com>
	<20081001.094306.71131107.imp@bsdimp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081001.094306.71131107.imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 01, 2008 at 09:43:06AM -0600, Warner Losh wrote:
> > I vote against anything similar to the C preprocessor.
> 
> The advantage of the current language that's been floated here is that
> its 'execution' elements offer a far more expressive macro generation
> capability than the cpp.  cpp doesn't have for loops.  There's no way
> to convert a number to hex in cpp.

But those can be done in expressions which the macros can generate.
It's just a matter of implementing the right operators and builtin
functions.

>  Complicated if statements aren't
> possible.  And so on.  m4 allows these things, but imposes
> restrictions that make it awkward to use in this context, so it is out
> (despite my comments yesterday, and the fact I use it to genreate the
> html for my resume).  There's really no other widely available
> preprocessor that would be useful here.
> 
> Then again, I'm not sure that I completely buy into the mixing data
> definitions and execution elements being confusing.  We do that right
> now in every C program you write with global variables...  The problem
> here is that we're inventing a scripting language to generate data
> structures, much like web pages are generated in some scripting
> languages by haing the output be html.  There's little confusion
> there (and no, I'm not suggesting we use one of them :-).

Hrm, yes.  And I really dislike the idea of creating yet-another
scripting language just for our purposes.  It may be simple now, but I
greatly fear if we start down this path it will grow to become a
Turing-complete monstrosity.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
