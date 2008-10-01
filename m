From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Wed, 1 Oct 2008 14:22:34 +1000
Message-ID: <20081001042234.GG30810@yookeroo.seuss>
References: <1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<20080930.220151.41675821.imp@bsdimp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080930.220151.41675821.imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2008 at 10:01:51PM -0600, Warner Losh wrote:
> From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
> Date: Wed, 1 Oct 2008 13:46:56 +1000
> 
> > This could either be done by actually invoking cpp, using some
> > pre-and-post mangling to deal with the #-in-property-names problem.
> > Or we could build our own preprocessor that uses something other than
> > # as a magic character, but otherwise works like cpp.
> 
> There's always m4, but that has its own set of issues.

Yes.  I've thought about m4, but I'm pretty sure I don't want to go
there.

> Not sure if I should add a :-) or a :-(.
> 
> You could also s/#/$/g on the source and pass that through cpp and
> then undo it on the other side.  Assuming that cpp has been compiled
> with $ in symbol name support.

Something vaguely like that was what I had in mind - probably using
some magic based on '/' instead.  I planned to leave the processor
directives as #, but with the # only recognized in column 0.  Strictly
speaking that's a syntax change, but it won't bite any properly
indented existing source.

> The root of the problem here is that the original openfirmware spec
> wasn't 'C' and many of the new language features are aimed at a 'C'
> audience...

Well, the dtc source format has been aimed at C programmers from day
1, not just the new features.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
